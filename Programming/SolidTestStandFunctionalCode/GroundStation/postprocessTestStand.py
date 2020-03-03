"""
  This file is designed to properly parse the mixed-output file we get from the Xbee into two separate streams
  One stream will contain temperature data and the other load cell data

"""

from sys import argv, exit
import os.path, time

TIMESTAMP_FMT = "%Y-%m-%d %H:%M:%S"

try:
  filename = argv[1]
except IndexError:
  print("The first argument should be the file to process")
  exit(1)

def modifyFilename(filename, prepend, ext=None, split="_"):
  filename, extension = os.path.splitext(filename)
  if ext is None:
    ext = extension
  # Add the majority of the path, followed by the prepend value, splitter, and the desired extension
  return os.path.join(*os.path.split(filename)[:-1], prepend+split+os.path.split(filename)[-1] + ext)

loadCell = [] # List of 3-tuples time, force, ambient temp
temps = [] # List of tuples time, thermocouples

numBad = 0
numLines = 0
try:
  fileThermo = modifyFilename(filename, "Thermo__", ".csv")
  fileLoadCell = modifyFilename(filename, "LoadCell", ".csv")
  with open(filename) as file, open(fileThermo, "w") as thermoFile, open(fileLoadCell, "w") as loadCellFile:
    thermoFile.write(",".join(["Timestamp", "Raw Seconds"] + ["Thermocouple "+str(i)+" ºC" for i in range(1,4+1)])+"\n")
    loadCellFile.write(",".join(["Timestamp", "Raw Seconds", "Load (lbs)", "Reported Temp"])+"\n")
    for line in file:
      numLines += 1
      line = line.rstrip() # Remove trailing newline
      sepLine = line.split(",")
      if len(sepLine[0]) != 15:
        print("Improper Timestamp Line, skipping:", sepLine)
        numBad += 1
        continue
      formattedTimestamp = time.strftime(TIMESTAMP_FMT, time.localtime(float(sepLine[0])))
      if "lbs" in line:
        try:
          if any(not (-200 < val < 1000) for val in map(float, [sepLine[1], sepLine[4]])) or len(sepLine) != 6:
            print("Improper load cell line:", line)
            numBad += 1
            continue
        except ValueError:
          print("Improper load cell line:", line)
          numBad += 1
          continue
        loadCellFile.write(",".join([formattedTimestamp, sepLine[0], sepLine[1], sepLine[4]])+"\n")
        loadCell.append((sepLine[0], sepLine[1], sepLine[4]))
      else:
        try:
          if any(not (-200 < val < 1000) for val in map(float, sepLine[1:])) or len(sepLine) != 5:
            print("Improper temperatures:", line)
            numBad += 1
            continue
        except ValueError:
          print("Improper temperatures:", line)
          numBad += 1
          continue
        thermoFile.write(",".join([formattedTimestamp, *sepLine])+"\n")
        temps.append(tuple(sepLine))
except FileNotFoundError:
  print("This selected file: '", filename,"' does not exist")
  exit(0)

print("Percentage of Invalid Lines: {:0.2f}%".format(numBad/numLines*100))

# Convert everything to floats to save my sanity
loadCell = list(map(lambda val: tuple(map(float, val)), loadCell))
temps    = list(map(lambda val: tuple(map(float, val)), temps))


# Now that we have written the base files, we search for events
# "Events" are defined as a 1-second period in which the force readings are 5 pounds over the average
average = sum([val[1] for val in loadCell])/len(loadCell)
buckets = [] # Sets of load readings, each reading having the same second.
secondValue = None # Initialize this
readingTemp = []
for reading in loadCell:
  if int(reading[0]) != secondValue:
    secondValue = int(reading[0]) # Go to a new second
    readingTemp = [] # Make a new temp array
    buckets.append(readingTemp) # Put a pointer to this new temp array at the end of buckets
  readingTemp.append(reading)
  
startEvent = None
stopEvent = None
for i, bucket in enumerate(buckets):
  if sum([val[1] for val in bucket])/len(bucket) > (5 + average):
    try:
      startEvent = buckets[i-2][0][0]
    except IndexError:
      startEvent = buckets[i][0][0]
  if startEvent and sum([val[1] for val in bucket])/len(bucket) < (5 + average):
    try:
      stopEvent = buckets[i+2][0][0]
    except IndexError:
      stopEvent = buckets[i][0][0]
      
if not startEvent: print("No Start Event Found!")
if not stopEvent: print("No Stop Event Found!")

tempBuffer = []
loadBuffer = []
for reading in loadCell:
  if startEvent <= reading[0] <= stopEvent:
    loadBuffer.append((reading[0]-startEvent, reading[1]-average, reading[2]))
for reading in temps:
  if startEvent <= reading[0] <= stopEvent:
    tempBuffer.append((reading[0]-startEvent,) + reading[1:])

with open(modifyFilename(filename, "output", ".csv"), "w") as file:
  file.write(",".join(["Load Timestamp", "Load (lbs)", "Ambient Temp (ºC)", "", "Temp Timestamp"] + ["Thermocouple "+str(i)+" (ºC)" for i in range(1,4+1)])+"\n")
  for lineNumber in range(max(len(loadBuffer), len(tempBuffer))):
    if lineNumber >= len(loadBuffer):
      file.write(","*5)
    else:
      file.write(",".join(map(str, loadBuffer[lineNumber]))+",,")
    if lineNumber >= len(tempBuffer):
      pass
    else:
      file.write(",".join(map(str, tempBuffer[lineNumber])))
    file.write("\n")
    
    
try:
  import xlsxwriter as excel
except ImportError:
  print("No excel writer detected, not writing excel")
else:
  print("Writing excel file with pretty graphs!")
  workbook = excel.Workbook(modifyFilename(filename, "Excel", ".xlsx"))
  worksheet = workbook.add_worksheet()
  # First write the section headers
  for i, val in enumerate(["Load Timestamp", "Load (lbs)", "Ambient Temp (ºC)", "", "Temp Timestamp"] + ["Thermocouple "+str(i)+" (ºC)" for i in range(1,4+1)]):
    if 0 <= i <= 2:
      worksheet.write_column(chr(ord("A")+i)+"1", [val]+[v[i] for v in loadBuffer])
    if 4 <= i:
      worksheet.write_column(chr(ord("A")+i)+"1", [val]+[v[i-4] for v in tempBuffer])
      
  chart = workbook.add_chart({"type": "scatter", "subtype": "straight"})
  
  loadCategories = ["Sheet1", 1, 0, len(loadBuffer)+1, 0]
  tempCategories = ["Sheet1", 1, 4, len(tempBuffer)+1, 4]
  
  chart.add_series({"categories": loadCategories, "values": ["Sheet1", 1, 1, len(loadBuffer)+1, 1], "name": ["Sheet1", 0, 1]})
  chart.add_series({"categories": loadCategories, "values": ["Sheet1", 1, 2, len(loadBuffer)+1, 2], "name": ["Sheet1", 0, 2], 'y2_axis': True,})
  chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 5, len(tempBuffer)+1, 5], "name": ["Sheet1", 0, 5], 'y2_axis': True,})
  chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 6, len(tempBuffer)+1, 6], "name": ["Sheet1", 0, 6], 'y2_axis': True,})
  chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 7, len(tempBuffer)+1, 7], "name": ["Sheet1", 0, 7], 'y2_axis': True,})
  chart.add_series({"categories": tempCategories, "values": ["Sheet1", 1, 8, len(tempBuffer)+1, 8], "name": ["Sheet1", 0, 8], 'y2_axis': True,})
  
  chart.set_size({"width": 1200, "height": 400})
  chart.set_legend({"position": "bottom"})
  chart.set_x_axis({"name": "Time Since Event Start"})
  chart.set_y_axis({"name": "Force (lbs)"})
  chart.set_y2_axis({"name": "Temperature (ºC)"})
  
  worksheet.insert_chart("A1", chart)
  
  workbook.close()
  # Then write the load cell values