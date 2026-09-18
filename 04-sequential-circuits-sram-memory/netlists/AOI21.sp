* ==============================================================================
* File: CA4/PART1/AOI21.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q1
***Library
.lib  '32nm_bulk.pm' tt

***AOI21
.SUBCKT AOI21     A0        A1       A2       Y
M1      N1        A0        GND     GND     nmos    L=Lmin    W='Wmin*2'
M2      Y         A1        N1      GND     nmos    L=Lmin    W='Wmin*2'
M3      Y         A2        GND     GND     nmos    L=Lmin    W='Wmin*1'
M4      Y         A2        N2      VDD     pmos    L=Lmin    W='Wmin*4'
M5      N2        A1        VDD     VDD     pmos    L=Lmin    W='Wmin*4'
M6      N2        A0        VDD     VDD     pmos    L=Lmin    W='Wmin*4'
Vsupply VDD      GND      1
.ENDS   AOI21

***Circuit
X1      A0        A1        A2       Y      AOI21

.VEC 'VEC_1.txt'
***params
.param      GND=0
.param      Lmin=32n
.param      Wmin=32n

***test
.op
.tran   1p  10n

***Delay
.measure         tran     tHL     trig    V(A0)     td = 5n    val = 0.5    cross=1    targ    V(Y)      td = 5n    val = 0.5    cross=1
.measure         tran     tLH     trig    V(A0)     td = 4n    val = 0.5    cross=1    targ    V(Y)      td = 4n    val = 0.5    cross=1

.OPTION	post=2
.end
