* ==============================================================================
* File: CA1/Q3/Q3_1_a.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q3
***Library
.inc 'PTM_180nm.txt'
******components
M1     VDD     VDD     v2      0   NMOS    0.18u   4u
M2     v2       v2      0      0   NMOS    0.18u   4u
vdd    VDD    0     sweep_parameter
******parameters
.param     sweep_parameter=0
******simulation
.op
.OPTIONS Post=2
.DC     sweep_parameter     0   6   0.01
.end

