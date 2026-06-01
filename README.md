# 🧠 Universal AI Project Brain Framework (AIPBF) v4.0

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()
[![License](https://img.shields.io/badge/license-MIT-blue.svg)]()
[![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-orange.svg)]()
[![Docker Ready](https://img.shields.io/badge/docker-ready-cyan.svg)]()

> **AIPBF v4.0** is a next-generation, repository-agnostic static analysis and evidence-based auditing suite. It upgrades the framework to a **Multi-File Document Architecture** with a built-in **Requirement Traceability Engine**, **Change Impact Engine**, and **Feature Lifecycle Tracker**, producing a comprehensive 15-file AI-optimized operating package under `/AI_BRAIN`—with **zero external library dependencies**.

---

## ✨ Key Features in v4.0

- 📂 **Multi-File Satellite Architecture**: Splits the monolithic operating manual into a compact master index (`PROJECT_BRAIN.md`, 1,000–2,000 lines) and 14 dedicated, auto-generated satellite documents.
- 🔗 **Requirement Traceability Engine**: Links requirements directly to source code implementation, test verification, ADR (Architectural Decision Records), and feature registry identifiers.
- 🔄 **AI Context Restoration**: Includes specialized context packages (`AI_HANDOFF.md` and `AI_CONTEXT.md`) with a machine-readable JSON payload to fully restore the project understanding of any AI model within a single prompt.
- 📡 **Change Impact & Architecture Drift Engine**: Tracks forward/backward dependency impacts of code changes and performs automated tier boundary validation to alert you on architectural drift.
- 🏷️ **Fact Classification**: Categorizes facts based on strict disk evidence (`Verification: VERIFIED | INFERRED | ASSUMED`), splitting requirement implementation status into `IMPLEMENTED`, `VALIDATED`, and `MEASURED`.

---

## 📂 The 15 Mandatory Document Set

AIPBF v4.0 maintains a highly specialized set of documents under the `/AI_BRAIN` folder:

| # | Document | Purpose |
|---|---|---|
| 1 | `PROJECT_BRAIN.md` | Master index serving as a 1,000–2,000 line quick reference card & summary table. |
| 2 | `AI_HANDOFF.md` | Context restoration contract outlining active state, known issues, and next steps. |
| 3 | `AI_CONTEXT.md` | LLM-optimized project understanding document with JSON context payload. |
| 4 | `MASTER_ARCHITECTURE.md` | Preserved manual architecture specification with diagrams and interface definitions. |
| 5 | `MASTER_REQUIREMENTS.md` | Traceability matrix linking all requirements to source, test, ADR, and features. |
| 6 | `MASTER_SECURITY.md` | Heuristic SAST posture card tracking memory safety, secrets, and system execution. |
| 7 | `MASTER_TESTING.md` | Test registry with coverage evidence, test suite distribution, and compliance. |
| 8 | `MASTER_DEPENDENCIES.md` | Sourced dependencies registry with package, compile, and dynamic verification. |
| 9 | `MASTER_COMPONENT_INDEX.md` | Component ownership registry mapping subsystems to source files and folders. |
| 10 | `MASTER_DECISIONS.md` | Preserved Architectural Decision Records (ADR) registry. |
| 11 | `MASTER_KNOWLEDGE_GRAPH.md` | Registry of runtime domain models, event message catalogues, and interface protocols. |
| 12 | `MASTER_RISKS.md` | Risk registry and failure mode effects analysis (FMEA). |
| 13 | `MASTER_PROGRESS.md` | Production readiness dashboard tracking feature lifecycles (`PRODUCTION`, `TESTING`, etc.). |
| 14 | `MASTER_ROADMAP.md` | Development roadmap, technical debt gap analysis, and optimizations. |
| 15 | `MASTER_VALIDATION_STATUS.md` | Output of the Change Impact Engine & Architecture Drift validation rules. |

---

## 🚀 Execution Models (Plug & Play)

Choose the integration method that fits your pipeline best:

### Option A: Local Host Execution (Zero Dependencies)
AIPBF uses purely standard Python modules (`os`, `sys`, `pathlib`, `re`, `argparse`, `datetime`, `json`). Simply clone this repo and run:

- **Scan and generate all brain files**:
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
2. Performs an initial crawl and generates the 15-file document set.
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

## 📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
