-- Step 1: Export Data from MySQL
-- Using mysqldump to export data
-- Command to run in terminal:
-- mysqldump -u root -p --databases source_db > source_db.sql

-- Step 2: Prepare PostgreSQL Database
-- Create a new database in PostgreSQL
CREATE DATABASE target_db;

-- Step 3: Convert MySQL Dump to PostgreSQL-Compatible Format
-- Option 1: Use pgloader (recommended)
-- Command to run in terminal:
-- pgloader mysql://root:password@localhost/source_db postgresql://postgres:password@localhost/target_db

-- Option 2: Manual conversion using 'mysql2pgsql' script or online tools.

-- Step 4: Data Migration with pgloader
-- Install pgloader:
-- sudo apt-get install pgloader
-- Run migration:
-- pgloader mysql://root:password@localhost/source_db postgresql://postgres:password@localhost/target_db

-- Step 5: Data Integrity Checks
-- In PostgreSQL, verify row counts match for each table:
SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items;

-- Optionally, check for NULLs in primary keys or mismatches in foreign keys.

-- Step 6: Summary Report
-- Prepare a small table in PostgreSQL for migration logs:
CREATE TABLE migration_log (
    step_no SERIAL PRIMARY KEY,
    step_description TEXT,
    status TEXT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO migration_log (step_description, status)
VALUES
('Exported data from MySQL', 'Completed'),
('Created PostgreSQL target DB', 'Completed'),
('Data migration with pgloader', 'Completed'),
('Data integrity checks', 'Completed');

-- Step 7: Query Migration Logs
SELECT * FROM migration_log ORDER BY log_time;
