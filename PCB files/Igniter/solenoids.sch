EESchema Schematic File Version 4
LIBS:power
LIBS:device
LIBS:74xx
LIBS:audio
LIBS:interface
LIBS:Igniter-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5775 2255 0    50   ~ 0
Solenoid Drivers
$Comp
L Device:L L2
U 1 1 5DB4DF08
P 4360 2815
F 0 "L2" H 4413 2861 50  0000 L CNN
F 1 "L" H 4413 2770 50  0000 L CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 4360 2815 50  0001 C CNN
F 3 "~" H 4360 2815 50  0001 C CNN
	1    4360 2815
	1    0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 5DB4DF0F
P 4040 2815
F 0 "D6" V 3994 2894 50  0000 L CNN
F 1 "D" V 4085 2894 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 4040 2815 50  0001 C CNN
F 3 "~" H 4040 2815 50  0001 C CNN
	1    4040 2815
	0    1    1    0   
$EndComp
Wire Wire Line
	4360 2665 4040 2665
Wire Wire Line
	4040 2965 4360 2965
Connection ~ 4360 2665
Wire Wire Line
	3915 3280 4060 3280
Text Notes 4525 2895 0    50   ~ 0
Solenoid\nValve
Wire Wire Line
	4360 2560 4360 2665
Wire Wire Line
	4360 3080 4360 2965
Connection ~ 4360 2965
$Comp
L power:GNDREF #PWR029
U 1 1 5DB4DF2B
P 4360 3545
F 0 "#PWR029" H 4360 3295 50  0001 C CNN
F 1 "GNDREF" H 4365 3372 50  0001 C CNN
F 2 "" H 4360 3545 50  0001 C CNN
F 3 "" H 4360 3545 50  0001 C CNN
	1    4360 3545
	1    0    0    -1  
$EndComp
Wire Wire Line
	4360 3480 4360 3545
$Comp
L Device:L L4
U 1 1 5DB4DF33
P 4355 4290
F 0 "L4" H 4408 4336 50  0000 L CNN
F 1 "L" H 4408 4245 50  0000 L CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 4355 4290 50  0001 C CNN
F 3 "~" H 4355 4290 50  0001 C CNN
	1    4355 4290
	1    0    0    -1  
$EndComp
$Comp
L Device:D D8
U 1 1 5DB4DF3A
P 4035 4290
F 0 "D8" V 3989 4369 50  0000 L CNN
F 1 "D" V 4080 4369 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 4035 4290 50  0001 C CNN
F 3 "~" H 4035 4290 50  0001 C CNN
	1    4035 4290
	0    1    1    0   
$EndComp
Wire Wire Line
	4355 4140 4035 4140
Wire Wire Line
	4035 4440 4355 4440
Connection ~ 4355 4140
Wire Wire Line
	3910 4755 4055 4755
Text Notes 4520 4370 0    50   ~ 0
Solenoid\nValve
Wire Wire Line
	4355 4035 4355 4140
Wire Wire Line
	4355 4555 4355 4440
Connection ~ 4355 4440
$Comp
L power:GNDREF #PWR033
U 1 1 5DB4DF56
P 4355 5020
F 0 "#PWR033" H 4355 4770 50  0001 C CNN
F 1 "GNDREF" H 4360 4847 50  0001 C CNN
F 2 "" H 4355 5020 50  0001 C CNN
F 3 "" H 4355 5020 50  0001 C CNN
	1    4355 5020
	1    0    0    -1  
$EndComp
Wire Wire Line
	4355 4955 4355 5020
$Comp
L Device:L L3
U 1 1 5DB4DF5E
P 6020 2815
F 0 "L3" H 6073 2861 50  0000 L CNN
F 1 "L" H 6073 2770 50  0000 L CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 6020 2815 50  0001 C CNN
F 3 "~" H 6020 2815 50  0001 C CNN
	1    6020 2815
	1    0    0    -1  
$EndComp
$Comp
L Device:D D7
U 1 1 5DB4DF65
P 5700 2815
F 0 "D7" V 5654 2894 50  0000 L CNN
F 1 "D" V 5745 2894 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 5700 2815 50  0001 C CNN
F 3 "~" H 5700 2815 50  0001 C CNN
	1    5700 2815
	0    1    1    0   
$EndComp
Wire Wire Line
	6020 2665 5700 2665
Wire Wire Line
	5700 2965 6020 2965
Connection ~ 6020 2665
Wire Wire Line
	5575 3280 5720 3280
Wire Wire Line
	6020 2560 6020 2665
Wire Wire Line
	6020 3080 6020 2965
Connection ~ 6020 2965
$Comp
L power:GNDREF #PWR030
U 1 1 5DB4DF80
P 6020 3545
F 0 "#PWR030" H 6020 3295 50  0001 C CNN
F 1 "GNDREF" H 6025 3372 50  0001 C CNN
F 2 "" H 6020 3545 50  0001 C CNN
F 3 "" H 6020 3545 50  0001 C CNN
	1    6020 3545
	1    0    0    -1  
$EndComp
Wire Wire Line
	6020 3480 6020 3545
$Comp
L Device:L L5
U 1 1 5DB4DF88
P 6015 4290
F 0 "L5" H 6068 4336 50  0000 L CNN
F 1 "L" H 6068 4245 50  0000 L CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 6015 4290 50  0001 C CNN
F 3 "~" H 6015 4290 50  0001 C CNN
	1    6015 4290
	1    0    0    -1  
$EndComp
$Comp
L Device:D D9
U 1 1 5DB4DF8F
P 5695 4290
F 0 "D9" V 5649 4369 50  0000 L CNN
F 1 "D" V 5740 4369 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 5695 4290 50  0001 C CNN
F 3 "~" H 5695 4290 50  0001 C CNN
	1    5695 4290
	0    1    1    0   
$EndComp
Wire Wire Line
	6015 4140 5695 4140
Wire Wire Line
	5695 4440 6015 4440
Connection ~ 6015 4140
Wire Wire Line
	5570 4755 5715 4755
Text Notes 6180 4370 0    50   ~ 0
Solenoid\nValve
Wire Wire Line
	6015 4035 6015 4140
Wire Wire Line
	6015 4555 6015 4440
Connection ~ 6015 4440
$Comp
L power:GNDREF #PWR034
U 1 1 5DB4DFAB
P 6015 5020
F 0 "#PWR034" H 6015 4770 50  0001 C CNN
F 1 "GNDREF" H 6020 4847 50  0001 C CNN
F 2 "" H 6015 5020 50  0001 C CNN
F 3 "" H 6015 5020 50  0001 C CNN
	1    6015 5020
	1    0    0    -1  
$EndComp
Wire Wire Line
	6015 4955 6015 5020
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DB4DFB4
P 4260 3280
AR Path="/5D9BEB88/5DB4DFB4" Ref="Q?"  Part="1" 
AR Path="/5DB4DFB4" Ref="Q?"  Part="1" 
AR Path="/5DB4D508/5DB4DFB4" Ref="Q3"  Part="1" 
F 0 "Q3" H 4466 3326 50  0001 L CNN
F 1 "N MOSFET" H 4466 3280 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 4460 3380 50  0001 C CNN
F 3 "~" H 4260 3280 50  0001 C CNN
	1    4260 3280
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DB4DFBA
P 5920 3280
AR Path="/5D9BEB88/5DB4DFBA" Ref="Q?"  Part="1" 
AR Path="/5DB4DFBA" Ref="Q?"  Part="1" 
AR Path="/5DB4D508/5DB4DFBA" Ref="Q4"  Part="1" 
F 0 "Q4" H 6126 3326 50  0001 L CNN
F 1 "N MOSFET" H 6126 3280 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 6120 3380 50  0001 C CNN
F 3 "~" H 5920 3280 50  0001 C CNN
	1    5920 3280
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DB4DFC0
P 5915 4755
AR Path="/5D9BEB88/5DB4DFC0" Ref="Q?"  Part="1" 
AR Path="/5DB4DFC0" Ref="Q?"  Part="1" 
AR Path="/5DB4D508/5DB4DFC0" Ref="Q6"  Part="1" 
F 0 "Q6" H 6121 4801 50  0001 L CNN
F 1 "N MOSFET" H 6121 4755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 6115 4855 50  0001 C CNN
F 3 "~" H 5915 4755 50  0001 C CNN
	1    5915 4755
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DB4DFC6
P 4255 4755
AR Path="/5D9BEB88/5DB4DFC6" Ref="Q?"  Part="1" 
AR Path="/5DB4DFC6" Ref="Q?"  Part="1" 
AR Path="/5DB4D508/5DB4DFC6" Ref="Q5"  Part="1" 
F 0 "Q5" H 4461 4801 50  0001 L CNN
F 1 "N MOSFET" H 4461 4755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 4455 4855 50  0001 C CNN
F 3 "~" H 4255 4755 50  0001 C CNN
	1    4255 4755
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5DB4DFCC
P 7715 2800
F 0 "L1" H 7768 2846 50  0000 L CNN
F 1 "L" H 7768 2755 50  0000 L CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5566-04A_2x02_P4.20mm_Vertical" H 7715 2800 50  0001 C CNN
F 3 "~" H 7715 2800 50  0001 C CNN
	1    7715 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 5DB4DFD3
P 7395 2800
F 0 "D5" V 7349 2879 50  0000 L CNN
F 1 "D" V 7440 2879 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P10.16mm_Horizontal" H 7395 2800 50  0001 C CNN
F 3 "~" H 7395 2800 50  0001 C CNN
	1    7395 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	7715 2650 7395 2650
Wire Wire Line
	7395 2950 7715 2950
Connection ~ 7715 2650
Wire Wire Line
	7270 3265 7415 3265
Text Notes 7880 2880 0    50   ~ 0
Solenoid\nValve
Wire Wire Line
	7715 2545 7715 2650
Wire Wire Line
	7715 3065 7715 2950
Connection ~ 7715 2950
$Comp
L power:GNDREF #PWR028
U 1 1 5DB4DFEF
P 7715 3530
F 0 "#PWR028" H 7715 3280 50  0001 C CNN
F 1 "GNDREF" H 7720 3357 50  0001 C CNN
F 2 "" H 7715 3530 50  0001 C CNN
F 3 "" H 7715 3530 50  0001 C CNN
	1    7715 3530
	1    0    0    -1  
$EndComp
Wire Wire Line
	7715 3465 7715 3530
$Comp
L Device:Q_NMOS_GDS Q?
U 1 1 5DB4DFF7
P 7615 3265
AR Path="/5D9BEB88/5DB4DFF7" Ref="Q?"  Part="1" 
AR Path="/5DB4DFF7" Ref="Q?"  Part="1" 
AR Path="/5DB4D508/5DB4DFF7" Ref="Q2"  Part="1" 
F 0 "Q2" H 7821 3311 50  0001 L CNN
F 1 "N MOSFET" H 7821 3265 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-3_TabPin2" H 7815 3365 50  0001 C CNN
F 3 "~" H 7615 3265 50  0001 C CNN
	1    7615 3265
	1    0    0    -1  
$EndComp
Text HLabel 3915 3280 0    50   Input ~ 0
SOL1
Text HLabel 5575 3280 0    50   Input ~ 0
SOL2
Text HLabel 3910 4755 0    50   Input ~ 0
SOL3
Text HLabel 5570 4755 0    50   Input ~ 0
SOL4
Text HLabel 7270 3265 0    50   Input ~ 0
SOL5
$Comp
L power:+24V #PWR026
U 1 1 5DBB6885
P 4360 2560
F 0 "#PWR026" H 4360 2410 50  0001 C CNN
F 1 "+24V" H 4375 2733 50  0000 C CNN
F 2 "" H 4360 2560 50  0001 C CNN
F 3 "" H 4360 2560 50  0001 C CNN
	1    4360 2560
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR027
U 1 1 5DBB6A3C
P 6020 2560
F 0 "#PWR027" H 6020 2410 50  0001 C CNN
F 1 "+24V" H 6035 2733 50  0000 C CNN
F 2 "" H 6020 2560 50  0001 C CNN
F 3 "" H 6020 2560 50  0001 C CNN
	1    6020 2560
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR025
U 1 1 5DBB6B6A
P 7715 2545
F 0 "#PWR025" H 7715 2395 50  0001 C CNN
F 1 "+24V" H 7730 2718 50  0000 C CNN
F 2 "" H 7715 2545 50  0001 C CNN
F 3 "" H 7715 2545 50  0001 C CNN
	1    7715 2545
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR031
U 1 1 5DBB6F27
P 4355 4035
F 0 "#PWR031" H 4355 3885 50  0001 C CNN
F 1 "+24V" H 4370 4208 50  0000 C CNN
F 2 "" H 4355 4035 50  0001 C CNN
F 3 "" H 4355 4035 50  0001 C CNN
	1    4355 4035
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR032
U 1 1 5DBB7018
P 6015 4035
F 0 "#PWR032" H 6015 3885 50  0001 C CNN
F 1 "+24V" H 6030 4208 50  0000 C CNN
F 2 "" H 6015 4035 50  0001 C CNN
F 3 "" H 6015 4035 50  0001 C CNN
	1    6015 4035
	1    0    0    -1  
$EndComp
Wire Notes Line
	8425 2290 8425 5260
Wire Notes Line
	8425 5260 3275 5260
Wire Notes Line
	3275 5260 3275 2290
Wire Notes Line
	3270 2290 8425 2290
Text Notes 6205 2890 0    50   ~ 0
Solenoid\nValve
$EndSCHEMATC
