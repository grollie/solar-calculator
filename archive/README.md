# Archive — Saved Calculator Revisions

Historical snapshots of `index.html` preserved at notable milestones.

Each archived HTML file is fully standalone — its `fetchCatalog(...)` calls
point at versioned JSON copies stored alongside it, so archives keep working
even after the live `panels_eg4.json` / `inverters_eg4.json` files evolve.

## Revisions (newest first)

### `v1.1-opus-4-7.html`
**Tagged:** `v1.1-opus-4-7` (git commit `76dbd7f`)
**Saved:** 2026-09-28 — marker at the model bump to Claude Opus 4.7 (1M context)
**Data files:** `panels_eg4_v1.1.json`, `inverters_eg4_v1.1.json`

**Everything in `v1.0-pre-eg4-catalog` PLUS:**
- **1,285 panels** across 80 manufacturers (16 curated SunGold + 1,269 EG4-scraped)
- **23 inverters** (15 SunGold + 8 EG4: FlexBOSS21, FlexBOSS18, 18kPV-12LV, 12kPV, 12000XP, 6000XP, 3000 EHV-48, MPPT 100-48HV)
- Async catalog loading with `Promise.allSettled` — panels + inverters load in parallel
- Library reference badge showing `✓ N panels / M mfrs · K inverters` status

**Live URL:** https://grollie.github.io/solar-calculator/archive/v1.1-opus-4-7.html

---

### `v1-pre-eg4-catalog.html`
**Tagged:** `v1.0-pre-eg4-catalog` (git commit `504046d`)
**Saved:** 2026-05-26 — before the EG4 catalog imports

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
- 8 EG4 inverters
- `panels_eg4.json` and `inverters_eg4.json` external catalog files

**Live URL:** https://grollie.github.io/solar-calculator/archive/v1-pre-eg4-catalog.html

---

## How to restore an archived version

To make any archived file the active `index.html`:
```bash
cp archive/<archive>.html index.html
# also restore the JSON if needed:
# cp archive/panels_eg4_v1.1.json panels_eg4.json
# cp archive/inverters_eg4_v1.1.json inverters_eg4.json
git add index.html
git commit -m "Restore <version>"
git push
```

Or check out the tag directly:
```bash
git checkout v1.1-opus-4-7
```
