-- Drop existing tables if they exist
DROP TABLE IF EXISTS Stock, PurchaseOrderItems, PurchaseOrders, Products, Categories, Warehouses, Suppliers;

-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- Warehouses Table
CREATE TABLE Warehouses (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(255)
);

-- Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Stock Table (Many-to-Many between Products and Warehouses)
CREATE TABLE Stock (
    product_id INT,
    warehouse_id INT,
    quantity INT NOT NULL CHECK (quantity >= 0),
    PRIMARY KEY (product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouses(warehouse_id)
);

-- PurchaseOrders Table
CREATE TABLE PurchaseOrders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('Pending', 'Received', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- PurchaseOrderItems Table (Many-to-Many: Orders and Products)
CREATE TABLE PurchaseOrderItems (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES PurchaseOrders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sample Data

-- Categories
INSERT INTO Categories (name) VALUES ('Electronics'), ('Furniture'), ('Stationery');

-- Suppliers
INSERT INTO Suppliers (name, email, phone, address) VALUES
('Global Supplies', 'contact@globalsupplies.com', '123-456-7890', '123 Industrial Road'),
('Tech Distributors', 'sales@techdist.com', '987-654-3210', '456 Silicon Ave');

-- Warehouses
INSERT INTO Warehouses (name, location) VALUES 
('Main Warehouse', 'Downtown'),
('Backup Warehouse', 'Uptown');

-- Products
INSERT INTO Products (name, sku, category_id, price) VALUES
('Laptop', 'ELEC001', 1, 1200.00),
('Office Desk', 'FURN001', 2, 250.00),
('Printer Paper', 'STAT001', 3, 5.00);

-- Stock
INSERT INTO Stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 10),
(2, 1, 5),
(3, 1, 100),
(3, 2, 50);

-- Purchase Orders
INSERT INTO PurchaseOrders (supplier_id, order_date, status) VALUES
(1, '2025-05-01', 'Received'),
(2, '2025-05-02', 'Pending');

-- Purchase Order Items
INSERT INTO PurchaseOrderItems (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 5, 1100.00),
(1, 3, 200, 4.50),
(2, 2, 10, 240.00);
