/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated.
  Additionally, this script sets up three schemas: 'bronze', 'silver', and 'gold'.
  Since MySQL treats schema ≈ database, a True Medallion Architecture design in MySQL is separating schemas into different MySQL databases to act as Layer
  👉 bronze DB → silver DB → gold DB. Thus, treating each Medallion layer as its own database.
*/


-- Create Database 'DataWarehouse'

drop database if exists DataWarehouse;

CREATE DATABASE DataWarehouse
CHARACTER SET utf8mb4        #utf8mb4 support all characters (including emojis).
COLLATE utf8mb4_0900_ai_ci;  # ai_ci: Stands for "Accent Insensitive, Case Insensitive," which makes querying much more forgiving.

USE DataWarehouse;

-- Create Schema
# Separate DBs for Bronze/Silver/Gold
-- 1. Bronze Layer (Raw/Staging)
CREATE DATABASE IF NOT EXISTS dwh_bronze
CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;

-- 2. Silver Layer (Cleaned/Transformed)
CREATE DATABASE IF NOT EXISTS dwh_silver
CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;

-- 3. Gold Layer
CREATE DATABASE IF NOT EXISTS dwh_gold
CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;
