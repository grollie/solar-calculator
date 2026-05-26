# Archive — Saved Calculator Revisions

Historical snapshots of `index.html` preserved at notable milestones.

## Files

### `v1-pre-eg4-catalog.html`
**Tagged:** `v1.0-pre-eg4-catalog` (git commit `504046d`)

**Saved:** before the EG4 catalog imports (panels: commit `db4f511`, inverters: commit `07b029a`).

**Includes:**
- 16 curated SunGold panels (SGN-450, SGN-590, full SGN/SGP/SG series + Generic + Custom)
- 12 curated SunGold inverters + SMA / SolarEdge / Enphase reference
- 17 batteries (10 SunGold LFP + Tesla / LG / Generac / EG4 references)
- NEC 690.7 temperature correction (cold-Voc, hot-Vmp, hot-Isc) with climate inputs and mounting cell-temp adder
- NEC 690.8 wire / OCPD / combiner sizing with DC + AC section headers
- Schematic editor with Block View + Panel View toggle and +/- DC cables
- Multi-inverter / multi-string config, per-inverter battery counts
- Save/Load JSON, Print PDF, Export BOM CSV, Export Schematic SVG, Export Snapshot JSON
- 25-year cash flow chart with NPV and ITC

**Excludes (added later):**
- 1,269-panel EG4 catalog from sungoldpower.com / eg4electronics.com API
- 8 EG4 inverters (FlexBOSS21, FlexBOSS18, 18kPV-12LV, 12kPV, 12000XP, 6000XP, 3000 EHV-48, MPPT 100-48HV)
- `panels_eg4.json` and `inverters_eg4.json` external catalog files

**Live URL:** https://grollie.github.io/solar-calculator/archive/v1-pre-eg4-catalog.html

## How to restore an archived version

To make any archived file the active `index.html`:
```bash
cp archive/v1-pre-eg4-catalog.html index.html
git add index.html
git commit -m "Restore v1.0 (pre-EG4 catalog)"
git push
```

Or check out the tag directly:
```bash
git checkout v1.0-pre-eg4-catalog
```
