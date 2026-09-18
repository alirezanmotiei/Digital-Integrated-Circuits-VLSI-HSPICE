* ==============================================================================
* File: CA1/Q1/Q1_4.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q1
***Library
.inc 'PTM_180nm.txt'
******components
M1     d    g     0    0    NMOS    180n    4u
vdd    d    0     vds
vg     g    0      Vgs
******parameters
.param     vds=1
.param      Vgs=1
******simulation
.op
.OPTIONS Post=2
.DC     vds     0   1.5   0.01
.end

