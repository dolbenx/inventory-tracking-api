# 🧾 Inventory Tracking Database System

## 📌 Description
This project is a complete **Inventory Tracking Database Management System** built using **MySQL only**. It is designed to manage and track products, suppliers, warehouses, inventory levels, and transaction history (stock-in/out) in a scalable and normalized relational structure.

## 🛠️ Features
- Tracks suppliers, products, and warehouses.
- Maintains inventory levels per product per warehouse.
- Records IN and OUT stock transactions.
- Tracks users responsible for stock movements.
- Fully normalized relational schema with constraints.

## 🧪 How to Set Up

1. Clone this repository:
   ```bash
   git clone https://github.com/dolbenx/invetory-tracking-DB

2. Open MySQL or phpMyAdmin. ## Make sure its installed

3. Import the SQL file:
    SOURCE path/to/inventory_tracking.sql;

    ## OR using MySQL CLI: 

    mysql -u your_username -p < inventory_tracking.sql

4. The database will be created as InventoryTrackingDB.

#### ERD

![alt text](<ERD Diagram.png>)