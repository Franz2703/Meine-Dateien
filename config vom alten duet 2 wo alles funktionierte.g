; Configuration file for Duet WiFi (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.4 on Wed Sep 02 2020 11:51:48 GMT+0200 (Mitteleuropäische Sommerzeit)

; General preferences
G90                                                ; send absolute coordinates...
M83                                                ; ...but relative extruder moves
M550 P"Ender 3 Pro"                                ; set printer name
M918 P1 E4 F2000000                                ; configure direct-connect display

; Network
M552 S1                                            ; enable network
M586 P0 S1                                         ; enable HTTP
M586 P1 S0                                         ; disable FTP
M586 P2 S0                                         ; disable Telnet

; Drives
M569 P0 S0                                         ; physical drive 0 goes backwards
M569 P1 S0                                         ; physical drive 1 goes backwards
M569 P2 S1                                         ; physical drive 2 goes forwards
M569 P3 S0                                         ; physical drive 3 goes backwards
M584 X0 Y1 Z2 E3                                   ; set drive mapping
M350 X16 Y16 Z16 E16 I1                            ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E93.00                   ; set steps per mm
M566 X1200.00 Y1200.00 Z24.00 E300.00              ; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z180.00 E6000.00            ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z100.00 E5000.00              ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E1000 I50                      ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                                   ; set axis minima
M208 X235 Y235 Z260 S0                             ; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                                ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                                ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"zstop"                                ; configure active-high endstop for low end on Z via pin zstop

; Z-Probe
M558 P0 H5 F120 T6000                              ; disable Z probe but set dive height, probe speed and travel speed
M557 X15:215 Y15:195 S20                           ; define mesh grid

; Heaters
; Heated Bed
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092		; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0					; create bed heater output on bedheat and map it to sensor 0
M307 H0 B1 S1.00					; enable bang-bang mode for the bed heater and set PWM limit
M307 H0 A340.0, C490.0, D50.5 S1.0
M140 H0							; map heated bed to heater 0
M143 H0 S110					;!	; set temperature limit for heater 0 to 110C

; Hotend
M308 S1 P"e0temp" Y"thermistor" T500000 B4723 C1.196220e-7		; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1					; create nozzle heater output on e0heat and map it to sensor 1
;M307 H1 B0 S1.00				;!	; disable bang-bang mode for heater  and set PWM limit
M307 H1 A7.489, C131.7, D8.9 S0.0		;!	; Deine Werte für das Hotend sind eingesetzt aus Deinem Bild!
M143 H1 S300					;!	; set temperature limit for heater 1 to 300C
M501 ;


; Fans
M950 F0 C"fan0" Q500					; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1						; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500					; create fan 1 on pin fan1 and set its frequency
M106 P1 S1 H1 T45					; set fan 1 value. Thermostatic control is turned on
M950 F2 C"fan2" Q500					; create fan 2 on pin fan2 and set its frequency
M106 P2 S1 H1:0 T45					; set fan 2 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0					; define tool 0
G10 P0 X0 Y0 Z0						; set tool 0 axis offsets
G10 P0 R0 S0						; set initial tool 0 active and standby temperatures to 0C

; Miscellaneous
M575 P1 B57600 P1 S1
M911 S10 R11 P
;M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000			; set voltage thresholds and actions to run on power loss

