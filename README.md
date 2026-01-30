[![Link Checker](https://github.com/erikkai/forge_doc_tester/actions/workflows/link-checker.yml/badge.svg)](https://github.com/erikkai/forge_doc_tester/actions/workflows/link-checker.yml)

# Forge Doc Tester
This content validator uses Docker to create a clean, reproducible environment for testing documentation. By programmatically running code snippets and instruction steps, it identifies broken code or procedures, allowing for targeted fixes. It was developed as a Minimum Viable Product (MVP) to demonstrate how automated testing can create more consistent and stable developer content. 

## Prerequisites
This project is built specifically for Tenstorrent AI hardware and is not intended for standard CPU/GPU environments. 

* **Hardware:** Requires access to Tenstorrent silicon or a Tenstorrent Cloud instance (with access to Forge).
* **Host Configuration:** Hugepages (1G) must be enabled and mounted on the host.
* **Kernel:** Requires Input-Output Memory Management Unit (IOMMU) and Virtualization support to be enabled in the BIOS/Kernel to allow for hardware device passthrough (/dev/tenstorrent).
* **Docker:** Make sure Docker is installed. 
* **Linux:** Ubuntu 22.04 is recommended. 

> **Maintenance Note:** Because the Tenstorrent software ecosystem is in active development, environment requirements change frequently. This repository reflects a specific point-in-time configuration. Users should verify current kernel and driver requirements against the [Official Tenstorrent Documentation](https://docs.tenstorrent.com/) and update the Dockerfiles or build scripts accordingly before execution.

## What it Validates
Because this is an MVP demo, it's highly project-specific. The tests are for: 
* **Installation Integrity:** Verifies that the TT-XLA wheel installs correctly from the private index.
* **Front End Accuracy:** Executes a specific TT-XLA front end code sample to ensure instruction reliability.
* **Dependency Synchronization:** Configures and verifies the Python environment for a specific TT-XLA demo.

It is designed to showcase an MVP for how wheel installation instructions can be integrated into a validation pipeline, providing teams with instant notification of breaking dependencies or environment issues. For use with other projects, the files would need to be tweaked to match the different prerequisites and instructions.  

## Instructions
To run this project, the technical writer using it would do the following: 

1. Download the repo. 

2. Navigate to the project root. 

3. Grant execution permissions: 

```bash
chmod +x xla-wheel.sh
```

4. Run the script: 

```bash
./xla-wheel.sh
```

> **NOTE:** You may need to run this with `sudo` depending on your configuration. 

## Architecture and Structure 
The repository is structured to separate the environmental configuration from the validation logic. This design ensures that the validator remains modular and can be adapted to different AI compilers or tutorial sets. Key features include:

**Containerized Environment (Dockerfile):** Because AI compilers are highly sensitive to software dependencies, the project uses Docker to ensure a consistent, "hardware-ready" stack for every test run.

**Validation Logic:** The scripts execute the instructions and capture output. If a failure occurs, the log provides a traceback of the environment state and the specific command that failed. 

**Test Payloads:** This project integrates an official example from the Tenstorrent demo repositories to validate end-to-end installation and execution steps. 

## Design Intent
The goal of the project was to create a reliable bridge between software development and technical content. The project focuses on three core principles:

* **Automation:** Replaces repetitive manual testing to ensure documentation remains accurate as the software evolves.
  
* **Environnment Isolation:** Uses a containerized approach to eliminate "it works on my machine" discrepancies during the validation process.

* **Traceability:** Prioritizes logging standard output and error streams so technical writers can quickly identify and fix documentation drift.
