# ⚖️ PL/SQL FINAL EXAM — CAPSTONE PROJECT  
## **Law Firm Case Conflict Checker Using PL/SQL**

---

## 👤 **Identification**
- **Name:** Isaro Shania Ida  
- **Student ID:** 27970  
- **Project Title:** *Law Firm Case Conflict Checker Using PL/SQL*  
- **Course:** INSY 8311 — Database Development with PL/SQL  
- **Academic Year:** 2025  
- **Lecturer:** Eric Maniraguha (eric.maniraguha@auca.ac.rw)

---

# 🚀 **Phase I — Problem Statement & Presentation**

## 📌 **Objective**
To identify a real-world challenge requiring a PL/SQL-based Oracle database solution that automates conflict checking, ensures ethical compliance, and prevents scheduling clashes in a law firm.

---

# 💡 **Project Summary: Law Firm Case Conflict Checker**

## 📖 **Problem Definition**
Law firms manage many cases at once. Assigning a lawyer incorrectly can lead to:

- Scheduling conflicts  
- Double booking a lawyer  
- Ethical conflicts of interest  
- Representing both client and opponent  
- Case delays and professional misconduct  

Manual validation is slow and error-prone.  
This project automates conflict detection using PL/SQL.

---

## 🌍 **Context**
The system is designed for:

- Medium-sized law firms  
- Legal administrative offices  
- Case allocation departments  

It supports safe, accurate case assignment through automated verification.

---

## 🎯 **Target Users**
- Legal administrators  
- Case managers  
- Senior lawyers  
- Law firm IT staff  

---

## 🏆 **Project Goals**
- Automatically detect scheduling conflicts  
- Prevent conflicts of interest  
- Validate lawyer & case existence  
- Ensure ethical and safe case assignment  
- Return meaningful PL/SQL messages  
- Improve firm efficiency and transparency  

---

# 🧩 **Key Database Entities**

| Entity           | Attributes                                                            |
|------------------|----------------------------------------------------------------------|
| **LAWYER**       | lawyer_id, name, specialty                                           |
| **CASE_FILE**    | case_id, client_name, opponent, hearing_date                         |
| **LAWYER_CASE**  | lawyer_id (FK), case_id (FK)                                         |

---

# 🔗 **Relationships**
- A **Lawyer** can have **many assigned cases** → (1:N)  
- A **Case** is assigned to **one lawyer** → (1:1)  
- **LAWYER_CASE** connects Lawyers ↔ Cases  

---

# 💎 **System Benefits**
- Eliminates manual conflict checking  
- Ensures legal & ethical compliance  
- Avoids double-booking lawyers  
- Reduces admin workload  
- Ensures accurate case assignment  
- Improves MIS decision-making  

---

# 🧭 **Phase I Mermaid Diagram**

```mermaid
flowchart TD
  A[👩‍⚖️ Admin Staff<br/>Starts Assignment] --> B[🧑‍💼 Check Lawyer Exists]
  A --> C[📁 Check Case Exists]

  B --> D[📅 Check Hearing Date<br/>Conflicts]
  C --> D

  D --> E[⚖️ Check Conflict of Interest<br/>Opponent Check]

  E --> F{Any Conflict?}

  F -- Yes --> G[❌ Reject Assignment<br/>Return Error Message]
  F -- No --> H[✅ Insert into LAWYER_CASE<br/>Assignment Successful]

  classDef actor fill:#e3f2fd,stroke:#2196f3,stroke-width:2px;
  classDef process fill:#fff3e0,stroke:#fb8c00,stroke-width:2px;
  classDef decision fill:#fce4ec,stroke:#d81b60,stroke-width:2px;

  class A actor
  class B,C,D,E process
  class F decision

 ```
 # 📘 Phase II: Business Process Modeling (MIS)

### 🔍 Scope & Purpose
This phase models the *case assignment workflow* for Moonlight Legal Agency.  
It demonstrates how the MIS supports decision-making by automating:

- Lawyer availability verification  
- Case existence validation  
- Conflict of interest checks  
- Schedule conflict detection  
- Safe and ethical assignment of cases  

The MIS reduces manual effort and ensures accurate, real-time decision-making.

---

### 👥 Key Actors

| Role                     | Responsibility                                                       |
|--------------------------|-----------------------------------------------------------------------|
| Admin Staff              | Inputs lawyer and case details to start the assignment process        |
| Lawyer                   | Receives cases assigned to them                                      |
| Case Manager             | Oversees assignment workflow                                          |
| Conflict Checker System  | Validates scheduling and ethical conflicts                            |
| Assignment System        | Records valid assignments into LAWYER_CASE                            |

---

### 🖼 Process Diagram

✅ *Tools Used:*  
- **Mermaid** (Markdown-based diagram generation)  
- **Draw.io** (Standard BPMN modeling)

#### 🔗 Mermaid Diagram  
*(Insert screenshot if required)*  
`./screenshots/Phase II/moonlight_phaseII.png`

---

#### 🧩 Draw.io BPMN Diagram  
*(Insert exported Draw.io PNG/SVG)*  
`./screenshots/Phase II/moonlight_phaseII.drawio.png`

---

### 🧠 MIS Value & Flow Summary
The workflow begins when **Admin Staff** attempts to assign a lawyer to a case.  
The MIS executes automated validation in the following order:

1. **Verify existence** of lawyer and case  
2. **Retrieve lawyer’s existing hearing dates**  
3. **Check for scheduling conflicts** (double booking)  
4. **Check for opponent conflicts** (ethical violation)  
5. If any conflict is detected → **MIS blocks the assignment**  
6. If no conflicts → **MIS saves the assignment** into `LAWYER_CASE`

This MIS improves Moonlight Legal Agency’s operations through:
- Real-time decision-making  
- Ethical compliance  
- Reduced administrative workload  
- Accurate validation  
- Transparent and safe case allocation  

---

### 💻 Mermaid Code Reference

```mermaid
flowchart TD
  start([● Process Start]) --> A1["🧑‍💼 Admin Staff\nEnter Lawyer_ID & Case_ID"]

  A1 --> A2["📁 Validate Entities\n• Check Lawyer Exists\n• Check Case Exists"]

  A2 --> B1["📅 Retrieve Lawyer Schedule\nCheck Existing Hearing Dates"]

  B1 --> C1["⚖ Conflict Check\n• Date Clash?\n• Opponent Conflict?"]

  C1 --> D1{{"❓ Conflict Detected?"}}

  D1 -- Yes --> E1["❌ Return Error\nAssignment Blocked"]

  D1 -- No --> F1["✅ Insert into LAWYER_CASE\nAssignment Confirmed"]

  F1 --> finish([✔ Process End])
  E1 --> finish

  classDef admin fill:#e3f2fd,stroke:#2196f3;
  classDef process fill:#fff3e0,stroke:#fb8c00;
  classDef decision fill:#fce4ec,stroke:#d81b60;
  classDef success fill:#c8e6c9,stroke:#388e3c;
  classDef error fill:#ffebee,stroke:#c62828;

  class A1 admin
  class A2,B1,C1 process
  class D1 decision
  class F1 success
  class E1 error




