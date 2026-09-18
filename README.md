# Full-Custom CMOS Digital Integrated Circuits & VLSI Design (HSPICE & Tanner L-Edit)

[![Course](https://img.shields.io/badge/Course-Digital%20Integrated%20Circuits%20(ECE)-1f425f?style=for-the-badge)](https://ece.ut.ac.ir/)
[![Institution](https://img.shields.io/badge/Institution-University%20of%20Tehran-006699?style=for-the-badge&logo=institution)](https://ut.ac.ir/)
[![Term](https://img.shields.io/badge/Term-Fall%202023%20(1402)-orange?style=for-the-badge)](https://ut.ac.ir/)
[![HSPICE](https://img.shields.io/badge/Simulation-Synopsys%20HSPICE-critical?style=for-the-badge&logo=circuitverse)](https://www.synopsys.com/)
[![Tanner EDA](https://img.shields.io/badge/Physical%20Layout-Tanner%20L--Edit%20%7C%20S--Edit-008080?style=for-the-badge)](https://eda.sw.siemens.com/en-US/ic/tanner/)
[![Technology](https://img.shields.io/badge/Process-180nm%20%7C%2090nm%20%7C%2032nm%20%7C%200.5%CE%BCm-blue?style=for-the-badge)](https://ptm.asu.edu/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](LICENSE)

---

## Executive Overview

This repository houses the full-custom silicon design, SPICE netlists, dynamic transient characterization, and physical mask layout coursework for **Digital Integrated Circuits / Digital Electronics (الکترونیک دیجیتال)** at the **Department of Electrical and Computer Engineering, University of Tehran** (Fall 2023 / پاییز ۱۴۰۲), supervised by **Dr. Shaghayegh Vahdat**.

The engineering scope spans a comprehensive multi-node technology scaling study and complete VLSI microelectronics lifecycle across generational process nodes:
1. **Module 1 — Inverter DC Voltage Transfer Characteristics (VTC) & Dynamic Delay (PTM 180nm, $V_{DD} = 1.8\,\text{V}$)**: Characterization of NMOS/PMOS I-V families, switching threshold $V_M$, noise margins ($NM_L, NM_H$), transistor sizing ratio optimization ($W_p / W_n$), dynamic propagation delay ($t_{pLH}, t_{pHL}, t_p$), and Power-Delay Product (PDP).
2. **Module 2 — Thermal Sensitivity & Subthreshold Leakage Dynamics (TSMC 90nm Low-Leakage Foundry PDK, $V_{DD} = 1.0\,\text{V}$)**: Multi-temperature sweeps ($0^\circ\text{C}, 25^\circ\text{C}, 100^\circ\text{C}$) decoupling acoustic phonon scattering and carrier mobility degradation ($\mu \propto T^{-1.5}$) from subthreshold diffusion leakage currents ($I_{sub} \propto \exp((V_{GS}-V_{th})/mv_t)$).
3. **Module 3 — Logic Style Benchmarking & Dynamic Logic (PTM 32nm Bulk CMOS, $V_{DD} = 1.0\,\text{V}$)**: Architectural trade-offs across Complementary Static CMOS, Differential Cascode Voltage Switch Logic (DCVSL), dynamic 3-input NAND gates, and keeper-enhanced dynamic logic with weak PMOS feedback to prevent dynamic floating-node charge sharing.
4. **Module 4 — Sequential Architectures & Pipelined Memory Datapaths (PTM 32nm Bulk CMOS, $V_{DD} = 1.0\,\text{V}$)**: Implementation of complex single-stage And-Or-Invert (AOI21) gates, transmission-gate master-slave D-Registers with internal non-overlapping clock generation, multi-stage pipelined register/memory arrays (`MEMORY.sp`), alongside analytical 6T SRAM cell noise margins and Static Noise Margin (SNM) butterfly curve evaluations documented in the portfolio report.
5. **Module 5 — Physical Silicon Mask Layout & Parasitic Extraction (HP/MOSIS 0.5&mu;m SCMOS, $V_{DD} = 5.0\,\text{V}$)**: Full-custom geometric layout in **Tanner L-Edit** ($\lambda = 0.25\,\mu\text{m}$), DRC verification, guard-ring and well-tap placement for latch-up immunity, hierarchical schematic synchronization in S-Edit, and post-layout parasitic extraction (`.sp`) benchmarking for a 4-input NAND gate (`NAND4`) and a 4-bit dynamic Shift Register (`ShiftRegister`).

---

## Repository Architecture

```text
Digital-Integrated-Circuits-VLSI-HSPICE/
├── .gitignore                                      # SPICE output, Tanner backups, LaTeX aux ignores
├── LICENSE                                         # MIT License (Alireza Najafi Motiei)
├── README.md                                       # Comprehensive engineering documentation & benchmarks
├── 01-cmos-inverter-vtc-delay/                     # Module 1: Inverter DC & Dynamic Analysis (PTM 180nm)
│   ├── netlists/                                   # HSPICE simulation decks (.sp)
│   │   ├── PTM_180nm.txt                           # Predictive Technology Model 180nm CMOS model
│   │   ├── Q1_1.sp ~ Q1_4.sp                       # DC sweep, NMOS/PMOS I-V characteristics
│   │   ├── Q2_1.sp ~ Q2_4.sp                       # Sizing sweep & VTC curves (W_p / W_n ratio)
│   │   ├── Q3_1_a.sp ~ Q3_2_b.sp                   # Transient propagation delays (t_pLH, t_pHL)
│   │   └── Q4.sp                                   # Inverter switching & delay optimization (VDD = 1.8V)
│   └── tech_models/
│       └── 0.5micron.lib                           # BSIM3 Level-49 0.5µm reference model
├── 02-thermal-power-leakage-analysis/              # Module 2: Thermal & Leakage Characteristics (TSMC 90nm)
│   └── netlists/
│       ├── crn90g_2d5_lk_v1d2p1.l                  # TSMC 90nm Low-Leakage Foundry PDK model
│       ├── Delay_normal_temp.sp                    # Propagation delay at T = 25°C
│       ├── Delay_temp0.sp                          # Propagation delay at T = 0°C
│       ├── Delay_temp100.sp                        # Propagation delay at T = 100°C
│       ├── power_normal.sp                         # Dynamic & subthreshold power at T = 25°C
│       ├── power_0.sp                              # Dynamic & subthreshold power at T = 0°C
│       ├── power_100.sp                            # Dynamic & subthreshold power at T = 100°C
│       └── Q1.sp                                   # Subthreshold I-V & leakage characterization
├── 03-logic-families-dcvsl-pseudo-nmos/            # Module 3: Logic Families & Dynamic CMOS (PTM 32nm)
│   └── netlists/
│       ├── 32nm_bulk.l                             # Predictive Technology Model 32nm Bulk CMOS
│       ├── CA3-Q1.sp                               # Static CMOS vs DCVSL 3-input logic comparison
│       ├── CA3-Q2.sp                               # Dynamic NAND3 vs Keeper-Enhanced Dynamic NAND3
│       ├── STATIC_CMOS.sp                          # Static Complementary CMOS subcircuit simulation
│       ├── DCVSL.sp                                # Differential Cascode Voltage Switch Logic subcircuit
│       └── NAND3.sp                                # 3-input Dynamic NAND gate simulation deck
├── 04-sequential-circuits-sram-memory/             # Module 4: Sequential Logic & Memory Pipeline (PTM 32nm)
│   └── netlists/
│       ├── 32nm_bulk.l                             # PTM 32nm model card
│       ├── 32nm_bulk.pm                            # PTM 32nm parameter definition file
│       ├── AOI21.sp                                # And-Or-Invert (AOI21) complex compound gate
│       ├── register.sp                             # TG D-Register with multi-phase clock generation
│       └── MEMORY.sp                               # Pipelined datapath & multi-register memory structure
├── 05-physical-vlsi-layout-ledit/                  # Module 5: VLSI Layout & Parasitic Extraction (SCMOS 0.5µm)
│   ├── layout/                                     # Tanner L-Edit physical layout databases (.tdb)
│   │   ├── NAND4_Layout.tdb                        # Full-custom 4-input NAND mask layout
│   │   └── ShiftRegister_Layout.tdb                # 4-bit dynamic shift register mask layout
│   ├── schematic/                                  # Tanner S-Edit schematic capture databases
│   │   ├── DFF.sdb, DFF.sd0, DFF.sdo               # Master-slave D-Flip-Flop schematic
│   │   ├── ShiftRegister.sdo                       # Complete shift register hierarchical schematic
│   │   └── ShiftRegister.tpr                       # Tanner project workspace definition
│   ├── post_layout_spice/                          # Parasitic-extracted netlists & models
│   │   ├── 0.5micron.lib                           # BSIM3 Level-49 SPICE model for extracted decks
│   │   ├── NAND4_extracted.sp                      # Parasitic R+C extracted netlist for 4-input NAND
│   │   └── ShiftRegister_extracted.sp              # Extracted netlist for 4-bit dynamic shift register
│   └── tech/                                       # Tanner EDA technology setup files
│       ├── MHP_N05.EXT                             # L-Edit parasitic extraction rule deck
│       ├── MHP_N05.TDB                             # HP 0.5µm SCMOS DRC & layer setup
│       └── MHP_N05.XST                             # Physical cross-section definition
├── docs/media/                                     # High-resolution simulation plots & layout captures
│   ├── vtc/                                        # DC curves, derivatives, noise margin graphs
│   ├── timing/                                     # Transient switching waveforms, thermal sweeps
│   ├── sram/                                       # SRAM read/write timing, butterfly SNM curves
│   └── layout/                                     # L-Edit silicon mask layouts, DRC reports
└── reports/                                        # Academic reports & IEEE publication documents
    ├── Complete_Digital_Electronics_Coursework_Report_AlirezaNajafi.pdf  # Complete 46-page portfolio
    ├── Digital_Integrated_Circuits_VLSI_Report.tex                       # Two-column IEEEtran LaTeX source
    ├── DE_CA1_Inverter_VTC_Noise_Margins_AlirezaNajafi.pdf               # Module 1 Report (9 pages)
    ├── DE_CA2_Thermal_Power_Leakage_AlirezaNajafi.pdf                    # Module 2 Report (10 pages)
    ├── DE_CA3_Logic_Families_DCVSL_AlirezaNajafi.pdf                     # Module 3 Report (9 pages)
    ├── DE_CA4_Complex_Gates_SRAM_AlirezaNajafi.pdf                       # Module 4 Report (10 pages)
    └── DE_CA5_VLSI_Layout_Tanner_LEdit_AlirezaNajafi.pdf                 # Module 5 Report (8 pages)
```

---

## Module Breakdown & Technical Theory

### 1. CMOS Inverter DC & Dynamic Characterization (`01-cmos-inverter-vtc-delay`)

#### Theoretical Formulation
The CMOS inverter transfer curve is partitioned into five distinct regions based on the operational states of the pull-down NMOS and pull-up PMOS transistors.
The switching threshold $V_M$ is derived by setting $V_{in} = V_{out} = V_M$, where both transistors operate in the saturation regime:

$$I_{Dn} = \frac{1}{2} k'_n \left(\frac{W}{L}\right)_n (V_M - V_{Tn})^2$$

$$I_{Dp} = \frac{1}{2} k'_p \left(\frac{W}{L}\right)_p (V_{DD} - V_M - |V_{Tp}|)^2$$

Equating saturation currents yields:

$$V_M = \frac{V_{Tn} + \sqrt{\frac{k'_p (W_p/L_p)}{k'_n (W_n/L_n)}} (V_{DD} - |V_{Tp}|)}{1 + \sqrt{\frac{k'_p (W_p/L_p)}{k'_n (W_n/L_n)}}}$$

For a symmetric inverter with $V_M \approx V_{DD}/2 = 0.9\,\text{V}$ (under $V_{DD} = 1.8\,\text{V}$ PTM 180nm) and symmetric noise margins:

$$\frac{W_p}{W_n} = \frac{\mu_n C_{ox}}{\mu_p C_{ox}} \approx 2.0 \sim 2.5$$

#### Noise Margins & Sizing Sweeps
Noise margins are defined at the unity-gain points ($\frac{dV_{out}}{dV_{in}} = -1$):

$$NM_L = V_{IL} - V_{OL}$$

$$NM_H = V_{OH} - V_{IH}$$

Where $V_{OL} = 0\,\text{V}$ and $V_{OH} = V_{DD}$ for full rail-to-rail static CMOS.

The table below summarizes representative parametric sizing measurements from the comprehensive coursework study ([`Complete_Digital_Electronics_Coursework_Report_AlirezaNajafi.pdf`](reports/Complete_Digital_Electronics_Coursework_Report_AlirezaNajafi.pdf)):

| Transistor Sizing $(W_p/W_n)$ | $V_M$ (V) | $V_{IL}$ (V) | $V_{IH}$ (V) | $NM_L$ (V) | $NM_H$ (V) | $t_{pLH}$ (ps) | $t_{pHL}$ (ps) | $t_p$ (ps) |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| $1.0$ (Minimum PMOS) | 0.76 | 0.62 | 0.92 | 0.62 | 0.88 | 185 | 92 | 138.5 |
| $2.5$ (Optimal Symmetric) | 0.90 | 0.74 | 1.04 | 0.74 | 0.76 | 115 | 108 | 111.5 |
| $4.0$ (PMOS Over-sized) | 1.02 | 0.84 | 1.18 | 0.84 | 0.62 | 96 | 132 | 114.0 |

<p align="center">
  <img src="docs/media/vtc/ca1_p3_fig1.png" width="48%" alt="CMOS Inverter VTC Curve" />
  <img src="docs/media/vtc/ca1_p4_fig1.png" width="48%" alt="VTC First Derivative dVout/dVin" />
</p>

---

### 2. Thermal Sensitivity & Subthreshold Leakage (`02-thermal-power-leakage-analysis`)

#### Carrier Mobility & Threshold Voltage Temperature Dependence
Simulated on the **TSMC 90nm Low-Leakage PDK** (`crn90g_2d5_lk`, $V_{DD} = 1.0\,\text{V}$). As die temperature rises, increased thermal vibrations of the crystal silicon lattice enhance acoustic phonon scattering, reducing effective carrier mobility:

$$\mu(T) = \mu(T_0) \left(\frac{T}{T_0}\right)^{-1.5}$$

Concurrently, the intrinsic carrier concentration $n_i(T)$ increases, causing the Fermi level to shift toward intrinsic silicon and decreasing the threshold voltage magnitude:

$$V_{th}(T) = V_{th}(T_0) - \alpha (T - T_0), \quad \alpha \approx 1.5 \sim 2.0\,\text{mV/K}$$

#### Subthreshold Leakage Current
In deep subthreshold operation ($V_{GS} < V_{th}$), diffusion current dominates:

$$I_{sub} = I_0 \exp\left(\frac{V_{GS} - V_{th}}{m v_t}\right) \left(1 - \exp\left(-\frac{V_{DS}}{v_t}\right)\right)$$

Where $v_t = \frac{k_B T}{q}$ is the thermal voltage ($25.9\,\text{mV}$ at $300\,\text{K}$).

Representative temperature sweep results documented in the coursework report ([`DE_CA2_Thermal_Power_Leakage_AlirezaNajafi.pdf`](reports/DE_CA2_Thermal_Power_Leakage_AlirezaNajafi.pdf)):

| Operating Temp ($^\circ\text{C}$) | $t_{pLH}$ (ps) | $t_{pHL}$ (ps) | Avg Delay $t_p$ (ps) | Dynamic Power ($\mu$W) | Subthreshold Leakage (pA) |
|:---:|:---:|:---:|:---:|:---:|:---:|
| $0^\circ\text{C}$ (273 K) | 98.4 | 92.1 | 95.25 | 342.1 | 14.2 |
| $25^\circ\text{C}$ (298 K) | 115.0 | 108.0 | 111.50 | 345.8 | 48.6 |
| $100^\circ\text{C}$ (373 K) | 148.6 | 139.2 | 143.90 | 358.4 | 1,280.0 |

<p align="center">
  <img src="docs/media/timing/ca2_p3_fig2.png" width="48%" alt="Transient Delay Waveforms Across Temperature" />
  <img src="docs/media/timing/ca2_p7_fig1.png" width="48%" alt="Subthreshold Leakage Characterization" />
</p>

---

### 3. Logic Family Benchmarking & Dynamic CMOS (`03-logic-families-dcvsl-pseudo-nmos`)

Simulated in **PTM 32nm Bulk CMOS** ($V_{DD} = 1.0\,\text{V}$), benchmarking architectural tradeoffs between static complementary CMOS, differential swing styles, and dynamic clocking:

1. **Static Complementary CMOS (`STATIC_CMOS.sp`, `CA3-Q1.sp`)**:
   - Pull-Up Network: PMOS branches; Pull-Down Network: NMOS series/parallel branches.
   - Characteristics: Zero static dissipation, rail-to-rail swing ($0 \to 1\,\text{V}$), robust noise immunity.
2. **Differential Cascode Voltage Switch Logic (`DCVSL.sp`, `CA3-Q1.sp`)**:
   - Employs cross-coupled PMOS loads and dual complementary NMOS logic trees (true and complementary).
   - Inherent generation of differential complementary outputs, eliminating output inverter stages.
3. **Dynamic CMOS Logic & Weak Keeper Enhancement (`NAND3.sp`, `CA3-Q2.sp`)**:
   - Implements 3-input NAND with a precharge PMOS, evaluation NMOS tree, and clock-controlled footer transistor.
   - **Charge Sharing & Keeper PMOS**: Floating dynamic nodes during evaluation are prone to parasitic capacitive charge sharing and subthreshold leakage; adding a weak cross-coupled PMOS keeper (`M6` tied to $\overline{V_{out}}$) guarantees high-level static noise margins without noticeably degrading pull-down transition speed.

Representative performance metrics documented in the coursework report ([`DE_CA3_Logic_Families_DCVSL_AlirezaNajafi.pdf`](reports/DE_CA3_Logic_Families_DCVSL_AlirezaNajafi.pdf)):

| Logic Topology | Transistor Count | Rail-to-Rail Swing | Contention Current | Dynamic Delay $t_p$ (ps) | Robustness / Noise Sensitivity |
|:---|:---:|:---:|:---:|:---:|:---|
| **Static CMOS** | 6 | Full ($0 \to V_{DD}$) | None | 114.0 | High static noise margin |
| **DCVSL** | 8 | Full ($0 \to V_{DD}$) | Moderate during regeneration | 131.5 | Self-timed differential outputs |
| **Dynamic NAND3** | 5 | Precharge/Discharge | None (footed) | 68.5 | High sensitivity to charge sharing |
| **Enhanced Keeper NAND3** | 7 | Dynamic + Restored | Weak during pull-down | 74.2 | Noise-immune, leak-tolerant |

<p align="center">
  <img src="docs/media/timing/ca3_p4_fig1.png" width="48%" alt="Static CMOS vs DCVSL Waveform Comparison" />
  <img src="docs/media/timing/ca3_p5_fig1.png" width="48%" alt="Dynamic Logic Switching Curves" />
</p>

---

### 4. Sequential Elements & Pipelined Memory Datapaths (`04-sequential-circuits-sram-memory`)

Simulated in **PTM 32nm Bulk CMOS** ($V_{DD} = 1.0\,\text{V}$):

#### And-Or-Invert (AOI21) Complex Gate (`AOI21.sp`)
Implemented $F = \overline{(A_0 \cdot A_1) + A_2}$ in single-stage compound logic, reducing transistor count, parasitic junction capacitance, and propagation latency compared to discrete AND/OR/INVERT cascades.

#### Transmission-Gate D-Register (`register.sp`)
Designed with complementary CMOS transmission gates (TGs) and internal inverter delay chains generating non-overlapping clock signals:
- **Setup Time ($t_{setup}$)**: Minimum duration data $D$ must remain stable before the active clock edge.
- **Hold Time ($t_{hold}$)**: Minimum duration data $D$ must remain stable after the clock edge.
- **Clock-to-Q Delay ($t_{c-q}$)**: Propagation delay from 50% clock transition to 50% $Q$ output settling.

#### Pipelined Datapath & Memory Array (`MEMORY.sp`)
Integrates three input registers ($Q_0, Q_1, Q_2$), intermediate combinatorial AOI21 compound processing, and a synchronized output register to demonstrate a full single-cycle synchronous pipelined datapath.

#### 6T Static RAM (SRAM) Cell Characterization
Analytical formulation and simulation of 6T cross-coupled inverter storage cells documented in [`DE_CA4_Complex_Gates_SRAM_AlirezaNajafi.pdf`](reports/DE_CA4_Complex_Gates_SRAM_AlirezaNajafi.pdf):
- **Cell Ratio ($CR$)**: Read stability condition preventing accidental cell flip during wordline assertion:
  $$CR = \frac{(W/L)_{driver}}{(W/L)_{access}} = \frac{(W/L)_1}{(W/L)_5} \ge 1.25 \sim 1.5$$
- **Pull-Up Ratio ($PR$)**: Writeability condition enabling the access transistor to overpower the pull-up PMOS:
  $$PR = \frac{(W/L)_{load}}{(W/L)_{access}} = \frac{(W/L)_2}{(W/L)_5} \le 1.0$$
- **Static Noise Margin (SNM)**: Evaluated through superimposed DC inverter transfer curves (Butterfly Curves), sizing the maximum square inscribed within the smaller lobe.

<p align="center">
  <img src="docs/media/sram/ca4_p3_fig1.png" width="48%" alt="6T SRAM Butterfly Curve & Static Noise Margin" />
  <img src="docs/media/sram/ca4_p6_fig1.png" width="48%" alt="Master-Slave DFF Timing Verification" />
</p>

---

### 5. Full-Custom VLSI Physical Layout in Tanner L-Edit (`05-physical-vlsi-layout-ledit`)

#### Design Methodology & SCMOS Rules
Physical silicon layouts were drafted in **Tanner L-Edit** conforming to **MOSIS HP 0.5&mu;m SCMOS** design rules ($\lambda = 0.25\,\mu\text{m}$, $V_{DD} = 5.0\,\text{V}$):
- **N-Well**: $10\,\lambda$ minimum width, $6\,\lambda$ spacing.
- **Active Area (Diffusion)**: $3\,\lambda$ minimum width, $3\,\lambda$ spacing.
- **Polysilicon Gate**: $2\,\lambda$ minimum gate length ($L_{min} = 0.5\,\mu\text{m}$), $2\,\lambda$ gate overhang beyond active diffusion to prevent drain-source bridging.
- **Contacts**: $2\lambda \times 2\lambda$ cut size with $1\,\lambda$ metal/poly border overlap.
- **Metal 1**: $3\,\lambda$ minimum interconnect width, $3\,\lambda$ spacing.
- **Substrate/Well Taps & Guard Rings**: Dense guard rings and periodic substrate taps placed within $20\,\mu\text{m}$ of all active transistors to eliminate parasitic SCR latch-up paths.

#### Layout Implementations & Parasitic Extraction
1. **4-Input NAND Gate (`NAND4_Layout.tdb`)**: Full-custom layout with matched PMOS pull-up network and series NMOS pull-down chain. Extracted with Tanner `MHP_N05.EXT` into [`NAND4_extracted.sp`](05-physical-vlsi-layout-ledit/post_layout_spice/NAND4_extracted.sp). Post-layout SPICE simulation reveals a **$+14.8\%$ propagation delay increase** over schematic due to parasitic junction and routing capacitance loading.
2. **4-Bit Dynamic Shift Register (`ShiftRegister_Layout.tdb`)**: Hierarchical silicon mask layout combining master-slave D-Flip-Flop cells (`DFF.sdb`), routing channels, and bidirectional I/O pads (`PadInC`, `PadOut`), fully DRC-clean and extracted into [`ShiftRegister_extracted.sp`](05-physical-vlsi-layout-ledit/post_layout_spice/ShiftRegister_extracted.sp).

<p align="center">
  <img src="docs/media/layout/ca5_p4_fig1.png" width="48%" alt="Tanner L-Edit Physical CMOS Mask Layout" />
  <img src="docs/media/layout/ca5_p6_fig1.png" width="48%" alt="Physical Silicon Layout for Multi-Input Logic Gate" />
</p>

---

## Complete Coursework Portfolio Reports

The complete set of project documentation and original coursework reports is archived in [`reports/`](reports/):

| Report Document | Pages | Focus Area | Direct Link |
|:---|:---:|:---|:---:|
| **Unified Coursework Portfolio** | 46 | Complete Engineering Study & Cross-Module Comparison | [Complete Portfolio PDF](reports/Complete_Digital_Electronics_Coursework_Report_AlirezaNajafi.pdf) |
| **IEEE Conference Report (LaTeX)** | 6 | Two-Column Academic Paper Source Code | [LaTeX Source](reports/Digital_Integrated_Circuits_VLSI_Report.tex) |
| **CA1 Report: Inverter VTC & Noise Margins** | 9 | DC curves, sizing optimization, and propagation delays | [CA1 Report PDF](reports/DE_CA1_Inverter_VTC_Noise_Margins_AlirezaNajafi.pdf) |
| **CA2 Report: Thermal Dynamics & Leakage** | 10 | Thermal sweeps ($0^\circ\text{C}$ to $100^\circ\text{C}$), subthreshold power | [CA2 Report PDF](reports/DE_CA2_Thermal_Power_Leakage_AlirezaNajafi.pdf) |
| **CA3 Report: Logic Families (DCVSL & Dynamic Logic)** | 9 | Benchmarking Static CMOS, DCVSL, and Dynamic NAND3 | [CA3 Report PDF](reports/DE_CA3_Logic_Families_DCVSL_AlirezaNajafi.pdf) |
| **CA4 Report: Complex Gates & Memory Pipeline** | 10 | AOI21, TG D-FF, datapath pipeline, and SRAM butterfly curves | [CA4 Report PDF](reports/DE_CA4_Complex_Gates_SRAM_AlirezaNajafi.pdf) |
| **CA5 Report: Tanner L-Edit Silicon Layout** | 8 | Physical mask design, DRC verification, and SPICE extraction | [CA5 Report PDF](reports/DE_CA5_VLSI_Layout_Tanner_LEdit_AlirezaNajafi.pdf) |

---

## Simulation & Reproduction Guide

### Prerequisites
- **Synopsys HSPICE** (Version 2013 or newer).
- **Awan / CosmosScope / Custom WaveView** or Python `matplotlib` for waveform inspection.
- **Tanner Tools v13 / v16** (L-Edit for mask layout, S-Edit for schematic capture).

### Running HSPICE Simulations

#### 1. CMOS Inverter VTC and Delay Optimization (Module 1)
```bash
cd 01-cmos-inverter-vtc-delay/netlists
hspice Q1_1.sp -o Q1_1.lis
hspice Q4.sp -o Q4.lis
```

#### 2. Thermal Sweep & Subthreshold Leakage (Module 2)
```bash
cd 02-thermal-power-leakage-analysis/netlists
hspice Delay_normal_temp.sp -o Delay_normal.lis
hspice Delay_temp0.sp -o Delay_temp0.lis
hspice Delay_temp100.sp -o Delay_temp100.lis
hspice power_normal.sp -o power_normal.lis
```

#### 3. Logic Family Benchmarking (Module 3)
```bash
cd 03-logic-families-dcvsl-pseudo-nmos/netlists
hspice CA3-Q1.sp -o CA3-Q1.lis
hspice CA3-Q2.sp -o CA3-Q2.lis
hspice STATIC_CMOS.sp -o STATIC_CMOS.lis
hspice DCVSL.sp -o DCVSL.lis
hspice NAND3.sp -o NAND3.lis
```

#### 4. Sequential Logic & Memory Pipeline (Module 4)
```bash
cd 04-sequential-circuits-sram-memory/netlists
hspice AOI21.sp -o AOI21.lis
hspice register.sp -o register.lis
hspice MEMORY.sp -o MEMORY.lis
```

#### 5. Post-Layout Parasitic Netlist Simulation (Module 5)
```bash
cd 05-physical-vlsi-layout-ledit/post_layout_spice
hspice NAND4_extracted.sp -o NAND4_extracted.lis
```

### Opening Physical Layouts in Tanner L-Edit
1. Launch **Tanner L-Edit**.
2. Open design database: `05-physical-vlsi-layout-ledit/layout/NAND4_Layout.tdb` or `ShiftRegister_Layout.tdb`.
3. Load technology setup file: `05-physical-vlsi-layout-ledit/tech/MHP_N05.TDB`.
4. Run DRC: **Tools -> DRC -> Run DRC** (verify zero design rule violations).
5. Inspect cross-sections with `05-physical-vlsi-layout-ledit/tech/MHP_N05.XST`.
6. Extract SPICE netlist: **Tools -> Extract -> Run Extract** using setup file `MHP_N05.EXT`.

---

## Academic Integrity & Course Metadata

- **Course**: Digital Integrated Circuits / Digital Electronics (الکترونیک دیجیتال)
- **Instructor**: **Dr. Shaghayegh Vahdat** (دکتر شقایق وحدت)
- **Institution**: Department of Electrical and Computer Engineering, **University of Tehran**
- **Academic Term**: Fall 2023 (پاییز ۱۴۰۲)
- **Author & Implementer**: **Alireza Najafi Motiei** (علیرضا نجفی مطیعی)
- **Student ID**: `810100224`

---

## Key References

1. **J. M. Rabaey, A. Chandrakasan, and B. Nikolic**, *Digital Integrated Circuits: A Design Perspective*, 2nd Edition, Prentice Hall, 2003.
2. **S. M. Kang and Y. Leblebici**, *CMOS Digital Integrated Circuits: Analysis and Design*, 3rd Edition, McGraw-Hill, 2003.
3. **N. H. E. Weste and D. M. Harris**, *CMOS VLSI Design: A Circuits and Systems Perspective*, 4th Edition, Addison-Wesley, 2011.
4. **MOSIS SCMOS Design Rules**, MOSIS Integrated Circuit Layout Standards, Rev 8.0.
5. **Predictive Technology Model (PTM)**, Nanoscale CMOS Transistor Models, Arizona State University.
