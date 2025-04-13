Bookstore Database System
Course: Database Design & Programming with SQL


Project Overview
This MySQL database manages inventory, sales, and customer relationships for a bookstore. It includes 15 normalized tables handling books, authors, publishers, customers, orders, and shipping logistics.

Database Schema
Core Tables
Book: Stores book details (title, ISBN, price, stock)

Author: Tracks author information

Publisher: Manages publishing partners

Customer: Handles customer profiles and accounts

Cust_Order: Processes order transactions

Key Relationships
Many-to-many: Books to Authors (via book_author junction table)

One-to-many: Customers to Orders

Referential integrity enforced through foreign keys



Technical Implementation
Features
Inventory Management: Track stock levels and reordering

Order Processing: Record orders with status history

Customer Analytics: Store address and purchase history

Data Types
ISBNs validated via VARCHAR(20) UNIQUE

Prices stored as DECIMAL(10,2) for precision

Dates in YYYY-MM-DD format

Team Contributions
Team Member  	Role
Samuel        Testing & Documentation
Daniel    	  ER Diagram Design
Emmanuella	  SQL Implementation
