Company: CODTECH IT SOLUTIONS PVT. LTD. Name: PRAACHI SINGH Intern ID: CT04DH2285 Domain: SQL Duration: 4 Weeks Mentor: NEELA SANTOSH

Welcome to trends practice project built during my CODTECH Internship. This project demonstrates practical usage of data from a MySQL database to a PostgreSQL database while ensuring data integrity and consistency.

 MySQL to PostgreSQL Migration

 Overview

This project demonstrates the migration of data from a MySQL database to a PostgreSQL database while ensuring data integrity and consistency.
The migration process is designed to be reliable, maintain all constraints, and minimize downtime.

 Goals

* Transfer schema and data from MySQL to PostgreSQL
* Preserve relationships, constraints, and indexes
* Maintain 100% data accuracy and integrity
* Minimize downtime

 Tools & Technologies Used

* **MySQL** – Source database
* **PostgreSQL** – Target database
* **pgloader** – Automated data migration
* **mysqldump** – Data export from MySQL
* **SQL Scripts** – Integrity checks and logging

 Migration Steps

### 1. Export Data from MySQL

```bash
mysqldump -u root -p --databases source_db > source_db.sql
```

### 2. Create Target Database in PostgreSQL

```sql
CREATE DATABASE target_db;
```

### 3. Use pgloader to Migrate Data

```bash
pgloader mysql://root:password@localhost/source_db postgresql://postgres:password@localhost/target_db
```

### 4. Perform Data Integrity Checks in PostgreSQL

```sql
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;
```

 Data Integrity Measures

* Row count validation
* Primary key and foreign key checks
* Spot checks for random records
 Migration Log Table

```sql
CREATE TABLE migration_log (
    step_no SERIAL PRIMARY KEY,
    step_description TEXT,
    status TEXT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Example entries:

```sql
INSERT INTO migration_log (step_description, status)
VALUES
('Exported data from MySQL', 'Completed'),
('Created PostgreSQL target DB', 'Completed'),
('Data migration with pgloader', 'Completed'),
('Data integrity checks', 'Completed');
```

---

 Recommendations

* Test all application queries on PostgreSQL before going live
* Set up regular backups
* Use migration tools for future upgrades to reduce manual work

 Conclusion

The migration was completed successfully with no data loss, ensuring data integrity and improved performance in PostgreSQL.


