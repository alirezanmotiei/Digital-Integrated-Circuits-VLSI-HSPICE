* ==============================================================================
* File: CA3/NAND3.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

Q2
***Library
.lib    '32nm_bulk.l'  tt

***NAND3
.SUBCKT NAND3    CLK      A       B       C       Y
MN1     N3       CLK      VSS     VSS     nmos    L=Lmin    W='Wmin*4'
MN2     Y        A        N1      VSS     nmos    L=Lmin    W='Wmin*4'
MN3     N1       B        N2      VSS     nmos    L=Lmin    W='Wmin*4'
MN4     N2       C        N3      VSS     nmos    L=Lmin    W='Wmin*4'
MP1     Y        CLK      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
Vsupply VDD      0        1
v_Zero_ground    VSS      0       0
.ENDS   NAND3

***INVERTER gate subcircuit
.SUBCKT     Inverter   IN      OUT
MN     OUT     IN     VSS      VSS   nmos    L=Lmin   W=Wmin
MP     OUT     IN     VDD      VDD   pmos    L=Lmin   W='Wmin*2'
V_in   VDD     0      1
v_Zero_ground  VSS    0        0
.ENDS   Inverter


***NAND3_PRO
.SUBCKT NAND3_PRO    CLK      A       B       C       Y
MN1     N3           CLK      VSS     VSS     nmos    L=Lmin    W='Wmin*4'
MN2     Y            A        N1      VSS     nmos    L=Lmin    W='Wmin*4'
MN3     N1           B        N2      VSS     nmos    L=Lmin    W='Wmin*4'
MN4     N2           C        N3      VSS     nmos    L=Lmin    W='Wmin*4'
MP1     Y            CLK      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
X1      Y            Y_BAR    Inverter
Mbl     Y            Y_BAR    VDD     VDD     pmos    L=Lmin    W='Wmin*0.5'
Vsupply VDD          0        1
v_Zero_ground        VSS      0       0
.ENDS   NAND3_PRO

***Circuit
*X1      CLK      A        B       C       Y       NAND3
X2      CLK      A        B       C       Y       NAND3_PRO
***Param
.param      Lmin=32n
.param      Wmin=32n

.VEC 'VEC_2.txt'

***test
.tran   1p       45n
***Delay
.measure         tran     tHL1    trig    V(C)    td = 25n    val = 0.5    rise=1    targ    V(Y)      td = 25n    val = 0.5    fall=1

***Power
.measure         tran     DCMOS_tf1      trig    V(C)     td = 27n    val = 0.001    cross=1    targ    V(Y)      td = 27n    val = 0.001    cross=1
.measure         tran     DCMOS_tr1      trig    V(CLK)   td = 28n    val = 0.999    cross=1    targ    V(Y)      td = 28n    val = 0.999    cross=1

*Static power
.measure         tran     static_power_high        AVG          power        from = 9n       to = 10n
.measure         tran     static_power_low         AVG          power        from = 27.0628n to = 28n

*Dynamic power
.measure         tran     dynamic_power_hl         AVG          power        from = 27.025n     to = 27.0628n
.measure         tran     dynamic_power_lh         AVG          power        from = 28.025n     to = 28.433n

.OPTION	post=2
.end