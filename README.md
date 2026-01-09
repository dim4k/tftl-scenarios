# 📟 Tales From The Loop: Scenario Collection

> *A collection of custom scenarios, tools, and resources for the "Tales From The Loop" Roleplaying Game.*

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Build Status](https://img.shields.io/badge/build-docker-green.svg)
![Language](https://img.shields.io/badge/language-Français-red.svg)

## 📖 Overview

This repository hosts a growing library of ready-to-play adventures and utilities for **Tales From The Loop**, set in the alternative 80s.

It providers everything a GM needs: professionally layouted scenario books, automated character sheets, and rule summaries, all built with a modern "Docs-as-Code" approach.

### 📼 Featured Scenarios

#### 1. The Echo of the Magnetron (*L'Écho du Magnétron*)
* **Themes**: Time Paradox, Emotional Sacrifice, Retro-Futurism.
* **Vibe**: *Stranger Things* meets *Dark*.
* **Synopsis**: A group of Kids investigates the disappearance of their friend Lucas, who vanished after finding a strange artifact near the cooling towers. They will face time paradoxes, rogue robots, and the secrets of the Loop Agency.
* **Content**: 20+ page Campaign Book, Battle Maps, Handouts.

*(More scenarios coming soon...)*

### 🛠️ Utilities Included

- **📝 Character Sheet Generator**: A Python-based tool that renders authentic, retro-styled character sheets from simple JSON data.
- **📜 Rules Summary**: A handy 2-up A4 cheat sheet for players and GMs (`books/rules.typ`).
- **👥 Pre-generated Characters**: Ready-to-play Kids with unique backstories and stats.

---

## 🚀 Getting Started

### Prerequisites

All you need is **Docker**. The entire build process is containerized.

### 🛠️ Build Instructions

To generate every asset in the repository (All Scenarios, Sheets, Rules), simply run:

```bash
docker-compose up --build
```

### 📂 Output

After the build completes, check the **root directory** for:

- `tftl-echo-de-magnetron.pdf` (Scenario Book)
- `tftl-characters.pdf` (Character Book)
- `tftl-rules.pdf` (Rules Summary)
- `Fiche_*.pdf` (Individual Character Sheets)

---

## 🎨 Design Philosophy

- **Authentic 80s Aesthetic**: Uses *Libre Baskerville*, *Archivo*, and handwritten fonts to match the original game's style.
- **Automated Generation**: Change the stats in `sheets/characters.json`, run Docker, and get updated PDFs instantly.
- **High-Quality Maps & Handouts**: Includes integrated maps, blueprints, and secret documents for the players.

## 🤝 Credits

- **System**: Tales From The Loop RPG by generic publisher.
- **Scenario & Design**: Antoine
- **Tech Stack**: [Typst](https://typst.app/), [Gotenberg](https://gotenberg.dev/), Python.
