* ==============================================================================
* File: CA4/PART3/MEMORY.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q3
***Library
.lib  '32nm_bulk.pm' tt
***subcircuits
*** INVERTER
.SUBCKT        Inverter      IN        OUT
MN     OUT     IN     VSS    VSS    nmos    L=Lmin   W=Wmin
MP     OUT     IN     VDD    VDD    pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0      0
.ENDS   Inverter

***T1
.SUBCKT        T1           IN     CLK    OUT
X1     CLK     CLK_BAR      Inverter
MN     OUT     CLK_BAR      IN     VSS    nmos    L=Lmin   W=Wmin
MP     OUT     CLK          IN     VDD    pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0      0
.ENDS   T1

***T2
.SUBCKT        T2           IN     CLK    OUT
X1     CLK     CLK_BAR      Inverter
MN     OUT     CLK          IN     VSS    nmos    L=Lmin   W=Wmin
MP     OUT     CLK_BAR      IN     VDD    pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0      0
.ENDS   T2

***register
.SUBCKT        REGISTER      D     CLK    Q
X1     D       CLK    N1     T1
X2     N1      I1     Inverter
X3     I1      CLK    N2     T2
X4     N2      Q      Inverter
C_1    N1      0      10f
C_2    N2      0      10f
.ENDS   REGISTER

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


***circuit MEMORY
X1      A0      CLK    Q0    REGISTER
X2      A1      CLK    Q1    REGISTER
X3      A2      CLK    Q2    REGISTER
X4      Q0      Q1     Q2    OUT1           AOI21    
X5      OUT1    CLK    OUT   REGISTER

***params
.param     Lmin=32n
.param     Wmin=32n
***test
.VEC 'VEC_3.txt'
.tran 1p 15n
.OPTION	post=2
.end
