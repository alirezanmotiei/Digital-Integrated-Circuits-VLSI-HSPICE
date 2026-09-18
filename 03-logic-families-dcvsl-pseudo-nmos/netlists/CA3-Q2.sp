* ==============================================================================
* File: CA3/CA3-Q2.sp
* Project: Digital Integrated Circuits & VLSI Design
* Course: Digital Electronics (Fall 2023)
* Author: Alireza Najafi Motiei (Student ID: 810100224)
* Instructor: Dr. Shaghayegh Vahdat
* Department: Faculty of Electrical and Computer Engineering, University of Tehran
* ==============================================================================

CA3_Q2
***********Library***********
.lib    '32nm_bulk.l'  tt

***********NAND3***********
.SUBCKT NAND3    CLK      A       B       C       Vout
M1      X        CLK      GND     GND     nmos    L=Lmin    W='Wmin*4'
M2      Y        C        X       GND     nmos    L=Lmin    W='Wmin*4'
M3      Z        B        Y       GND     nmos    L=Lmin    W='Wmin*4'
M4      Vout     A        Z       GND     nmos    L=Lmin    W='Wmin*4'
M5      Vout     CLK      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
Vsupply VDD      GND      VCC
.ENDS   NAND3

***********INVERTER***********
.SUBCKT INV      Vin      Vout 
M1      Vout     Vin      GND     GND     nmos    L=Lmin    W= Wmin
M2      Vout     Vin      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
Vsupply VDD      GND      VCC
.ENDS   INV

***********ENHANCED NAND3***********
.SUBCKT E_NAND3    CLK      A       B       C       Vout
M1      X        CLK      GND     GND     nmos    L=Lmin    W='Wmin*4'
M2      Y        C        X       GND     nmos    L=Lmin    W='Wmin*4'
M3      Z        B        Y       GND     nmos    L=Lmin    W='Wmin*4'
M4      Vout     A        Z       GND     nmos    L=Lmin    W='Wmin*4'
M5      Vout     CLK      VDD     VDD     pmos    L=Lmin    W='Wmin*2'
M6      Vout     Voutbar  VDD     VDD     pmos    L=Lmin    W= Wmin
X1      Vout     Voutbar  INV
Vsupply VDD      GND      VCC
.ENDS   E_NAND3

***********Circuit***********
X1      CLK      A        B       C       Vout    NAND3
* X2      CLK      A        B       C       Vout    E_NAND3

***********Param***********
.param      GND=0
.param      Lmin=32n
.param      Wmin=32n
.param      VCC=1

***********Sim***********
.op
.tran   1p       15n

***********Delay Measurements*********
.measure         tran     tHL1    trig    V(C)    td = 13n    val = 0.5    cross=1    targ    V(Vout)      td = 13n    val = 0.5    cross=1

***********Power Measurements*********
*Static power
.measure         tran     static_power_high_CLK_NOT_EN        AVG          power      from = 5.55n to = 6n
.measure         tran     static_power_low                    AVG          power      from = 13.05n to = 13.5n

*Dynamic power
.measure         tran     toL_steady      when    par('V(Vout)-GND')=1m   td=13n      cross=1
.measure         tran     toH_steady      when    par('VCC-V(Vout)')=1m   td=13.5n    cross=1
.measure         tran     dynamic_power_hl        AVG      power        from = 13.025n to = toL_steady
.measure         tran     dynamic_power_lh        AVG      power        from = 13.5n to = toH_steady




.VEC 'VEC.txt'
.OPTION	post=2
.end