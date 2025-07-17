# Project Agents.md Guide for OpenAI Codex (Python Version)

This `agents.md` file defines both the agent architecture and operational guidance for OpenAI Codex and related agents working on this Python-based codebase.

---

## 👷‍♂️ Agent Architecture

### 🧠 ChiefAgent (`ChiefAgent`)
**Role**: Leads the team and interacts with the user.  
**Responsibilities**:
- Interprets user instructions and defines tasks.
- Delegates tasks to suitable agents.
- Coordinates workflow and maintains progress.
- Ensures the quality and consistency of agent output.

### 🛠️ CodeWorkerAgent
**Role**: Implements Python code based on requirements.  
**Responsibilities**:
- Writes classes, functions, modules.
- Follows PEP8 and existing code conventions.
- Structures code for readability and reuse.
- Uses docstrings and type hints where appropriate.

### 🧪 QA-Agent (`TestAgent`)
**Role**: Validates functionality and code integrity.  
**Responsibilities**:
- Writes tests using `unittest` or `pytest`.
- Ensures full code coverage where possible.
- Runs static analysis using tools like `flake8`, `mypy`, `pylint`.

### 🎨 DesignAgent
**Role**: Responsible for CLI/UX/API design.  
**Responsibilities**:
- Proposes clean CLI flows and argument parsing.
- Suggests FastAPI or Flask structure for web backends.
- Improves interaction ergonomics and user feedback.

### 🔍 CreativeAgent (`OutOfBox`)
**Role**: Offers unique or unconventional ideas.  
**Responsibilities**:
- Breaks away from predictable patterns.
- Suggests libraries, hacks, or architecture shifts.
- Proposes shortcuts or experimental approaches.

### 🧾 DokumentAgent
**Role**: Maintains technical documentation.  
**Responsibilities**:
- Writes `README.md`, `docs/`, and module docstrings.
- Updates changelogs and installation instructions.
- Keeps `agents.md` up to date.

---

## 📁 Project Structure for Codex Navigation

- `/src`: Python source files
  - `/modules`: Reusable functional or class-based modules
  - `/cli`: CLI entrypoints (e.g., using argparse, typer, click)
  - `/api`: REST API (FastAPI/Flask apps)
  - `/utils`: Utility functions
- `/tests`: Unit and integration tests
- `/scripts`: Ad-hoc or setup scripts
- `/docs`: Documentation markdown and diagrams

---

## 📐 Coding Conventions for Python

- Use **Python 3.10+**
- Follow **PEP8** and existing code style
- Use **type hints** and **docstrings**
- Structure larger logic in modules/classes
- Avoid duplication; prefer DRY principles

---

## 🧪 Testing and QA Requirements

Testing should be handled via:

```bash
# Run tests
pytest

# Run with coverage
pytest --cov=src/

# Run linters
flake8 src/
mypy src/
pylint src/
```

---

## 🔀 Pull Request Guidelines for Codex

1. Clear and concise description
2. Link to any tracked issues
3. Ensure all checks/tests pass
4. Add example usage or CLI help output
5. Keep PRs scoped and atomic

---

## ✅ Programmatic Checks Before Merge

Ensure:

```bash
flake8 src/
mypy src/
pytest --cov=src/
```

All must pass before merging Codex-generated code.

---

## 💡 Workflow Summary

All agents report progress to ChiefAgent. ChiefAgent ensures completion, correct output, and interaction with the user. Codex should iterate and refine based on feedback.
