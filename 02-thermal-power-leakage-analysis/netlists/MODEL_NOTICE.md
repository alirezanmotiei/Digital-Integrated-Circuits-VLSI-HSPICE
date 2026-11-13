# Foundry PDK Model Exclusion Notice

The HSPICE netlists in this folder reference the **TSMC 90nm Low-Leakage (`crn90g_2d5_lk_v1d2p1.l`, `TT_lvt`)** foundry model library via:

```spice
.lib  'crn90g_2d5_lk_v1d2p1.l'  TT_lvt
```

Because commercial foundry PDK model files are governed by institutional Non-Disclosure Agreements (NDAs), the proprietary `.l` model library is excluded from this public repository.

## Running Simulations Locally

1. Obtain the authorized `crn90g_2d5_lk_v1d2p1.l` library file from your institution or PDK administrator.
2. Place it in `02-thermal-power-leakage-analysis/netlists/` (ignored automatically by `.gitignore`), or update the `.lib` path in the `.sp` netlists to point to your PDK installation directory.
3. Execute HSPICE on the target netlist (for example, `hspice Q1.sp -o Q1.lis`).
