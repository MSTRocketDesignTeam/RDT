import sys
import os
from os import path
import glob
import serial
import PySimpleGUI as sg
from os.path import join
from GSModules import ListComPorts

# Sets background and button color
sg.change_look_and_feel('DarkAmber')
filePath = path.dirname(__file__)
rootPath = path.abspath(path.join(filePath, "..", "Pressure Logs"))
COMSelector = [[sg.Text('COM Ports:')],
               [sg.Combo(values=ListComPorts.serial_ports(), enable_events=False, size=(20, 3), key='COM_Combo'),
                sg.Button('Refresh', button_color=('Black', "#FDCB52"), key='COM_Refresh'),
                sg.Button('Open', button_color=('White', "Red"), key='COM_Connect'),
                sg.Button('Enquire', button_color=('White', 'Red'), key='COM_Enquire'),
                sg.Button('Configure Arduino', button_color=('White', 'Red'), key='Configure')]]

# Raw Data Text Box
rawDisplay = [[sg.Text('Raw Display', background_color='#2B2B2B', justification='center', size=(60, 4))],
              [sg.Text('', size=(35, 1), key='COM_Display', background_color='#2B2B2B')]]

# Buttons for valves
valves = [[sg.Text('VALVES')],
          [sg.Button('Main CH4', button_color=('White', 'Red'), key="VALVE" + str(0)),
          sg.Button('Main GOX', button_color=('White', 'Red'), key="VALVE" + str(1)),
          sg.Button('Fire CH4', button_color=('White', 'Red'), key="VALVE" + str(2)),
          sg.Button('Fire GOX', button_color=('White', 'Red'), key="VALVE" + str(3)),
          sg.Button('N2', button_color=('White', 'Red'), key="VALVE" + str(4)),
          sg.Button('Igniter', button_color=('White', 'Red'), key="VALVE" + str(5)),]
]
valves_imgs = {'Green':{
                    0: join("img", 'GreenValveVert.png'),
                    1: join("img", 'GreenValveVert.png'),
                    2: join("img", 'GreenValveHorz.png'),
                    3: join("img", 'GreenValveHorz.png'),
                    4: join("img", 'GreenValveVert.png'),
                    5: join("img", 'GreenIgniter.png'),},
               'Red':{
                    0: join("img", 'RedValveVert.png'),
                    1: join("img", 'RedValveVert.png'),
                    2: join("img", 'RedValveHorz.png'),
                    3: join("img", 'RedValveHorz.png'),
                    4: join("img", 'RedValveVert.png'),
                    5: join("img", 'RedIgniter.png'),}}
valves_pos = {
    0: (21,196),
    1: (183,197),
    2: (57,42),
    3: (138,41),
    4: (102,178),
    5: (98,105),
}

#sg.Image(join("img", 'IgniterDiagram.png'), key='IMAGE', size=(400, 400))
# Igniter diagram
graph = [[sg.Graph(
            canvas_size=(300, 300),
            graph_bottom_left=(0, 300),
            graph_top_right=(300, 0),
            key="DIAGRAM",
            change_submits=True,
            drag_submits=True
)],]


# Staged buttons
stages = [[sg.Text('STAGES')],
          [sg.Button('ARM', button_color=('White', 'Red'), key="STAGE" + str(0)),
          sg.Button('FIRE', button_color=('White', 'Red'), key="STAGE" + str(1)),
          sg.Button('PURGE', button_color=('White', 'Red'), key="STAGE" + str(2)),
          sg.Button('CLOSE ALL', button_color=('White', 'Red'), key="STAGE" + str(3))]]

# Sensor reading text elements
readings = [[sg.Text('Pressure 1:'), sg.Text('XXXXXXXXXX', key='P1'), sg.Text('PSI')],
            [sg.Text('Pressure 2:'), sg.Text('XXXXXXXXXX', key='P2'), sg.Text('PSI')],
            [sg.Text('Pressure 3:'), sg.Text('XXXXXXXXXX', key='P3'), sg.Text('PSI')],
            [sg.Text('Pressure 4:'), sg.Text('XXXXXXXXXX', key='P4'), sg.Text('PSI')]]

menu_def = [['&File', ['&Open', '&Save       Ctrl-S', '&Properties', 'E&xit']],
            ['&Edit', ['&Paste', ['Special', 'Normal', ], 'Undo'], ],
            ['&Toolbar', ['---', 'Command &1', 'Command &2',
                          '---', 'Command &3', 'Command &4']],
            ['&Help', '&About...'], ]

dropdown_menu = [
    [sg.Menu(menu_def, tearoff=False, pad=(200, 1), key='dropdown')],
]

#Work in progress, aiming for task manager style live graphs
pressure_graph = [[sg.Graph(canvas_size=(400, 400),
        graph_bottom_left=(-105,-105),
        graph_top_right=(105,105),
        background_color='white',
        key='graph',
        tooltip='Graph of Pressure Data')]]
# graph_window = sg.Window('Graph of Sine Function', pressure_graph, grab_anywhere=True).Finalize()
# graph = graph_window['graph']

#ADD KEYS TO FILE BROWSER
file_browser = [
    [sg.Text('Select Log Folder:', size=(13, 1), auto_size_text=False, justification='right'),
     sg.In(rootPath, key='input'), sg.FolderBrowse(target='input'), sg.Button('Start Recording', button_color=('White', 'Red'), key='filein')]]

    # Combination of all elements
layout = dropdown_menu + valves + COMSelector + graph + stages + readings + file_browser