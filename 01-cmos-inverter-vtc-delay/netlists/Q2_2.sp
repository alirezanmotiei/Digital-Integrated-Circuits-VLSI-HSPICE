* ==============================================================================
* File: CA1/Q2/Q2_2.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q2
***Library
.inc 'PTM_180nm.txt'
******components
M2     d   g    0   0    PMOS    180n    4u
vdd    d    0     -1*vsd
vg     0    g      Vsg
******parameters
.param     vsd=1
.param      Vsg=0.6
******simulation
.op
.OPTIONS Post=2
.DC     vsd     0   1.5   0.01
.end

