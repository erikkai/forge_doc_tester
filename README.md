# Forge Doc Tester
This content validator uses Docker to create a clean, reproducible environment for testing documentation. By programmatically running code snippets and instruction steps, it identifies broken code or procedures, allowing for targeted fixes. It was developed as a Minimum Viable Product (MVP) to demonstrate how automated testing can create more consistent and stable developer content. 

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
