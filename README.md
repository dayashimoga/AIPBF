# 🧠 Universal AI Project Brain Framework (AIPBF) v3.3

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-orange.svg)]()
[![Docker Ready](https://img.shields.io/badge/docker-ready-cyan.svg)]()

> **AIPBF** is a next-generation, repository-agnostic static analysis and evidence-based auditing suite. It generates comprehensive engineering brain indexes, security/quality posture cards, and LLM-optimized context packages directly from your codebase—with **zero external library dependencies**.

---

## ✨ Key Features

- 🚫 **No Fabrications (Evidence-First)**: Never guesses. Displays `UNKNOWN` / `NOT_AVAILABLE` when concrete file/log evidence is absent (e.g., missing coverage or test metrics).
- 🏷️ **Fact Classification**: Appends `Verification: VERIFIED | INFERRED | ASSUMED` status to all codebase entities.
- 📂 **Produces One Comprehensive Master Brain** under `/AI_BRAIN`:
  - `PROJECT_BRAIN.md`: An all-in-one authoritative Markdown operating manual with 25 highly structured sections (Executive Summary, Runtime Boot Flows, Domain Models, Event Message Catalogs, Heuristic Security Audits, and Requirements Traceability matrices).
- 🛡️ **Self-Healing Quality Gate**: Scans its own analysis output for contradictions, duplicate entries, or vendor code bleed, auto-healing the metadata before compilation.

---

## 🚀 Execution Models (Plug & Play)

Choose the integration method that fits your pipeline best:

### Option A: Local Host Execution (Zero Dependencies)
AIPBF uses purely standard Python modules (`os`, `sys`, `pathlib`, `re`, `argparse`, `datetime`, `json`). Simply clone this repo and run:

- **Scan and generate brain files**:
  ```bash
  python project_brain.py --scan --path /path/to/your/project
  ```
- **Run the heuristic security & quality auditor**:
  ```bash
  python project_brain.py --review --path /path/to/your/project
  ```

---

### Option B: Seamless Integration Installer (Automated Hooks)
Integrate AIPBF directly into any target repository and establish automatic Git pre-commit hooks so your `/AI_BRAIN` documentation **never goes stale**.

#### On Unix (Linux / macOS):
```bash
./install.sh --target /path/to/your/target/repo
```

#### On Windows (PowerShell / Command Prompt):
```cmd
install.bat --target C:\path\to\your\target\repo
```

*What the installer does:*
1. Bootstraps a local `tools/project_brain/` folder in the target repository.
2. Performs an initial crawl and generates the master project brain operating manual.
3. Automatically sets up a Git `pre-commit` hook to update the brain on every commit.

---

### Option C: Containerized Docker Execution (No Installation)
If you do not want to install Python on your host machine, run AIPBF completely isolated using Docker.

#### 1. Build the Docker Image
```bash
docker build -t project-brain .
```

#### 2. Run in Any Target Repository
Mount your target repository directory into the container's `/workspace` volume:

##### On Linux / macOS:
```bash
docker run --rm -v "$(pwd):/workspace" project-brain --scan --path /workspace
```

##### On Windows (PowerShell):
```powershell
docker run --rm -v "${PWD}:/workspace" project-brain --scan --path /workspace
```

##### On Windows (Command Prompt):
```cmd
docker run --rm -v "%cd%:/workspace" project-brain --scan --path /workspace
```

---

## 📊 Output Registry

The master project brain is saved cleanly under the `/AI_BRAIN/` directory in the root of your workspace:

```
target_project/
  └── AI_BRAIN/
        └── PROJECT_BRAIN.md             # Master Project Brain & Operating Manual
```

---

## 🛠️ Configuration & Customization

AIPBF automatically skips standard ignored paths (`node_modules`, `vendor`, `build`, `third_party`, `dist`, `bin`, `out`).
To run quality & security audit heuristics and inspect detailed console warnings:
```bash
python project_brain.py --review
```

---

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
