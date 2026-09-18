* ==============================================================================
* File: CA1/Q3/Q3_2_b.sp
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
M1     v4     v4     VDD      VDD   PMOS    0.18u   W=2*w
M2     v4     v4      0        0    NMOS    0.18u   W=w
vdd    VDD    0     3
******parameters
.param     w=0.1u
******simulation
.op
.OPTIONS Post=2
.DC     w     0.1u   5u   0.01u
.end

