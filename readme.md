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
`./screenshots/Phase II/mermaid.png`![bpmn](https://github.com/user-attachments/assets/ce974ea6-aa4e-40fb-8ffd-af270e6d48a9)


---

#### 🧩 Draw.io BPMN Diagram  
`./screenshots/Phase II/bpmn.png`

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
👉 **[Click here to view ERD Screenshot](<img width="814" height="515" alt="erd" src="https://github.com/user-attachments/assets/84e65c04-492e-4105-ac31-255694f94585" />
)**

## 📸 Screenshot: Table Relationship Overview
👉 **[Click here to view Relationship Screenshot](<img width="1400" height="1000" alt="relationship tables" src="https://github.com/user-attachments/assets/ecd247f0-1f38-4a98-b503-b027972e2389" />
)**

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
👉 <img width="1216" height="917" alt="pdb " src="https://github.com/user-attachments/assets/bab49e5e-ab6a-4e24-82c2-39958522f1b3" />


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

```
# 📘 Phase V: Table Implementation and Data Insertion

## 🎯 Objective
To implement the physical Oracle database structure for the **LawyerFirm Case Conflict Checker System** and populate it with meaningful, testable data.  
This phase ensures data integrity, correct foreign key relationships, and realistic case–lawyer assignments that support future PL/SQL logic.

---

## 🔨 Step 1: Table Creation
The following tables were created in the schema **LAWYERFIRM_DB** using Oracle SQL Developer.

### 🧱 Table: LAWYER
A table to store lawyer information including specialties.

📄 **Screenshot:**  
`.TABLE 1.png`<img width="437" height="383" alt="image" src="https://github.com/user-attachments/assets/c561ad50-2d21-4088-9808-ca01dbaa95dc" />



---

### 🧱 Table: CASE_FILE
A table that stores details of legal cases, including client, opponent, and hearing date.

📄 **Screenshot:**  
`./screenshots/Phase V/![alt text](image.png).png`

---

### 🧱 Table: LAWYER_CASE
A junction table linking lawyers to their assigned cases.

📄 **Screenshot:**  
`./screenshots/Phase V/![alt text](image-1.png).png`<img width="433" height="245" alt="CASE FILE" src="https://github.com/user-attachments/assets/fbe3351e-d712-4b94-9070-d62aecc6069a" />


---

## 📥 Step 2: Data Insertion
Realistic sample data was inserted into each table to simulate real law firm operations.

### 🗃️ Insertion: LAWYER
Lawyers with various specialties were added.

📄 **Screenshot:**  
`./screenshots/Phase V/lawyer_inserts.png`<img width="438" height="417" alt="TABLE LAWYER" src="https://github.com/user-attachments/assets/7b8674d4-afcc-4c25-b1fc-ba431b0a6203" /><img width="431" height="104" alt="image" src="https://github.com/user-attachments/assets/12f58e6a-c42d-4647-a31c-ee777dc66284" />



---

### 🗃️ Insertion: CASE_FILE
Sample court cases were inserted with client names, opponents, and hearing dates.

📄 **Screenshot:**  
`./screenshots/Phase V/casefile_inserts.png`<img width="601" height="79" alt="image" src="https://github.com/user-attachments/assets/4c1715cd-55bf-4675-b073-c3e7f0b682b8" />


---

### 🗃️ Insertion: LAWYER_CASE
Initial case assignments were inserted to test conflict logic.

📄 **Screenshot:**  
`screenshots/phaseV/TABLE LAWYER.png`

---

## 🔍 Step 3: Data Integrity Validation
JOIN queries were executed to confirm:

- ✔ All foreign key relationships are valid  
- ✔ Lawyers correctly map to their assigned cases  
- ✔ No orphan records exist  
- ✔ The system reflects realistic legal scheduling  

Validation Query Screenshot:  
`./screenshots/Phase V/data_validation.png`

---

### ✅ Validation Results Confirm:
- All **foreign keys** function correctly  
- Case-to-lawyer relationships are consistent  
- Inserted data supports future **conflict checking logic**  
- The database is ready for **Phase VI PL/SQL development**

---

# 🔧 Phase VI: PL/SQL Programming (Procedures, Functions, Cursors, Triggers, Packages)

## 🎯 Objective
To implement the core business logic of the **LawyerFirm Case Conflict Checker System** using PL/SQL.  
This phase ensures accurate validation, automated conflict detection, ethical compliance, and reliable case assignment through procedures, functions, triggers, and packages.

---

# 🧱 Database Operations

## 🔁 DML Operations
INSERT, UPDATE, and DELETE statements were used to manipulate table data during testing.

Examples:
- Inserting new lawyers  
- Modifying case hearing dates for conflict testing  
- Deleting invalid case assignments  

📄 **Screenshot:**  
`./screenshots/Phase VI/dml_operations.png`

---

## 🧩 DDL Operations
CREATE, ALTER, and DROP statements were used to build and adjust the physical schema.

Examples:
- Adding constraints to LAWYER_CASE  
- Updating CASE_FILE structure during validation tests  
- Enforcing foreign keys  

📄 **Screenshot:**  
`./screenshots/Phase VI/ddl_operations.png`

---

# 💡 Simple Analytics Problem Statement
**“Analyze how many cases each lawyer has handled to understand workload distribution.”**

This was implemented using a window function on the `LAWYER_CASE` table:

```sql
SELECT 
    l.lawyer_id,
    l.name AS lawyer_name,
    COUNT(c.case_id) OVER (PARTITION BY l.lawyer_id) AS total_cases_assigned
FROM LAWYER_CASE c
JOIN LAWYER l ON c.lawyer_id = l.lawyer_id;

```
## 🧠 Phase VII: Advanced Database Programming and Auditing

### 🎯 Objective

To secure the **Law Firm Case Conflict Checker System** by implementing **trigger-based restrictions**, a **centralized audit system**, and **package-based logging** to ensure real-time monitoring, access control, and accountability for all table-level actions.

---

## 🔍 Problem Statement

Legal case databases are highly sensitive and must be protected against unauthorized changes during business-critical times. This project implements advanced security features such as:

- ❌ Preventing case-assignment changes during weekdays and holidays  
- 🕵️ Tracking who attempted to change data, when, and on which table  
- 📦 Centralizing audit logic using PL/SQL packages  

This adds a layer of **governance**, **traceability**, and **control**, essential for Management Information Systems within a law firm environment.

---

## 📅 Holiday Restriction System

### ✅ `holiday_calendar` Table

Used to store blocked dates (official holidays).

```sql
CREATE TABLE holiday_calendar (
    holiday_date DATE PRIMARY KEY,
    description  VARCHAR2(100)
);
<img width="734" height="391" alt="TABLE AUDIT LOG " src="https://github.com/user-attachments/assets/2837b716-0003-476b-b0dd-ad3251b75c51" />
<img width="412" height="101" alt="TABLE HOLIDAY" src="https://github.com/user-attachments/assets/598cad6b-4f85-4bc5-bbf1-aacc8333694e" />


-- Sample holiday entries
INSERT INTO holiday_calendar VALUES (TO_DATE('2025-01-01','YYYY-MM-DD'), 'New Year Holiday');
INSERT INTO holiday_calendar VALUES (TO_DATE('2025-07-01','YYYY-MM-DD'), 'Independence Day');
COMMIT;
