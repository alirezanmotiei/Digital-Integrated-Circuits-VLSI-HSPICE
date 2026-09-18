* ==============================================================================
* File: CA3/CA3-Q1.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

CA3_Q1
***********Library***********
.lib    '32nm_bulk.l'  tt

***********STATIC CMOS***********
.SUBCKT STATIC   A        B       C       F
M1      X        A        GND     GND     nmos    L=Lmin    W='Wmin*2'
M2      X        B        GND     GND     nmos    L=Lmin    W='Wmin*2'
M3      F        C        X       GND     nmos    L=Lmin    W='Wmin*2'
M4      F        B        Y       VDD     pmos    L=Lmin    W='Wmin*4'
M5      Y        A        VDD     VDD     pmos    L=Lmin    W='Wmin*4'
M6      F        C        VDD     VDD     pmos    L=Lmin    W='Wmin*4'
Vsupply VDD      GND      VCC
.ENDS   STATIC

***********INVERTER***********
.SUBCKT INV      Vin      Vout 
M1      Vout     Vin      GND     GND     nmos    L=Lmin    W=Wmin
M2      Vout     Vin      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
Vsupply VDD      GND      VCC
.ENDS   INV

***********DCVSL***********
.SUBCKT DCVSL    A        B       C       F
M1      X        A        GND     GND     nmos    L=Lmin    W='Wmin*2'
M2      X        B        GND     GND     nmos    L=Lmin    W='Wmin*2'
M3      F        C        X       GND     nmos    L=Lmin    W='Wmin*2'
M4      F        Fbar     VDD     VDD     pmos    L=Lmin    W='Wmin*2'
M5      Y        Bbar     GND     GND     nmos    L=Lmin    W='Wmin*2'
M6      Fbar     Abar     Y       GND     nmos    L=Lmin    W='Wmin*2'
M7      Fbar     Cbar     GND     GND     nmos    L=Lmin    W='Wmin*1'
M8      Fbar     F        VDD     VDD     pmos    L=Lmin    W='Wmin*2'
X1      A        Abar     INV
X2      B        Bbar     INV
X3      C        Cbar     INV
Vsupply VDD      GND      VCC
.ENDS   DCVSL

***********Circuit***********
X1      A        B        C       F1      STATIC
X2      A        B        C       F2      DCVSL

***********Param***********
.param      GND=0
.param      Lmin=32n
**
.param      Wmin=160n
**
.param      VCC=1

***********Sim***********
.op
.tran   1p       7n
* .temp 100
***********Delay Measurements*********
*STATIC
.measure         tran     STATIC_tHL1     trig    V(C)     td = 2.4n    val = 0.5    cross=1    targ    V(F1)      td = 2.4n    val = 0.5    cross=1
.measure         tran     STATIC_tLH1     trig    V(B)     td = 3.2n    val = 0.5    cross=1    targ    V(F1)      td = 3.2n    val = 0.5    cross=1
.measure         tran     STATIC_tHL2     trig    V(C)     td = 4n      val = 0.5    cross=1    targ    V(F1)      td = 4n      val = 0.5    cross=1
.measure         tran     STATIC_tLH2     trig    V(B)     td = 4.8n    val = 0.5    cross=1    targ    V(F1)      td = 4.8n    val = 0.5    cross=1
.measure         tran     STATIC_tHL3     trig    V(C)     td = 5.6n    val = 0.5    cross=1    targ    V(F1)      td = 5.6n    val = 0.5    cross=1

*DCVSL
.measure         tran     DCVSL_tHL1      trig    V(C)     td = 2.4n    val = 0.5    cross=1    targ    V(F2)      td = 2.4n    val = 0.5    cross=1
.measure         tran     DCVSL_tLH1      trig    V(B)     td = 3.2n    val = 0.5    cross=1    targ    V(F2)      td = 3.2n    val = 0.5    cross=1
.measure         tran     DCVSL_tHL2      trig    V(C)     td = 4n      val = 0.5    cross=1    targ    V(F2)      td = 4n      val = 0.5    cross=1
.measure         tran     DCVSL_tLH2      trig    V(B)     td = 4.8n    val = 0.5    cross=1    targ    V(F2)      td = 4.8n    val = 0.5    cross=1
.measure         tran     DCVSL_tHL3      trig    V(C)     td = 5.6n    val = 0.5    cross=1    targ    V(F2)      td = 5.6n    val = 0.5    cross=1

***********Power Measurements*********
*Static power
.measure         tran     static_power_high           AVG          power        from = 0n to = 0.8n
.measure         tran     static_power_low_            AVG          power        from = 2.4n to = 3.2n

*Dynamic power


.VEC 'VEC.txt'
.OPTION	post=2
.end