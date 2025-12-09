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
This phase models the *case assignment workflow* for the **LawyerFirm Case Conflict Checker System**.  
The MIS supports safe, ethical, and accurate decision-making by automating:

- Lawyer existence validation  
- Case existence validation  
- Hearing date conflict detection  
- Opponent conflict-of-interest checks  
- Controlled, transparent case assignment  

This ensures professionally compliant operations inside LawyerFirm.

---

### 👥 Key Actors

| Role                     | Responsibility                                                       |
|--------------------------|-----------------------------------------------------------------------|
| Admin Staff              | Inputs lawyer_id and case_id to request assignment                    |
| Lawyer                   | Receives assigned cases                                               |
| Case Manager             | Oversees and manages the case assignment workflow                     |
| Conflict Checker System  | Detects scheduling and ethical conflicts                              |
| Assignment System        | Saves successful assignments into LAWYER_CASE                          |

---

### 🖼 Process Diagram

✅ *Tools Used:*  
- **Mermaid** (Markdown-based diagrams)  
- **Draw.io** (BPMN workflow modeling)

#### 🔗 Mermaid Diagram  
`./screenshots/Phase II/phaseII.png`

---

#### 🧩 Draw.io BPMN Diagram  
`./screenshots/Phase II/phaseII.drawio.png`

---

### 🧠 MIS Value & Flow Summary
The workflow begins when **Admin Staff** requests to assign a lawyer to a case.  
The MIS performs automatic validation through the following steps:

1. **Validates** that the lawyer exists  
2. **Validates** that the case exists  
3. **Retrieves** the lawyer’s existing hearing dates  
4. **Checks for conflicts**, including:  
   - Hearing date clash (double booking)  
   - Opponent conflict (ethical conflict of interest)  
5. If a conflict is found → Assignment is **blocked**, error returned  
6. If no conflict is found → Assignment is **saved** into `LAWYER_CASE`

This MIS process strengthens the LawyerFirm organization through:
- Real-time conflict detection  
- Ethically safe case management  
- Reduction of manual administrative work  
- Improved accuracy and transparency  
- Faster case assignment workflow  

---

### 💻 Mermaid Code Reference

```mermaid
flowchart TD
  start([● Process Start]) --> A1["🧑‍💼 Admin Staff\nEnter Lawyer_ID & Case_ID"]

  A1 --> A2["📁 Validate Entities\n• Check Lawyer Exists\n• Check Case Exists"]

  A2 --> B1["📅 Retrieve Lawyer Schedule\nLoad Existing Hearing Dates"]

  B1 --> C1["⚖ Conflict Check\n• Date Clash?\n• Opponent Conflict?"]

  C1 --> D1{{"❓ Conflict Detected?"}}

  D1 -- Yes --> E1["❌ Return Error\nAssignment Blocked"]

  D1 -- No --> F1["✅ Insert into LAWYER_CASE\nAssignment Successful"]

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

```

# 🧩 Phase III: Logical Model Design

## 🎯 Objective
The logical model for the Law Firm Case Conflict Checker system was developed to support automated case assignment and prevent ethical or scheduling conflicts within a law firm. This phase transforms the business requirements from Phase I and the workflow from Phase II into a fully normalized relational database structure. The goal is to design a clean, consistent, and well-constrained logical model that allows efficient PL/SQL validation during case assignments.

---

# 🗃️ Entities & Attributes

## 👨‍⚖️ LAWYER  
| Attribute   | Type          | Constraint                |
|-------------|---------------|---------------------------|
| lawyer_id   | NUMBER        | Primary Key               |
| name        | VARCHAR2(100) | NOT NULL                  |
| specialty   | VARCHAR2(100) | NULL                      |

---

## 📁 CASE_FILE  
| Attribute     | Type           | Constraint                      |
|---------------|----------------|----------------------------------|
| case_id       | NUMBER         | Primary Key                      |
| client_name   | VARCHAR2(100)  | NOT NULL                         |
| opponent      | VARCHAR2(100)  | NOT NULL                         |
| hearing_date  | DATE           | NOT NULL                         |

---

## 🔗 LAWYER_CASE (Assignment Table)  
| Attribute   | Type   | Constraint                                     |
|-------------|---------|------------------------------------------------|
| lawyer_id   | NUMBER  | Foreign Key → LAWYER(lawyer_id), part of PK    |
| case_id     | NUMBER  | Foreign Key → CASE_FILE(case_id), part of PK   |

---

# 🔄 Relationships & Constraints

- **LAWYER → LAWYER_CASE** : One lawyer can be assigned many cases  
- **CASE_FILE → LAWYER_CASE** : Each case is assigned to one lawyer  
- **LAWYER_CASE** ensures a validated and controlled link between lawyers and cases  
- Foreign keys enforce consistency and prevent invalid assignments  

---

# 📐 Normalization (3NF Verification)

### ✔ 1NF – All data fields store atomic values  
### ✔ 2NF – Every non-key attribute fully depends on the key  
### ✔ 3NF – No transitive dependencies exist  

The schema is optimized for conflict detection efficiency.

---

# 🖼️ ERD Diagram (Logical Model)

## 📸 Screenshot: Logical ERD (From SQL Developer or Draw.io)
👉 **[Click here to view ERD Screenshot](PUT_YOUR_ERD_SCREENSHOT_LINK_HERE)**

## 📸 Screenshot: Table Relationship Overview
👉 **[Click here to view Relationship Screenshot](PUT_YOUR_RELATIONSHIP_SCREENSHOT_LINK_HERE)**

---

# 🧱 Table Creation Scripts

## 👨‍⚖️ LAWYER Table
```sql
CREATE TABLE LAWYER (
    lawyer_id    NUMBER PRIMARY KEY,
    name         VARCHAR2(100) NOT NULL,
    specialty    VARCHAR2(100)
);

```

# 🏗️ Phase IV: Database Creation and Access Setup (via SQL Developer)

## 🎯 Objective
To create a dedicated Oracle PL/SQL development environment for the Law Firm Case Conflict Checker system using SQL Developer. This setup prepares the PDB, user account, and all necessary access privileges required for implementation of tables, PL/SQL procedures, and triggers.

---

## 🔐 Task 1: PDB and User Creation (Using SQL Developer)
The development environment was created inside an Oracle Pluggable Database (PDB) using SQL Developer.  
SQL Developer is used as an alternative to OEM, offering full administrative control for this project.

---

## 🧰 Configuration Summary
| Component          | Value                                            |
|--------------------|--------------------------------------------------|
| Tool Used          | SQL Developer (OEM Alternative)                 |
| PDB Name           | mon_27970_isaro_LawFirm_db                      |
| User Created       | isaro27970                                       |
| Password           | isaro                                            |
| Privileges Granted | Full DBA privileges                              |

---

## 📸 Screenshot: PDB Creation in SQL Developer
👉 **[Click here to view screenshot](PUT_YOUR_PDB_SCREENSHOT_LINK_HERE)**

---

## 📸 Screenshot: User Creation & Privilege Assignment
👉 **[Click here to view screenshot](PUT_YOUR_USER_PRIVILEGE_SCREENSHOT_LINK_HERE)**

---

## 🧾 SQL Commands Executed (via SQL*Plus / SQL Developer Worksheet)

```sql
-- Switch into the project PDB
ALTER SESSION SET CONTAINER=mon_27970_isaro_LawFirm_db;

-- Create project user
CREATE USER isaro27970 IDENTIFIED BY isaro;

-- Grant full privileges for development
GRANT ALL PRIVILEGES TO isaro27970;
GRANT SYSDBA TO isaro27970;
