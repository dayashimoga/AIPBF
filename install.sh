#!/usr/bin/env bash
# ==============================================================================
# Universal AI Project Brain Framework (AIPBF) Plug-and-Play Installer
# ==============================================================================
# Installs AIPBF and registers pre-commit hooks to automate repository scans.
# Supports both embedding in a target repository or local environment setup.
# ==============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_help() {
    echo "Usage: ./install.sh [options]"
    echo "Options:"
    echo "  --target <path>    Integrate AIPBF into another repository located at <path>"
    echo "  --help             Show this help menu"
}

# Parse options
TARGET_REPO=""
while [[ $# -gt 0 ]]; do
    case "$1" in
        --target)
            TARGET_REPO="$2"
            shift 2
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Detect Python 3
if ! command -v python3 &> /dev/null && ! command -v python &> /dev/null; then
    echo "Error: Python 3 is required but could not be located in your PATH."
    exit 1
fi
PYTHON_CMD="python3"
if ! command -v python3 &> /dev/null; then
    PYTHON_CMD="python"
fi

if [ -n "${TARGET_REPO}" ]; then
    # Integration Mode: Copy files to the target repository
    if [ ! -d "${TARGET_REPO}" ]; then
        echo "Error: Target directory '${TARGET_REPO}' does not exist!"
        exit 1
    fi
    TARGET_DIR="$(cd "${TARGET_REPO}" && pwd)"
    echo "====== AIPBF Integration Bootstrapping ======"
    echo "Target Repo: ${TARGET_DIR}"
    echo "==========================================="

    # Create destination tools directory
    DEST_DIR="${TARGET_DIR}/tools/project_brain"
    echo "[Install] Creating ${DEST_DIR} directory..."
    mkdir -p "${DEST_DIR}"

    # Copy files
    echo "[Install] Copying core engine..."
    cp "${SCRIPT_DIR}/analyzer.py" "${DEST_DIR}/"
    cp "${SCRIPT_DIR}/reviewer.py" "${DEST_DIR}/"
    cp "${SCRIPT_DIR}/generator.py" "${DEST_DIR}/"
    cp "${SCRIPT_DIR}/project_brain.py" "${DEST_DIR}/"
    if [ -f "${SCRIPT_DIR}/Dockerfile" ]; then
        cp "${SCRIPT_DIR}/Dockerfile" "${DEST_DIR}/"
    fi

    # Trigger first scan
    echo "[Install] Running initial repository scan..."
    "${PYTHON_CMD}" "${DEST_DIR}/project_brain.py" --init --scan --path "${TARGET_DIR}"

    # Set up pre-commit hook
    HOOK_FILE="${TARGET_DIR}/.git/hooks/pre-commit"
    if [ -d "${TARGET_DIR}/.git" ]; then
        echo "[Install] Injecting automated Git pre-commit hook..."
        cat << 'EOF' > "${HOOK_FILE}"
#!/usr/bin/env bash
# AIPBF Pre-Commit Auto-Sync Hook
python3 tools/project_brain/project_brain.py --scan
git add AI_BRAIN/PROJECT_BRAIN.md CODE_UNDERSTANDING.md AI_CONTEXT_PACKAGE.md
EOF
        chmod +x "${HOOK_FILE}"
        echo "[Install] Pre-commit hook successfully established!"
    fi
else
    # Local Mode: Set up hooks in the current directory if it's a repository
    echo "====== AIPBF Local Setup ======"
    echo "Directory: ${SCRIPT_DIR}"
    echo "================================="

    # Trigger first scan locally
    echo "[Install] Running initial repository scan..."
    "${PYTHON_CMD}" "${SCRIPT_DIR}/project_brain.py" --init --scan --path "${SCRIPT_DIR}"

    HOOK_FILE="${SCRIPT_DIR}/.git/hooks/pre-commit"
    if [ -d "${SCRIPT_DIR}/.git" ]; then
        echo "[Install] Injecting automated Git pre-commit hook..."
        cat << 'EOF' > "${HOOK_FILE}"
#!/usr/bin/env bash
# AIPBF Pre-Commit Auto-Sync Hook
python3 project_brain.py --scan
git add AI_BRAIN/PROJECT_BRAIN.md CODE_UNDERSTANDING.md AI_CONTEXT_PACKAGE.md
EOF
        chmod +x "${HOOK_FILE}"
        echo "[Install] Pre-commit hook successfully established!"
    fi
fi

echo "====== AIPBF Integration Complete! ======"
