# Nomad-X

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
