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

### 📝 Mermaid BPMN Explanation  
The BPMN Mermaid diagram illustrates the complete decision-making workflow used during the case assignment process in the law firm. The process begins when an admin staff member inputs the lawyer ID and case ID. The PL/SQL system immediately validates whether both the lawyer and the case exist in the database. Once confirmed, the system retrieves all previous hearing dates for that lawyer and checks for two critical conflicts: scheduling conflicts and opponent conflicts. A scheduling conflict occurs when the lawyer already has another case on the same hearing date, while an opponent conflict happens if the lawyer is already representing the opposing party in another case. The decision gateway evaluates whether any conflict exists. If a conflict is detected, the system blocks the assignment and returns a clear error message. If no conflict exists, the assignment is inserted into the LAWYER_CASE table, completing the process successfully. This BPMN flow clearly represents how MIS logic automates validations, enforces ethical compliance, and ensures accurate, conflict-free case allocation.
