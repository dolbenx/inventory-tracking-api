# 📦 Inventory Tracking System API

## Description

A simple but effective inventory tracking api to help track your inventory

This project is a full-featured inventory tracking system built with:
- **MySQL** (database)
- **FastAPI** (Python web framework)
- **SQLAlchemy** (ORM)
- **Pydantic** (data validation)

It includes:
- Relational database schema with constraints
- RESTful CRUD API
- Sample data for testing

## 🚀 How to Run

### 1. Clone the Repository

```bash
git clone https://github.com/dolbenx/inventory-tracking-api
cd inventory-tracking-api

### 2. Set Up the Environment, 
#Run the command to install required elements

pip install -r requirements.txt

### 3. Set MySQL Credentials
## You will need MySQL Installed. You can follow how to install here https://dev.mysql.com/downloads/installer/
## Make sure your DB Credentials are correct in the .env File

DB_HOST=localhost
DB_USER=root #Replace with your DB USERNAME
DB_PASSWORD=yourpassword #Replace with your DB PASSWORD
DB_NAME=inventory_tracking 

### 3. Create the DB

# Login using:
mysql -u root -p

# Then run SQL commands:
CREATE DATABASE inventory_tracking;

# Then import the schema
mysql -u root -p inventory_db < inventory_tracking.sql

### 4. Inventory Tracking System API
uvicorn app.main:app --reload



