# Nomad-X

### 🛡️ Infrastructure & Security Paradigms
![Zero-Trust](https://img.shields.io/badge/Zero--Trust-Architecture-red?style=for-the-badge&logo=linux&logoColor=white)
![Legal Defense](https://img.shields.io/badge/Automated-Legal_Defense-blueviolet?style=for-the-badge&logo=scale&logoColor=white)

### 🕵️‍♂️ Cybersecurity & Offensive Auditing
![Forensics](https://img.shields.io/badge/Forensics-Address_Clustering-black?style=for-the-badge&logo=kalilinux&logoColor=white)
![OSINT](https://img.shields.io/badge/OSINT-Global_Identity-informational?style=for-the-badge&logo=tor&logoColor=white)

### ⚙️ DevOps & Build Tools
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)

### ☁️🧠 Hardware, Cloud & A.I. Stack
![Gemini 2.5 Pro](https://img.shields.io/badge/Gemini_2.5_Pro-8E75B2?style=for-the-badge&logo=googlegemini&logoColor=white)
![Playwright](https://img.shields.io/badge/Playwright-2EAD33?style=for-the-badge&logo=playwright&logoColor=white)

### 💻 Languages
![Python 3.11](https://img.shields.io/badge/Python_3.11-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)

## About the Project
Nomad-X is a full-stack software application designed with a dual-layer architecture. It separates the user-facing interface from the computational logic to ensure a fast, scalable experience.

## Architecture
* **Frontend (`app/`):** Built with Flutter. Handles the cross-platform user interface and user interactions.
* **Backend (`api/`):** Built with Python. Acts as the system's brain, processing data and handling API routing.

## Core Features
* **Translation Engine:** Instantly translates user-submitted text from one language to another (e.g., English to German).
* **Health Diagnostics:** Built-in monitoring endpoints to ensure the backend is active, healthy, and ready to receive requests.

## Usage
Users interact directly with the frontend app. When a user submits text, the app sends a lightning-fast API request to the backend. The Python engine processes the translation and returns the localized data to the user's screen seamlessly.

## Continuous Integration
This project utilizes **GitHub Actions** for CI/CD. Every push or pull request triggers an automated pipeline that sets up the environment and runs the testing suite (`pytest` for backend, `flutter test` for frontend) to prevent regressions.

## Installation & Setup
1. Clone the repository to your local machine.
2. Open a terminal and navigate to the `api/` directory to start the Python backend service.
3. Open a separate terminal, navigate to the `app/` directory, and launch the Flutter application.
