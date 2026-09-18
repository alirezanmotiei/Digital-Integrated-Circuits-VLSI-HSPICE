* ==============================================================================
* File: CA4/PART2/register.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q2
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
.SUBCKT        T1           IN     CLK    OUT  CLK_BAR 
*X1     CLK     CLK_BAR      Inverter
X1      CLK      A        Inverter
X2      A        B        Inverter
X3      B        C        Inverter
X4      C        D        Inverter
X5      D        CLKbar   Inverter
MN     OUT     CLK_BAR      IN     VSS    nmos    L=Lmin   W=Wmin
MP     OUT     CLK          IN     VDD    pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0      0
.ENDS   T1

***T2
.SUBCKT        T2           IN     CLK    OUT  
*X1     CLK     CLK_BAR      Inverter
X1      CLK      A        Inverter
X2      A        B        Inverter
X3      B        C        Inverter
X4      C        D        Inverter
X5      D        CLKbar   Inverter
MN     OUT     CLK          IN     VSS    nmos    L=Lmin   W=Wmin
MP     OUT     CLK_BAR      IN     VDD    pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0      0
.ENDS   T2



***circuit register
X1     D       CLK    N1    CLK_BAR     T1
X2     N1      I1     Inverter
X3     I1      CLK    N2     T2
X4     N2      Q      Inverter

C_1    N1      0      10f
C_2    N2      0      10f
***params
.param     Lmin=32n
.param     Wmin=32n

***test
.VEC 'VEC_2.txt'
.tran 1p 15n
.measure         tran     t_setup         trig    V(D)     td = 5n     val = 0.5    cross=1    targ    V(N1)     td = 5n       val = 0.5    cross=1
.measure         tran     t_rise          trig    V(Q)     td = 6n     val = 0.1    cross=1    targ    V(Q)      td = 6n       val = 0.9    cross=1
.measure         tran     t_fall          trig    V(Q)     td = 10n    val = 0.9    cross=1    targ    V(Q)      td = 10n      val = 0.1    cross=1
.measure         tran     t_CLK_Q         trig    V(CLK)   td = 6n     val = 0.5    cross=1    targ    V(Q)      td = 6n       val = 0.5    cross=1
.OPTION	post=2
.end
