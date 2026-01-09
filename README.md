# 📟 Tales From The Loop: The Echo of the Magnetron

> *A custom scenario and toolset for the "Tales From The Loop" Roleplaying Game.*

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Build Status](https://img.shields.io/badge/build-docker-green.svg)
![Language](https://img.shields.io/badge/language-Français-red.svg)

## 📖 Overview

**The Echo of the Magnetron** (*L'Écho du Magnétron*) is a complete, ready-to-play adventure set in an alternative 80s Astoria, Oregon. 

In this mystery, a group of Kids will investigate the disappearance of their friend Lucas, who vanished after finding a strange artifact near the cooling towers. They will face time paradoxes, rogue robots, and the secrets of the Loop Agency.

### Project Components

This repository contains everything you need to run the game:

- **📘 Scenario Book**: A professionally formatted PDF campaign book (Typst).
- **📝 Character Sheets**: A Python-based generator that creates authentic, retro-styled character sheets from JSON data.
- **📜 Rules Summary**: A handy 2-up A4 cheat sheet for players and GMs.
- **👥 Pre-generated Characters**: 5 ready-to-play Kids with unique backstories and stats.

---

## 🚀 Getting Started

### Prerequisites

All you need is **Docker**. The entire build process is containerized.

### 🛠️ Build Instructions

To generate all the assets (Scenario, Rules, Character Sheets), simply run:

```bash
docker-compose up --build
```

### 📂 Output

After the build completes, you will find the following files at the **root of the project**:

| File | Description |
|------|-------------|
| `tftl-echo-de-magnetron.pdf` | The complete scenario book (approx. 20+ pages). |
| `tftl-characters.pdf` | A booklet containing all character backstories. |
| `tftl-rules.pdf` | A printable 1-page rules reference (2 copies per A4). |
| `Fiche_*.pdf` | Individual character sheets (Chloe, Ethan, Liam, Mack, Sofia). |

---

## 🎨 Features & Design

- **Authentic 80s Aesthetic**: Uses *Libre Baskerville*, *Archivo*, and handwritten fonts to match the original game's style.
- **Automated Generation**: Change the stats in `sheets/characters.json`, run Docker, and get updated PDFs instantly.
- **High-Quality Maps & Handouts**: Includes integrated maps, blueprints, and secret documents for the players.

## 🤝 Credits

- **System**: Tales From The Loop RPG by generic publisher.
- **Scenario & Design**: Antoine 
- **Tech Stack**: [Typst](https://typst.app/), [Gotenberg](https://gotenberg.dev/), Python.
