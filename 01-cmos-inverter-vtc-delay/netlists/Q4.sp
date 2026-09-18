* ==============================================================================
* File: CA1/Q4/Q4.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q4
***Library
.inc 'PTM_180nm.txt'
******components
M1     vout     vin     0      0   NMOS    0.18u   0.6u
M2     vout     vin    VDD    VDD  PMOS    0.18u   W=w2
vdd    VDD    0     1.8
V_input     vin     0      0.8
******parameters
.param     w2=0.1u
******simulation
.op
.OPTIONS Post=2
.DC     w2     0.1u   3u   0.01u
.end

