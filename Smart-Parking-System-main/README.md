# ParkSpot+ 🅿️
### Adaptive Smart Parking Management System

ParkSpot+ is a full-stack smart parking web application designed to simplify parking discovery, slot selection, booking, checkout, pricing management, and administrative monitoring.

The current repository contains the working **React + Vite frontend** and **Node.js + Express backend**. It also contains an integration point for an optional AI/ML occupancy-prediction service. The separate AI model/service and its training dataset are **not included in this repository snapshot**, so they are documented as an optional integration rather than being presented as bundled functionality.

> **Author:** Monisha  
> **GitHub:** [Monishanair2007](https://github.com/Monishanair2007)

---

## ✨ Key Features

### 👤 User Features
- 🔐 User registration and login
- 🅿️ Parking-zone selection
- 🚗 Vehicle-type selection:
  - Two Wheeler
  - Four Wheeler
  - Electric Vehicle (EV)
- 🎯 Parking-slot discovery with occupancy indicators
- 📅 Date, entry-time, and exit-time based booking
- 💰 Parking charge estimation
- 🧾 Booking history and booking status
- 🚪 Early/late checkout handling
- 👤 User credential updates
- 🎨 Theme customization and responsive interface

### 🛡️ Admin Features
- 📊 Administrative dashboard
- 👥 User visibility and management
- 📋 Booking visibility
- 💵 Vehicle-wise pricing management
- 📈 Revenue and occupancy-oriented information
- 🅿️ Parking-zone information
- ⚙️ Administrative controls

### 🤖 AI/ML Integration
The frontend contains an integration layer for an occupancy-prediction endpoint:

```text
POST http://localhost:8000/predict-occupancy
```

The application prepares parking-related input features such as:
- Sensor proximity
- Sensor pressure
- Vehicle weight
- Vehicle height
- Weather temperature
- Weather precipitation
- Traffic level
- Noise level
- Ultrasonic measurement
- Entry hour
- Parking history
- Proximity to exit
- Dynamic pricing
- Parking duration
- Payment amount

**Important:** The compatible AI/ML prediction server, model files, and training dataset are not present in this repository. Therefore, the AI feature should be described as an **external/optional prediction-service integration**, not as a model bundled with this codebase.

---

## 🧠 What “Adaptive” Means

In the context of smart parking, an adaptive system can use changing parking patterns and operational data to improve how occupancy and parking availability are handled over time.

In this repository, the adaptive/AI concept is represented through the application's occupancy-prediction integration point. The actual trained prediction model is external to this repository snapshot.

---

## 🏗️ System Architecture

```text
                    ┌──────────────────────────┐
                    │      React + Vite        │
                    │        Frontend          │
                    │     localhost:5173       │
                    └────────────┬─────────────┘
                                 │
                       REST API / HTTP
                                 │
                    ┌────────────▼─────────────┐
                    │     Node.js + Express    │
                    │         Backend          │
                    │      localhost:3001      │
                    └────────────┬─────────────┘
                                 │
                         JSON persistence
                                 │
                    ┌────────────▼─────────────┐
                    │      backend/data/       │
                    │         db.json           │
                    └──────────────────────────┘

Optional AI/ML integration:
Frontend ─────────────► localhost:8000/predict-occupancy
                         External prediction service
```

---

## 🛠️ Technology Stack

| Layer | Technology |
|---|---|
| Frontend | React 19 |
| Build Tool | Vite |
| Backend | Node.js |
| API Framework | Express |
| Cross-Origin Requests | CORS |
| Data Parsing | Body Parser / native JSON handling |
| Database | Local JSON file (`db.json`) |
| Styling | CSS |
| Package Manager | npm |
| AI/ML Integration | External occupancy-prediction API |

---

## 📁 Project Structure

```text
ParkSpot-GitHub-Ready/
│
├── backend/
│   ├── data/
│   │   └── db.json
│   ├── index.js
│   ├── package.json
│   └── package-lock.json
│
├── frontend/
│   ├── public/
│   │   ├── car.svg
│   │   ├── favicon.svg
│   │   ├── icons.svg
│   │   └── robots.txt
│   ├── src/
│   │   ├── assets/
│   │   │   └── hero.png
│   │   ├── api.js
│   │   ├── App.css
│   │   ├── App.jsx
│   │   ├── index.css
│   │   └── main.jsx
│   ├── index.html
│   ├── package.json
│   ├── package-lock.json
│   ├── eslint.config.js
│   └── vite.config.js
│
├── .gitignore
├── LICENSE
├── README.md
├── run_parkspot.bat
└── run_parkspot.sh
```

---

## 🚀 Installation and Setup

### Prerequisites

Install the following before running the project:

- **Node.js 18+**
- **npm**
- A modern web browser

Check the installation:

```bash
node --version
npm --version
```

### Option 1 — Windows

From the project root, run:

```text
run_parkspot.bat
```

The script opens separate terminal windows for the backend and frontend.

Then open:

```text
http://localhost:5173
```

### Option 2 — macOS / Linux

Make the script executable if required:

```bash
chmod +x run_parkspot.sh
```

Run:

```bash
./run_parkspot.sh
```

Then open:

```text
http://localhost:5173
```

### Option 3 — Manual Setup

#### Start the backend

```bash
cd backend
npm install
node index.js
```

Backend:

```text
http://localhost:3001
```

#### Start the frontend

Open a second terminal:

```bash
cd frontend
npm install
npm run dev
```

Frontend:

```text
http://localhost:5173
```

---

## 🔑 Demo Accounts

The included `backend/data/db.json` contains demo-only accounts.

### Admin

```text
Email: admin@example.com
Password: admin123
```

### User

```text
Email: user@example.com
Password: user123
```

These credentials are for local demonstration only. Do **not** use them for a production deployment.

---

## 🔌 Backend API

The Express backend currently exposes routes for:

### Authentication
```text
POST /api/login
POST /api/register
```

### Users
```text
GET  /api/users
POST /api/users/update-credentials
```

### Parking Zones
```text
GET /api/zones
```

### Pricing
```text
GET /api/pricing
PUT /api/pricing
```

### Bookings
```text
GET   /api/bookings
GET   /api/bookings/:email
POST  /api/bookings
PATCH /api/bookings/:id
POST  /api/bookings/:id/checkout
```

### Occupancy Analytics
```text
GET /api/occupancy-history
```

The occupancy-history endpoint expects an external dataset at:

```text
backend/ensemble-predict-occupancy/Iot_Smart_Parking_Cleaned_Dataset.csv
```

That dataset is **not included** in this repository snapshot. Without it, the endpoint can report that analytics data is unavailable.

---

## 🤖 AI/ML Component — Repository Scope

The project frontend includes:

```text
predictOccupancyEnsemble(...)
```

and sends prediction requests to:

```text
http://localhost:8000/predict-occupancy
```

The repository does **not** contain:
- a trained ML model file,
- a Python inference server,
- the AI service's `requirements.txt`,
- the referenced occupancy dataset,
- or the `ensemble-predict-occupancy` directory.

Therefore, the repository should not claim that a trained AI model is directly packaged inside this version.

### To connect an AI service

A compatible external service should:
1. Listen on port `8000`.
2. Expose `POST /predict-occupancy`.
3. Accept the parking-related feature payload sent by the frontend.
4. Return the prediction structure expected by the frontend, including slot prediction information where required.

This design keeps the web application and AI inference service modular.

---

## 💾 Data Storage

The current application uses:

```text
backend/data/db.json
```

for local persistence of:
- users,
- bookings,
- pricing,
- parking zones.

This approach is appropriate for a classroom project, prototype, or local demonstration.

For production use, the application should migrate to a proper database and implement stronger authentication, password hashing, authorization, validation, rate limiting, and secure secret management.

---

## 🔐 Security Notes

This repository is intended for development and demonstration.

The current implementation stores demo passwords directly in the JSON database and uses simple application-level role handling. For production deployment, replace this with:

- Password hashing such as bcrypt/Argon2
- Session or token-based authentication
- Server-side authorization checks
- Input validation
- HTTPS
- Environment variables for secrets
- A production database
- Rate limiting and security middleware

Do not place real credentials, API keys, or private datasets in the repository.

---

## 📌 Project Highlights

- Full-stack React and Node.js architecture
- Parking zones and slot selection
- Vehicle-aware parking workflow
- Booking and checkout management
- Pricing administration
- Local JSON persistence
- Responsive UI with theme customization
- Optional AI/ML occupancy-prediction integration
- Clear separation between frontend, backend, and optional AI service

---

## 🧪 Development Commands

### Frontend

```bash
cd frontend
npm run dev
```

Production build:

```bash
npm run build
```

Preview production build:

```bash
npm run preview
```

Lint:

```bash
npm run lint
```

### Backend

```bash
cd backend
node index.js
```

---

## 👩‍💻 Author

**Monisha**

B.Tech — Artificial Intelligence & Machine Learning

GitHub: [Monishanair2007](https://github.com/Monishanair2007)

---

## 📄 License

This project is released under the **MIT License**.

Copyright © 2026 Monisha.

See the [`LICENSE`](LICENSE) file for details.

---

## ⭐ Repository Note

ParkSpot+ is structured as a learning and demonstration project for full-stack smart parking management with an optional AI/ML prediction layer. The repository documents the functionality that is actually included and clearly separates external AI/data dependencies from the code packaged here.
