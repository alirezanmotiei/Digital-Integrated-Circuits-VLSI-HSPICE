* ==============================================================================
* File: CA5/NAND4_extracted.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

NAND4
.INC "0.5micron.lib"
Cpar1 VDD 0 C=1.21161p
Cpar2 N1 0 C=22.95675f
* Warning: Node C has zero nodal parasitic capacitance.
Cpar3 N2 0 C=21.7485f
* Warning: Node D has zero nodal parasitic capacitance.
Cpar4 N3 0 C=18.12375f
Cpar5 GND 0 C=529.9935f
Cpar6 OUT 0 C=636.8565f
* Warning: Node A has zero nodal parasitic capacitance.
* Warning: Node B has zero nodal parasitic capacitance.

M1 OUT D VDD VDD PMOS L=6u W=10.5u AD=105p PD=41u AS=136.5p PS=47u 
* M1 DRAIN GATE SOURCE BULK (252 13.5 258 24) 
M2 OUT D N3 GND NMOS L=6u W=4.5u AD=160.5p PD=59u AS=16.875p PS=12u 
* M2 DRAIN GATE SOURCE BULK (200 -30 206 -25.5) 
M3 N3 C N2 GND NMOS L=6u W=4.5u AD=16.875p PD=12u AS=20.25p PS=13.5u 
* M3 DRAIN GATE SOURCE BULK (186.5 -30 192.5 -25.5) 
M4 N2 B N1 GND NMOS L=6u W=4.5u AD=20.25p PD=13.5u AS=21.375p PS=14u 
* M4 DRAIN GATE SOURCE BULK (171.5 -30 177.5 -25.5) 
M5 N1 A GND GND NMOS L=6u W=4.5u AD=21.375p PD=14u AS=189p PS=65u 
* M5 DRAIN GATE SOURCE BULK (156 -30 162 -25.5) 
M6 OUT C VDD VDD PMOS L=6u W=10.5u AD=105p PD=41u AS=136.5p PS=47u 
* M6 DRAIN GATE SOURCE BULK (193 13.5 199 24) 
M7 OUT B VDD VDD PMOS L=6u W=10.5u AD=105p PD=41u AS=136.5p PS=47u 
* M7 DRAIN GATE SOURCE BULK (133.5 13.5 139.5 24) 
M8 OUT A VDD VDD PMOS L=6u W=10.5u AD=105p PD=41u AS=136.5p PS=47u 
* M8 DRAIN GATE SOURCE BULK (75 13.5 81 24) 


* Total Nodes: 10
* Total Elements: 19
* Total Number of Shorted Elements not written to the SPICE file: 0
* Extract Elapsed Time: 0 seconds

Vsupply    VDD GND  1



***********Param***********
.param      GND=0

***********Sim***********
.op
.tran   1p       2m

.VEC 'VEC.txt'
.OPTION	post=2


.END
