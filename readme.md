# 🚀 JMeter Performance Testing Framework

A production-ready **API performance testing framework** built using **Apache JMeter**, designed to run **Baseline, Load, Stress, and Spike tests** locally and in **CI pipelines** with rich HTML reports.

---
```

## 🚀 Why This Project Exists

Most beginners run JMeter tests manually, one by one, without structure or automation.

This project exists to solve that by providing:

- A **repeatable performance testing workflow**
- **Multiple performance test types** in one command
- **Automated HTML report generation**
- **CI/CD-ready execution**
- A structure that mirrors **real enterprise projects**

---
```

## 🧠 Core Concepts

This framework demonstrates the following performance engineering concepts:

- **Baseline Testing** – Understand system behavior under minimal load  
- **Load Testing** – Validate performance under expected traffic  
- **Stress Testing** – Identify breaking points  
- **Spike Testing** – Observe system response to sudden traffic bursts  
- **Ramp-up strategy** – Gradual vs aggressive user onboarding  
- **Duration-based execution** – Time-controlled tests instead of loop-only runs  
- **Metrics-driven analysis** – Min / Max / Avg / Throughput / Apdex  

---
```

## 🧱 Tech Stack

- **Apache JMeter 5.6.3**
- **Java 11 (Temurin)**
- **Windows Batch Scripting (`.bat`)**
- **GitHub Actions (CI)**
- **HTML + JS JMeter Dashboard**
- **GitHub Artifacts for reports**

---
```

## 📂 Project Structure

```
jmeter-performance-project/
│
├── config/
│   └── test.properties          # Global JMeter properties
│
├── data/
│   ├── user.csv                 # Test data (optional)
│   └── test_data.csv
│
├── test-plans/
│   └── login_perf_test.jmx      # Main JMeter test plan
│
├── scripts/
│   └── run_test.bat             # Runs all performance tests sequentially
│
├── results/
│   ├── baseline.jtl
│   ├── load.jtl
│   ├── stress.jtl
│   ├── spike.jtl
│   └── reports/
│       ├── baseline-report/
│       ├── load-report/
│       ├── stress-report/
│       └── spike-report/
│
├── .github/workflows/
│   └── performance.yml          # CI pipeline
│
└── README.md

```


## ▶️ How to Run
🔹 Prerequisites
Java 11 installed

Apache JMeter extracted at:

C:\tools\apache-jmeter-5.6.3
🔹 Run Locally
.\scripts\run_test.bat
This single command will:

Clean old results

Run Baseline → Load → Stress → Spike

Generate HTML dashboards for each test

```


## 🤖 CI / CD Ready
This framework is fully integrated with GitHub Actions.

On every push or PR to the development branch:

JMeter runs in Non-GUI mode

Reports are generated

Reports are uploaded as CI artifacts

⚠️ Important:
Always extract the artifact ZIP before opening index.html to ensure CSS and charts load correctly.

```

## 📊 run_test Report
Each test generates an Apache JMeter HTML Dashboard containing:

Response Time (Min / Avg / Max)

Throughput

Error Percentage

Apdex Score

Charts over time

Request-wise statistics

Reports are available under:

results/reports/<test-name>-report/index.html

``` 

## ✅ What This Framework Is Good At
✔ Real-world performance testing
✔ One-command execution
✔ CI automation
✔ Clean project structure
✔ Interview-ready demonstration
✔ Extendable to SLA assertions & thresholds

This is not a demo — it’s a foundation-level performance framework.

```

## 👤 Created By
Rajeev Shrinivas
Performance & Automation Enthusiast
Bengaluru, India 🇮🇳