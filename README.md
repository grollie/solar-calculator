# Residential Solar Array Sizing Calculator

Interactive multi-string / multi-inverter sizing calculator for residential grid-tied PV systems with battery backup. NEC 690 / 705 compliant sizing.

**Live:** https://grollie.github.io/solar-calculator/

## Features

- **Per-string configuration** — mix panel models across strings; assign each string to a specific MPPT input on a specific physical inverter
- **Multi-inverter support** — define any number of physical inverters; per-inverter battery counts; per-inverter capacity validation
- **Schematic editor** — drag/drop panels, combiners, and inverters; line tool to wire strings to MPPTs; auto-layout option
- **Component library** with SunGold SGN-450-BDG5, SGN-590-BDG1 panels and SPH10048P, SGS-12K18MAX hybrid inverters (plus generic / SMA / SolarEdge / Enphase options)
- **NEC validation** — string Voc vs. inverter max DC, Vmp vs. MPPT range, MPPT Isc current limits, NEC 690.8 × 1.25 OCPD sizing
- **MPPT amperage display** — per-MPPT operating current (Imp), short-circuit current (Isc), and NEC × 1.25 sizing
- **Financial model** — BOM with itemized costs, 30% federal ITC, 25-year cash flow chart, NPV calculation

## Usage

Open `index.html` in any modern browser. All state lives in the page — no backend, no server required. Chart.js is loaded from a CDN.

## Stack

Single self-contained HTML file. Vanilla JavaScript, inline CSS, Chart.js (CDN).
