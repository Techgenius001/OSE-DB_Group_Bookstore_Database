/* -- This SQL script creates a database schema for a simple user management system.
-- It includes tables for users, roles, permissions, and logs.
-- Book Table */

CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    language_id INT NOT NULL,
    publisher_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    FOREIGN KEY (language_id) REFERENCES Book_language(language_id) ON DELETE CASCADE,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id) ON DELETE CASCADE
);

-- Insert 15 Sample Books
INSERT INTO Book (title, isbn, language_id, publisher_id, price, stock_quantity) VALUES
('To Kill a Mockingbird', '978-0061120084', 1, 1, 12.99, 25),
('1984', '978-0451524935', 1, 2, 9.99, 18),
('The Great Gatsby', '978-0743273565', 1, 3, 10.50, 15),
('One Hundred Years of Solitude', '978-0060883287', 2, 4, 14.95, 12),
('The Alchemist', '978-0062315007', 1, 5, 11.25, 30),
('Pride and Prejudice', '978-1503290563', 1, 6, 8.75, 22),
('The Hobbit', '978-0547928227', 1, 7, 15.99, 20),
('Crime and Punishment', '978-0143107637', 3, 8, 13.45, 10),
('The Catcher in the Rye', '978-0316769488', 1, 9, 11.99, 17),
('Harry Potter and the Sorcerer''s Stone', '978-0439708180', 1, 10, 16.50, 35);
('The Lord of the Rings', '978-0544003415', 1, 7, 22.99, 28),
('The Da Vinci Code', '978-0307474278', 1, 1, 14.50, 20),
('The Hunger Games', '978-0439023481', 1, 10, 12.99, 32),
('Love in the Time of Cholera', '978-0307387264', 2, 4, 15.75, 14),
('Anna Karenina', '978-0143035008', 3, 8, 18.25, 9);

/*-- Book Language Table*/
CREATE TABLE Book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50) NOT NULL UNIQUE
);

/* -- Insert 3 Sample Languages
-- Note: The language_id is auto-incremented, so we don't need to specify it in the insert statement. */
INSERT INTO Book_language (language_name) VALUES
(1, 'English'),
(2, 'Spanish'), /* "One Hundred Years of Solitude" (Gabriel García Márquez), "Love in the Time of Cholera" (Gabriel García Márquez) */
(3, 'Russian'); /* "Crime and Punishment" (Fyodor Dostoevsky), Anna Karenina (Leo Tolstoy) */

/*-- Publisher Table*/
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    website VARCHAR(255),
    contact_email VARCHAR(255) UNIQUE
);

/* Insert Publisher Data For All 15 Books "*/
INSERT INTO Publisher (publisher_id, publisher_name, website, contact_email) VALUES
(1, 'HarperCollins', 'https://www.harpercollins.com', 'contact@harpercollins.com'),
(2, 'Signet Classics', 'https://www.penguinrandomhouse.com', 'classics@penguinrandomhouse.com'),
(3, 'Scribner', 'https://www.simonandschuster.com', 'scribner@simonandschuster.com'),
(4, 'Harper Perennial', 'https://www.harpercollins.com', 'perennial@harpercollins.com'),
(5, 'HarperOne', 'https://www.harpercollins.com', 'one@harpercollins.com'),
(6, 'CreateSpace', 'https://www.createspace.com', 'support@createspace.com'),
(7, 'Houghton Mifflin Harcourt', 'https://www.hmhco.com', 'trade@hmhco.com'),
(8, 'Penguin Classics', 'https://www.penguinrandomhouse.com', 'classics@penguinrandomhouse.com'),
(9, 'Little, Brown and Company', 'https://www.littlebrown.com', 'info@littlebrown.com'),
(10, 'Scholastic', 'https://www.scholastic.com', 'contact@scholastic.com'),
(7, 'Houghton Mifflin Harcourt', 'https://www.harpercollins.com', 'perennial@harpercollins.com'),
(1, 'HarperColins', 'https://www.harpercollins.com', 'contact@harpercollins.com')
(10, 'Scholastic', 'https://www.scholastic.com', 'contact@scholastic.com')
(4, 'Harper Perennial', 'https://www.harpercollins.com', 'perennial@harpercollins.com')
(8, 'Penguin Classics', 'https://www.penguinrandomhouse.com', 'classics@penguinrandomhouse.com')

/* Schema table Details */
-- This schema now fully supports:
-- 1. All 15 books in your collection
-- 2. Complete publisher contact information
-- 3. Website references for each publisher
-- 4. Unique email constraints for proper database integrity

/*-- Book Author Table*/
CREATE TABLE Book_author (
    book_author_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Author(author_id) ON DELETE CASCADE
);

/* Insert Book Author Data For All 15 Books */
INSERT INTO Book_author (book_author_id, book_id, author_id) VALUES
(1, 1, 1), /* "To Kill a Mockingbird" (Harper Lee) */
(2, 2, 2), /* "1984" (George Orwell) */
(3, 3, 3), /* "The Great Gatsby" (F. Scott Fitzgerald) */
(4, 4, 4), /* "One Hundred Years of Solitude" (Gabriel García Márquez) */
(5, 5, 5), /* "The Alchemist" (Paulo Coelho) */
(6, 6, 6), /* "Pride and Prejudice" (Jane Austen) */
(7, 7, 7), /* "The Hobbit" (J.R.R. Tolkien) */
(8, 8, 8), /* "Crime and Punishment" (Fyodor Dostoevsky) */
(9, 9, 9), /* "The Catcher in the Rye" (J.D. Salinger) */
(10, 10, 10); /* "Harry Potter and the Sorcerer's Stone" (J.K. Rowling) */
(11, 11, 7), /* "The Lord of the Rings" (J.R.R. Tolkien) */
(12, 12, 11), /* "The Da Vinci Code" (Dan Brown) */
(13, 13, 12), /* "The Hunger Games" (Suzanne Collins) */
(14, 14, 4), /* "Love in the Time of Cholera" (Gabriel García Márquez) */
(15, 15, 13); /* "Anna Karenina" (Leo Tolstoy) */

/*-- Author Table*/
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    bio TEXT
);

-- Insert Authors With Detailed Information
INSERT INTO Author (author_id, first_name, last_name, date_of_birth, bio) VALUES
(1, 'Harper', 'Lee', '1926-04-28', 'Nelle Harper Lee was an American novelist best known for her 1960 novel To Kill a Mockingbird. It won the 1961 Pulitzer Prize and has become a classic of modern American literature.'),
(2, 'George', 'Orwell', '1903-06-25', 'Eric Arthur Blair, better known by his pen name George Orwell, was an English novelist, essayist, journalist, and critic. His work is marked by lucid prose, social criticism, opposition to totalitarianism, and support of democratic socialism.'),
(3, 'F. Scott', 'Fitzgerald', '1896-09-24', 'Francis Scott Key Fitzgerald was an American fiction writer, whose works illustrate the Jazz Age. He is widely regarded as one of the greatest American writers of the 20th century.'),
(4, 'Gabriel', 'García Márquez', '1927-03-06', 'Gabriel José de la Concordia García Márquez was a Colombian novelist, short-story writer, screenwriter, and journalist, known affectionately as Gabo throughout Latin America. Considered one of the most significant authors of the 20th century, he was awarded the 1982 Nobel Prize in Literature.'),
(5, 'Paulo', 'Coelho', '1947-08-24', 'Paulo Coelho de Souza is a Brazilian lyricist and novelist. He has become one of the most widely read authors in the world today. The Alchemist, his most famous novel, has been translated into 80 languages.'),
(6, 'Jane', 'Austen', '1775-12-16', 'Jane Austen was an English novelist known primarily for her six major novels, which interpret, critique and comment upon the British landed gentry at the end of the 18th century.'),
(7, 'J.R.R.', 'Tolkien', '1892-01-03', 'John Ronald Reuel Tolkien was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings.'),
(8, 'Fyodor', 'Dostoevsky', '1821-11-11', 'Fyodor Mikhailovich Dostoevsky was a Russian novelist, short story writer, essayist, journalist and philosopher. His works explore human psychology in the troubled political, social, and spiritual atmospheres of 19th-century Russia.'),
(9, 'J.D.', 'Salinger', '1919-01-01', 'Jerome David Salinger was an American writer best known for his 1951 novel The Catcher in the Rye. Salinger published several short stories in Story magazine before serving in World War II.'),
(10, 'J.K.', 'Rowling', '1965-07-31', 'Joanne Rowling, better known by her pen name J.K. Rowling, is a British author, philanthropist, film producer, television producer, and screenwriter. She is best known for writing the Harry Potter fantasy series.'),
(7, 'J.R.R.', 'Tolkien', '1892-01-03', 'John Ronald Reuel Tolkien was an English writer, poet, philologist, and academic, best known as the author of the high fantasy works The Hobbit and The Lord of the Rings.'),
(11, 'Dan', 'Brown', '1964-06-22', 'Daniel Gerhard Brown is an American author best known for his thriller novels, including the Robert Langdon novels Angels & Demons, The Da Vinci Code, and Inferno.'),
(12,'Suzanne', 'Collins', '1962-08-10', 'Suzanne Collins is an American television writer and author, best known as the author of The Hunger Games trilogy.'),
(4, 'Gabriel', 'García Márquez', '1927-03-06', 'Gabriel José de la Concordia García Márquez was a Colombian novelist, short-story writer, screenwriter, and journalist, known affectionately as Gabo throughout Latin America. Considered one of the most significant authors of the 20th century, he was awarded the 1982 Nobel Prize in Literature.')
(13, 'Leo', 'Tolstoy', '1828-09-09', 'Count Lev Nikolayevich Tolstoy, usually referred to in English as Leo Tolstoy, was a Russian writer who is regarded as one of the greatest authors of all time. He received multiple nominations for the Nobel Prize in Literature every year from 1902 to 1906.');

/* Details of book authors for all 15 books */
-- This structure allows for complex queries like:
-- 1. Finding all books by a particular author
-- 2. Finding all authors of a specific book
-- 3. Searching for books by nationality 
-- 4. Sorting authors by birth year

/*-- Customer Table*/
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/* -- Insert 15 Sample Customers */
INSERT INTO Customer (customer_id, first_name, last_name, email, phone_number, created_at) VALUES
(1, 'Rita', 'Kellory', 'kellsrita@gmail.com', '+1 (212) 555-0198', '2018-05-28', '12:09'),
(2, 'Logan', 'Emmett', 'loganemmett.lei@gmail.com', '+44 20 7946 0958', '2017-08-08' '16:43'),
(3, 'Esther', 'Henry', 'henrycious@yahoo,com', '+233 24 555 1234', '2019-02-16', '13:23'),
(4, 'Theresa', 'Brian', 'tbrian222@gmail.com', '+61 2 5550 4321', '2018-04-22', '11:28'),
(5, 'Susan', 'Storm', 'stormsusan@yahoo.com', '+65 6221 5555', '2017-12-02', '15:41',),
(6, 'Raphael', 'Meyer', 'raphmeyerr@gmail.com', '+49 30 55567890', '2016-03-21', '17:50'),
(7, 'Paul', 'Steven', 'stevepaul@yahoo.com', '44 161 555 0163', '2019-09-27', '11:00'),
(8, 'Brody', 'Taylor', 'taybrody@gmail.com', '+61 3 9555 6789', '2017-10-02', '14:21'),
(9, 'Frank', 'Thompson', 'thompsonf@gmail.com', '+1 (310) 555-0264', '2016-08-31', '16:34'),
(10, 'Virginia', 'Darcy', 'darcyv.rivermile@gmail.com', '+49 89 55543210', '2019-06-22', '14:33'),
(11 'Aretha' 'Morris', 'aretham099@gmail.com', '+65 9123 4567', '2018-09-08', '17:21'),
(12, 'William', 'Asare', 'williamasare@gmail.com', '233 30 222 5678', '2017-03-16', '14:09'),
(13, 'Dominic' 'Isaiah', 'isaiahdom91@gmail.com', +'1 (786) 555-0432', '2016-11-15', '12:56'),
(14, 'Katherine', 'Mulman', 'mulmankathy@yahoo.com', '+44 131 555 0128', '2018-07-14', '18:12')
(15, 'Tristan' 'Rhodes', 'rhodestris@yahoo.com', '+61 4 5211 9876', '2018-04-24', '11:56');


/*-- Customer Address Table*/
CREATE TABLE Customer_address (
    customer_address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (address_id) REFERENCES Address(address_id) ON DELETE CASCADE
);

/* -- Insert 15 Customer Address Details */
INSERT INTO Customer_address (customer_address_id, customer_id, address_id) VALUES
('356, Oak Avenue, Los Angeles, CA 90015, USA', 1, 1),
('589, Pine Street, London, SW1A 2AA, UK', 2, 2),
('123, Elm Street, Accra, GA-100-1234, Ghana', 3, 3),
('21, Bondi Beach Road, Sydney, NSW 2026, Australia', 4, 4),
('254, Cedar Road, #08-16, Singapore 238875', 5, 5),
('87, FriedrichstraBe, 10117 Berlin, Germany', 6, 6),
('159, Willow Way, Manchester, M14 4BL, UK', 7, 7),
('73, Cherry Boulevard, Melbourne, NSW 2000, Australia', 8, 8),
('252, Ash Drive, Chicago, IL 60533, USA', 9, 9),
('69, Marienplatz, 80221 Munich, Germany', 10, 10),
('147, Orchard Road, Level 25, Singapore 043867', 11, 11),
('58 High Street, East Legon, Accra, GA-543-6789, Ghana', 12, 12),
('463 Elm Street, Houston, TX 77002, USA', 13, 13),
('89, Victoria Road, Birmingham, B1 1HP, UK', 14, 14),
('152 Independence Avenue, Brisbane, NSW 2004 Australia', 15, 15);


/*-- Address Table*/
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    postal_code VARCHAR(10),
    address_status_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES Country(country_id) ON DELETE CASCADE,
    FOREIGN KEY (address_status_id) REFERENCES Address_status(address_status_id) ON DELETE CASCADE
);

/* Insert Customer Table Address */
INSERT INTO TABLE Address (address_id, street_address, city, state, country_id, postal_code, address_status_id) VALUES
('1, 356 Oak Avenue, Apt 13', 'Los Angeles', 'California', 1, '90015', 1),
('2, 589 Pine Street, Flat 5', 'London', 'Greater London', 2, 'SW1A 2AA', 2),
('3, 123 Elm Street, House 7', 'Accra', 'Greater Accra Region', 3, 'GA-100-1234', 3),
('4, 21 Bondi Beach Road, Unit 8', 'Sydney', 'New South Wales', 4, '2026', 4),
('5, 254 Cedar Road, #08-16', 'Singapore', 'Central Region', 5, '238875', 5),
('6, 87 FriedrichstraBe, Apt. 12B', 'Berlin', 'Berlin', 6, '10117', 6),
('7, 159 Willow Way, Flat A1', 'Manchester', 'Greater Manchester', 2, 'M14 4BL', 7),
('8, 73 Cherry Boulevard, Unit B2', 'Melbourne', 'New South Wales', 4, '2000', 8),
('9, 252 Ash Drive, House C3', 'Chicago', 'Illinois' 1, '60533', 9),
('10, 69 Marienplatz, Apt. D4', 'Munich', 'Bavaria', 6, '80221', 10),
('11, 147 Orchard Road Level25 ', 'Singapore', 'Central Region', 5,'043867', 11),
('12, 58 High Street, East Legon', 'Accra', 'Greater Accra', 3,'GA-543-6789', 12),
('13, 463 Elm Street, House 34', 'Houston', 'Texas', 1, 'TX77002', 13),
('14, 89 Victoria Road, Apt 441', 'Birmingham', 'West Midlands', 2, 'B1 B1HP', 14),
('15, 152 Independence Avenue, House 90', 'Brisbane', 'Queensland', 4, 'NSW2004', 15);

/*-- Country Table*/
CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL UNIQUE
);

/* Insert Customers Country Details */
INSERT INTO Country (country_id, country_name) VALUES
(1, 'United States of America'),
(2, 'United Kingdom'),
(3, 'Ghana'),
(4, 'Australia'),
(5, 'Singapore'),
(6, 'Germany');

/* List of Countries for Customers */
-- 1 = United States of America
-- 2 = United Kingdom
-- 3 = Ghana
-- 4 = Australia
-- 5 = Singapore
-- 6 = Germany

/*-- Address Status Table*/
CREATE TABLE Address_status (
    address_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

/* Insert Address Status of Customers */
INSERT INTO Address_status (address_status_id, status_name) VALUES
(1, 'Active'),
(2, 'Inactive'),
(3, 'Active'),
(4, 'Active'),
(5, 'Active'),
(6, 'Inactive');
(7, 'Active'),
(8, 'Verified'),
(9, 'Active'),
(10, 'Temporary'),
(11, 'Permanent'),
(12, 'Verified'),
(13, 'Temporary'),
(14, 'Active'),
(15, 'Permanent');

/* List of Address Statuses for Customer's Delivery */
-- 1 = Active
-- 2 = Inactive
-- 3 = Verified
-- 4 = Temporary
-- 5 = Permanent

/*-- Cust_order Table*/
CREATE TABLE Cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    shipping_method_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_status_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (shipping_method_id) REFERENCES Shipping_method(shipping_id) ON DELETE CASCADE,
    FOREIGN KEY (order_status_id) REFERENCES Order_status(order_status_id) ON DELETE SET NULL
);

/* Insert 15 Customer Orders */
INSERT INTO Cust_order (order_id, customer_id, shipping_method_id, order_date, total_amount, order_status) VALUES
-- Orders for Rita Kellory (USA, customer_id 1)
(1, 1, 2, '2018-05-28 12:00:32', 150.00, 1),
(3, 1, 1, '2018-09-02 14:22:30', 211.99, 1),

-- Orders for Logan Emmett (UK, customer_id 2)
(2, 2, 3, '2017-08-08 16:43:22', 290.00, 2),

-- Orders for Esther Henry (Ghana, customer_id 3)
(3, 3, 1, '2019-02-16 13:23:00', 233.90, 3),
(2, 3, 1, '2019-08-15 10:30:04', 153.00, 2),
(4, 3, 2, '2019-11-10 12:15:30', 189.00, 1),

-- Orders for Theresa Brian (Australia, customer_id 4)
(4, 4, 2, '2018-04-22 11:28:56', 319.00, 3),
(3, 4, 1, '2018-11-12 10:45:34', 199.99, 3),

-- Orders for Susan Storm (Singapore, customer_id 5)
(5, 5, 3, '2017-12-02 15:14:14', 199.79, 1),
(4, 5, 2, '2018-01-15 14:46:54', 260.00, 1),

-- Orders for Raphael Meyer (Germany, customer_id 6)
(5, 6, 2, '2018-03-21 17:50:30', 390.00, 2),

-- Orders for Paul Steven (UK, customer_id 7)
(3, 7, 2, '2019-09-27 11:00:45', 214.00, 3),
(2, 7, 1, '2019-12-01 10:00:00', 350.90, 1),

-- Orders for Brody Taylor (Australia, customer_id 8)
(3, 8, 3, '2017-10-02 14:21:12', 150.35, 1),
(2, 8, 1, '2018-02-20 12:00:08', 300.80, 1),
(1, 8, 1, '2018-05-15 10:30:30', 169.00, 1),

-- Orders for Frank Thompson (USA, customer_id 9)
(6, 9, 2, '2016-08-31 16:34:00', 250.00, 1),

-- Orders for Virginia Darcy (Germany, customer_id 10)
(4, 10, 3, '2019-06-22 14:33:00', 300.00, 1),
(2, 10, 2, '2019-07-15 12:00:00', 400.00, 4),

-- Orders for Aretha Morris (Singapore, customer_id 11)
(7, 11, 1, '2018-09-08 17:21:03', 381.99, 3),
(2, 11, 2, '2018-10-09 10:50:00', 170.00, 1),
(3, 11, 3, '2018-10-20 12:00:00', 200.00, 1),
(3, 11, 2, '2019-02-09 12:00:00', 250.00, 1),

-- Orders for William Asare (Ghana, customer_id 12)
(6, 12, 1, '2017-03-16 14:09:40', 309.00, 1),

-- Orders for Dominic Isaiah (USA, customer_id 13)
(3, 13, 2, '2016-11-15 12:56:23', 120.00, 3),
(6, 13, 1, '2017-03-04 17:50:47', 330.89, 4),
(2, 13, 2, '2017-05-20 10:46:00', 150.00, 1),

-- Orders for Katherine Mulman (UK, customer_id 14)
(8, 14, 3, '2018-07-14 18:12:51', 410.88, 1),
(4, 14, 3, '2018-10-20 12:00:00', 250.00, 1),
(3, 14, 2, '2019-02-10 10:30:00', 300.00, 1),

-- Orders for Tristan Rhodes (Australia, customer_id 15)
(2, 15, 2, '2018-04-24 11:56:43', 265.00, 3),
(3, 15, 2, '2018-08-20 14:30:00', 200.00, 1);

/* Shipping Methods */
-- 1 = Standard Shipping
-- 2 = Express Shipping
-- 3 = Overnight Shipping

/* Order Statuses */
-- 1 = Delivered
-- 2 = On Hold
-- 3 = Shipped
-- 4 = Completed

/*-- Order Status Table*/
CREATE TABLE Order_status (
    order_status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE
);

/* Insert Order Status Details */
INSERT INTO Order_status (order_status_id, status_name) VALUES
(1, 'Delivered'),
(2, 'On Hold'),
(3, 'Shipped'),
(4, 'Delivered'),
(5, 'Delivered'),
(6, 'On Hold'),
(7, 'Shipped'),
(8, 'Completed'),
(9, 'Shipped'),
(10, 'Shipped'),
(11, 'Delivered'),
(12, 'Shipped'),
(13, 'Shipped'),
(14, 'Delivered'),
(15, 'Completed');

/* Order Delivery Status */
-- 1 = Delivered
-- 2 = On Hold
-- 3 = Shipped
-- 4 = Completed

/*-- Order History Table*/
CREATE TABLE Order_history (
    order_history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    order_status_id INT NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Cust_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (order_status_id) REFERENCES Order_status(order_status_id) ON DELETE CASCADE
);

/* Insert Order History Details */
INSERT INTO Order_history (order_history_id, order_id, order_status_id, changed at) VALUES
-- Order 1 (Rita Kellory) - Delivered after Processing
(2, 1, 1, '2018-05-28 12:00:32'), -- Pending
(2, 1, 2, '2018-05-28 14:39:22'), -- Processing
(2, 1, 3, '2018-06-01 07:19:20'), -- Shipped
(2, 1, 4, '2018-06-02 19:00:30'), -- Delivered

-- Order 1 (Rita Kellory) - Delivered after Processing
(2, 2, 1, '2018-09-02 14:22:30'), -- Pending
(2, 2, 2, '2018-09-02 15:00:00'), -- Processing
(2, 2, 3, '2018-09-04 01:30:23'), -- Shipped 
(2, 2, 4, '2018-09-05 15:50:24'),-- Delivered

-- Order 2 (Logan Emmett) - On Hold after Processing
(1, 2, 1, '2017-08-08 16:43:22'), -- Actively Pending

-- Order 3 (Esther Henry) - Shipped
(3, 3, 1, '2019-02-16 13:23:00'), -- Pending
(3, 3, 2, '2019-02-16 17:34:20'), -- Processing
(3, 3, 3, '2019-02-18 08:11:30'), -- Shipped to the local Warehouse

-- Order 3 (Esther Henry) - Shipped
(3, 3, 1, '2019-08-15 10:30:04'), -- Pending
(3, 3, 2, '2019-08-15 16:30:34'), -- Processing
(3, 3, 3, '2019-08-18 13:50:02'), -- Shipped to the local Warehouse

-- Order 3 (Esther Henry) - Shipped
(3, 3, 1, '2019-11-10 12:15:30'), -- Pending
(3, 3, 2, '2019-11-11 10:05:00'), -- Processing
(3, 3, 3, '2019-11-14 12:15:30'), -- Shipped to the local Warehouse

-- Order 4 (Theresa Brian) - Delivered
(2, 4, 1, '2018-04-22 11:28:56'), -- Pending
(2, 4, 2, '2018-04-22 18:08:16'), -- Processing
(2, 4, 3, '2018-04-23 19:58:00'), -- Shipped
(2, 4, 4, '2018-04-25 15:10:02'), -- Delivered

-- Order 4 (Theresa Brian) - Delivered
(2, 4, 1, '2018-11-12 10:45:34'), -- Pending
(2, 4, 2, '2018-11-12 16:00:00'), -- Processing
(2, 4, 3, '2018-11-14 10:30:00'), -- Shipped
(2, 4, 2, '2018-11-14 13:00:50'), -- Delivered

-- Order 5 (Susan Storm) - Delivered
(2, 5, 1, '2017-12-02 15:14:14'), -- Pending
(2, 5, 2, '2017-12-03 10:24:14'), -- Processing
(2, 5, 3, '2017-12-05 11:59:20'), -- Shipped
(2, 5, 4, '2017-12-05 21:04:00'), -- Delivered

-- Order 5 (Susan Storm) - Delivered
(2, 5, 1, '2018-01-15 14:46:54'), -- Pending
(2, 5, 2, '2018-01-15 19:00:34'), -- Processing
(2, 5, 3, '2018-01-18 05:06:09'), -- Shipped
(2, 5, 4, '2018-01-19 12:56:50'), -- Delivered

-- Order 6 (Raphael Meyer) - On Hold after Processing
(1, 6, 1, '2018-03-21 17:50:30'), -- Pending on and off

-- Order 7 (Paul Steven) - Shipped
(2, 7, 1, '2019-09-27 11:00:45'), -- Pending
(2, 7, 2, '2019-09-27 17:30:05'), -- Processing
(2, 7, 3, '2019-09-29 20:00:03'), -- Shipped

-- Order 7 (Paul Steven) - Delivered
(2, 7, 1, '2019-12-01 10:00:00'), -- Pending
(2, 7, 1, '2019-12-01 18:10:44'), -- Processing
(2, 7, 1, '2019-12-03 12:40:10'), -- Shipped
(2, 7, 1, '2019-12-04 15:16:45'), -- Delivered

-- Order 8 (Brody Taylor) - Completed
(3, 8, 1, '2017-10-02 14:21:12'), -- Pending
(3, 8, 2, '2017-10-03 10:02:45'), -- Processing
(3, 8, 4, '2017-10-04 15:41:22'), -- Delivered

-- Order 8 (Brody Taylor) - Completed
(3, 8, 1, '2018-02-20 12:00:08'), -- Pending
(3, 8, 2, '2018-02-21 10:08:02'), -- Processing
(3, 8, 4, '2018-02-23 14:20:58'), -- Delivered

-- Order 8 (Brody Taylor) - Delivered
(3, 8, 1, '2018-05-15 10:30:30'), -- Pending
(3, 8, 2, '2018-05-15 16:48:39'), -- Processing
(3, 8, 3, '2018-05-17 10:20:10'), -- Shipped
(3, 8, 4, '2018-05-18 09:11:35'), -- Delivered

-- Order 9 (Frank Thompson) - Shipped
(1, 9, 1, '2016-08-31 16:34:00'), -- Pending
(1, 9, 2, '2016-09-01 10:28:21'), -- Processing
(1, 9, 3, '2016-09-03 13:56:34'), -- Shipped to local Warehouse

-- Order 10 (Virginia Darcy) - Shipped
(2, 10, 1, '2019-06-22 14:33:00'), -- Pending
(2, 10, 2, '2019-06-23 11:53:20'), -- Processing
(2, 10, 3, '2019-06-26 18:54:50'), -- Shipped to local Warehouse

-- Order 10 (Virginia Darcy) - Shipped
(2, 10, 1, '2019-07-15 12:00:00'), -- Pending
(2, 10, 2, '2019-07-15 19:03:30'), -- Processing 
(2, 10, 3, '2019-07-18 07:40:20'), -- Shipped to local Warehouse

-- Order 11 (Aretha Morris) - Delivered
(4, 11, 1, '2018-09-08 17:21:03'), -- Pending
(4, 11, 2, '2018-09-09 11:22:09'), -- Processing
(4, 11, 3, '2018-09-11 13:33:53'), -- Shipped
(4, 11, 4, '2018-09-11 21:30:43'), -- Delivered

-- Order 11 (Aretha Morris) - Delivered
(4, 11, 1, '2018-10-09 10:50:00'), -- Pending
(4, 11, 2, '2018-10-09 18:22:32'), -- Processing
(4, 11, 3, '2018-10-11 12:40:40'), -- Shipped
(4, 11, 4, '2018-10-12 20:55:10'), -- Delivered

-- Order 11 (Aretha Morris) - Shipped
(4, 11, 1, '2018-10-20 12:00:00'), -- Pending
(4, 11, 2, '2018-10-20 18:00:50'), -- Processing
(4, 11, 3, '2018-10-22 14:24:42'), -- Shipped
(4, 11, 4, '2018-10-23 15:20:08'), -- Delivered

-- Order 11 (Aretha Morris) - Delivered
(4, 11, 1, '2019-02-09 12:00:00'), -- Pending 
(4, 11, 2, '2019-02-09 17:50:41'), -- Processing
(4, 11, 3, '2019-02-12 03:00:53'), -- Shipped 
(4, 11, 4, '2019-02-12 12:34:21'), -- Delivered

-- Order 12 (William Asare) - Shipped
(1, 12, 1, '2017-03-16 14:09:40'), -- Pending
(1, 12, 2, '2017-03-17 10:05:34'), -- Processing
(1, 12, 3, '2017-03-19 21:39:21'), -- Shipped to local Warehouse

-- Order 13 (Dominic Isaiah) - Shipped
(3, 13, 1, '2016-11-15 12:56:23'), -- Pending
(3, 13, 2, '2016-11-15 18:56:44'), -- Processing
(3, 13, 3, '2016-11-17 15:16:53'), -- Shipped to local Warehouse

-- Order 13 (Dominic Isaiah) - Shipped
(3, 13, 1, '2017-03-04 17:50:47'), -- Pending
(3, 13, 2, '2017-03-05 11:10:57'), -- Processing
(3, 13, 3, '2017-03-07 15:21:37'), -- Shipped to local Warehouse

-- Order 13 (Dominic Isaiah) - Shipped
(3, 13, 1, '2017-05-20 10:46:00'), -- Pending
(3, 13, 2, '2017-05-20 16:55:30'), -- Processing
(3, 13, 3, '2017-05-22 19:36:10'), -- Shipped to local Warehouse

-- Order 14 (Katherine Mulman) - Delivered
(3, 14, 1, '2018-07-14 18:12:51'), -- Pending
(3, 14, 2, '2018-07-15 11:33:01'), -- Processing
(3, 14, 3, '2018-07-17 12:19:31'), -- Shipped 
(3, 14, 4, '2018-07-18 10:02:01'), -- Delivered

-- Order 14 (Katherine Mulman) - Delivered
(3, 14, 1, '2018-10-20 12:00:00'), -- Pending
(3, 14, 2, '2018-10-20 19:09:40'), -- Processing
(3, 14, 3, '2018-10-23 06:50:20'), -- Shipped
(3, 14, 4, '2018-10-23 13:10:30'), -- Delivered

-- Order 14 (Katherine Mulman) - Delivered
(3, 14, 1, '2019-02-10 10:30:00'), -- Pending
(3, 14, 2, '2019-02-10 17:39:07'), -- Processing
(3, 14, 3, '2019-02-12 16:36:59'), -- Shipped
(3, 14, 4, '2019-02-13 09:08:40'), -- Delivered

-- Order 15 (Tristan Rhodes) - Completed
(2, 15, 1, '2018-04-24 11:56:43'), -- Pending
(2, 15, 2, '2018-04-24 16:10:50'), -- Processing
(2, 15, 4, '2018-04-26 17:30:22'), -- Delivered

-- Order 15 (Tristan Rhodes) - Completed
(2, 15, 1, '2018-08-20 14:30:00'), -- Pending
(2, 15, 2, '2018-08-20 19:34:21'), -- Processing
(2, 15, 3, '2018-08-23 11:54:31'); -- Delivered


/* Order Statuses Id Details */
-- 1 = Pending
-- 2 = Processing
-- 3 = Shipped
-- 4 = Delivered

/* Realistic Status Change Timelines */
-- Pending - Processing: Typically the same day or a few hours
-- Processing - Shipped: 2-3 bsusiness days
-- Shipped - Delivered: Based on the customer's location and shipping method, 
-- this can vary from 1-7 business days.

/*-- Order Line Table*/
CREATE TABLE Order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    line_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Cust_order(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id) ON DELETE CASCADE
);

/* Insert Order Line Details */
INSERT INTO Order_line (order_line_id, order_id, book_id, quantity, line_total) VALUES
-- Orders for Rita Kellory (USA, customer_id 1)
(1, 1, 102, 1, 150.00), /* "1984" (George Orwell) */ 
(1, 2, 105, 2, 211.99), /* "To Kill a Mockingbird" (Harper Lee) */

-- Orders for Logan Emmett (UK, customer_id 2)
(2, 1, 220, 3, 290.00), /* "The Great Gatsby" (F. Scott Fitzgerald) */

-- Orders for Esther Henry (Ghana, customer_id 3)
(3, 1, 117, 3, 233.90),  /* "One Hundred Years of Solitude" (Gabriel García Márquez) */ 
(3, 2, 108, 2, 153.00), /* "The Alchemist" (Paulo Coelho) */ 
(3, 3, 202, 2, 189.00), /* "Pride and Prejudice" (Jane Austen) */

-- Orders for Theresa Brian (Australia, customer_id 4)
(4, 1, 129, 4, 319.00), /* "The Catcher in the Rye" (J.D. Salinger) */
(4, 2, 174, 2, 199.99), /* "The Da Vinci Code" (Dan Brown) */

-- Orders for Susan Storm (Singapore, customer_id 5)
(5, 1, 309, 3, 199.79, ), /* "Crime and Punishment" (Fyodor Dostoevsky) */ 
(5, 2, 215, 2, 260.00, ), /* "The Hobbit" (J.R.R. Tolkien) */ 

-- Orders for Raphael Meyer (Germany, customer_id 6)
(6, 1, 214, 5, 390.00), /* "Harry Potter and the Sorcerer's Stone" (J.K. Rowling) */

-- Orders for Paul Steven (UK, customer_id 7)
(7, 1, 285, 3, 214.00), /* "The Hunger Games" (Suzanne Collins) */ 
(7, 2, 128, 2, 350.90), /* "Love in the Time of Cholera" (Gabriel García Márquez) */ 

-- Orders for Brody Taylor (Australia, customer_id 8)
(8, 1, 300, 1, 150.35), /* "The Lord of the Rings" (J.R.R. Tolkien) */ 
(8, 2, 174, 3, 300.80), /* "The Da Vinci Code" (Dan Brown) */
(8, 3, 322, 2, 169.00), /* "Anna Karenina" (Leo Tolstoy) */

-- Orders for Frank Thompson (USA, customer_id 9)
(9, 1, 102, 2, 250.00), /* "1984" (George Orwell) */

-- Orders for Virginia Darcy (Germany, customer_id 10)
(10, 1, 220, 3, 300.00), /* "The Great Gatsby" (F. Scott Fitzgerald) */
(10, 2, 202, 4, 400.00), /* "Pride and Prejudice" (Jane Austen) */

-- Orders for Aretha Morris (Singapore, customer_id 11)
(11, 1, 128, 3, 381.99),/* "Love in the Time of Cholera" (Gabriel García Márquez) */
(11, 2, 214, 2, 170.00), /* "Harry Potter and the Sorcerer's Stone" (J.K. Rowling) */
(11, 3, 108, 2, 200.00), /* "The Alchemist" (Paulo Coelho) */
(11, 4, 220, 2, 250.00), /* "The Great Gatsby" (F. Scott Fitzgerald) */

-- Orders for William Asare (Ghana, customer_id 12)
(12, 1, 129, 4, 309.00), /* "The Catcher in the Rye" (J.D. Salinger) */

-- Orders for Dominic Isaiah (USA, customer_id 13)
(13, 1, 202, 1 120.00), /* "Pride and Prejudice" (Jane Austen) */
(13, 2, 102, 2, 330.89), /* "1984" (George Orwell) */
(13, 3, 214, 1 150.00), /* "Harry Potter and the Sorcerer's Stone" (J.K. Rowling) */

-- Orders for Katherine Mulman (UK, customer_id 14)
(14, 1, 300, 3, 410.88), /* "The Lord of the Rings" (J.R.R. Tolkien) */
(14, 2, 174 2, 250.00), /* "The Da Vinci Code" (Dan Brown) */
(14, 3, 220, 3, 300.00), /* "The Great Gatsby" (F. Scott Fitzgerald) */

-- Orders for Tristan Rhodes (Australia, customer_id 15)
(2, 15, 322, 3, 265.00), /* "Anna Karenina" (Leo Tolstoy) */ 
(3, 15, 215, 1, 200.00); /* "The Hobbit" (J.R.R. Tolkien) */ 

/* Price Ranges */
-- Regular paperbacks: 15.99 - 39.99
-- Hardcovers/special editions: 69.99 - 200
-- Collectors items/box sets: 100 - 300


/*-- Shipping Method Table*/
CREATE TABLE Shipping_method (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    cost DECIMAL(10, 2) NOT NULL
);

/* Insert Shipping Id Details */
INSERT INTO Shipping_method (shipping_id, method_name, cost)VALUES
(1, 'Standard Shipping', 20.00),
(2, 'Express Shipping', 23.00),
(3, 'Overnight Shipping', 15.00);

CREATE TABLE Logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(255) NOT NULL,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE SET NULL
);

/* Insert Table Logs Details */
INSERT INTO Logs (log_id, user_id, action, action_time) VALUES
-- Customer account activities
(1, 'Customer registered', '2018-05-28 11:42:10'),
(2, 'Customer registered', '2017-08-08 16:25:33'),
(3, 'Customer registered', '2019-02-16 10:30:21'),
(4, 'Customer registered', '2018-04-22 11:15:47'),
(5, 'Customer registered', '2017-11-25 13:40:12'),
(6, 'Customer registered', '2018-03-20 10:20:55'),
(7, 'Customer registered', '2019-08-19 15:35:40'),
(8, 'Customer registered', '2017-10-01 12:10:25'),
(9, 'Customer registered', '2016-08-18 17:45:30'),
(10, 'Customer registered', '2019-02-12 08:30:15'),
(11, 'Customer registered', '2018-08-15 14:55:42'),
(12, 'Customer registered', '2017-03-11 11:25:33'),
(13, 'Customer registered', '2016-11-10 09:40:18'),
(14, 'Customer registered', '2018-06-22 16:15:27'),
(15, 'Customer registered', '2018-03-04 10:50:39'),

-- Login activities
(1, 'User logged in', '2018-07-14 09:15:22'),
(1, 'User logged in', '2018-11-21 14:05:33'),
(2, 'User logged in', '2017-09-09 11:30:45'),
(3, 'User logged in', '2019-05-04 13:25:30'),
(3, 'User logged in', '2019-05-29 10:10:42'),
(4, 'User logged in', '2018-06-17 15:45:55'),
(5, 'User logged in', '2018-02-27 12:30:10'),
(6, 'User logged in', '2018-06-19 10:15:25'),
(7, 'User logged in', '2019-09-14 14:40:38'),
(7, 'User logged in', '2019-10-30 11:05:50'),
(8, 'User logged in', '2017-12-09 09:30:15'),
(9, 'User logged in', '2016-11-24 13:15:22'),
(10, 'User logged in', '2019-04-11 16:20:35'),
(11, 'User logged in', '2018-11-07 10:35:48'),
(12, 'User logged in', '2017-04-04 14:25:12'),
(13, 'User logged in', '2016-12-14 12:10:27'),
(14, 'User logged in', '2018-09-07 15:40:33'),
(15, 'User logged in', '2018-05-09 10:00:45'),

-- Order-related activities
(1, 'User logged in', '2018-05-28 12:00:32'),
(1, 'User-logged in', '2018-09-02 14:22:30'),
(2, 'User logged in', '2017-08-08 16:43:22'),
(3, 'User logged in', '2019-02-16 13:23:00'),
(3, 'User-logged in', '2019-08-15 10:30:04'),
(3, 'User-logged in', '2019-11-10 12:15:30'),
(4, 'User-logged in', '2018-04-22 11:28:56'),
(4, 'User-logged in', '2018-11-12 10:45:34'),
(5, 'User-logged-in', '2017-12-02 15:14:14'),
(5, 'User-logged-in', '2018-01-15 14:46:54'),
(6, 'User-logged-in', '2018-03-21 17:50:30'),
(7, 'User-logged-in', '2019-09-27 11:00:45'),
(7, 'User-logged-in', '2019-12-01 10:00:00'),
(8, 'User-logged-in', '2017-10-02 14:21:12'),
(8, 'User-logged-in', '2018-02-20 12:00:08'),
(8, 'User-logged-in', '2018-05-15 10:30:30'),
(9, 'User logged in', '2016-08-31 16:34:00'),
(10, 'User logged in', '2019-06-22 14:33:00'),
(10, 'User logged in', '2019-07-15 12:00:00'),
(11, 'User logged in', '2018-09-08 17:21:03'),
(11, 'User logged in', '2018-10-09 10:50:00'),
(11, 'User logged in', '2018-10-20 12:00:00'),
(11, 'User logged in', '2019-02-09 12:00:00'),
(12, 'User logged in', '2017-03-16 14:09:40'),
(13, 'User logged in', '2016-11-15 12:56:23'),
(13, 'User logged in', '2017-03-04 17:50:47'),
(13, 'User logged in', '2017-05-20 10:46:00'),
(14, 'User logged in', '2018-07-14 18:12:51'),
(14, 'User logged in', '2018-10-20 12:00:00'),
(14, 'User logged in', '2019-02-10 10:30:00'),
(15, 'User logged in', '2018-04-24 11:56:43'),
(15, 'User logged in', '2018-08-20 14:30:00'),

-- Account update activities
(1, 'Address updated', '2018-06-05 11:20:33'),
(3, 'Payment method added', '2019-02-01 14:45:12'),
(4, 'Password changed', '2018-03-25 09:30:45'),
(5, 'Email updated', '2018-03-01 16:20:18'),
(7, 'Notification preferences updated', '2019-10-01 10:15:27'),
(9, 'Wishlist updated', '2016-07-20 13:40:55'),
(11, 'Shipping preference updated', '2018-08-05 08:25:39'),
(13, 'Account details updated', '2016-12-10 11:35:42'),
(15, 'Two-factor authentication enabled', '2018-08-08 09:50:15'),

-- Customer service interactions
(1, 'Contacted customer support', '2018-05-25 15:10:22'),
(2, 'Return request submitted', '2017-08-10 11:45:33'),
(6, 'Product question submitted', '2018-03-18 14:20:45'),
(8, 'Order cancellation request', '2017-11-12 10:35:18'),
(10, 'Feedback submitted', '2019-07-20 16:50:27'),
(12, 'Complaint submitted', '2017-03-122 09:15:39'),
(14, 'Product review submitted', '2018-05-15 13:25:12');

/* Key Features of this Log Database Schema: */
-- 1. User Activity Tracking: The Logs table captures various user activities, 
-- including account creation, login, order-related actions, and customer service interactions.
-- 2. Action Timestamps: Each log entry includes a timestamp to track when the action occurred,
-- allowing for chronological analysis of user behavior.
-- 3. Foreign Key Relationships: The Logs table references the Users table to associate actions with 
-- specific users, ensuring data integrity and enabling easy retrieval of user-related logs.
-- 4. Action Descriptions: The action column provides a clear description of the user activity,
-- making it easy to understand the context of each log entry.
-- 5. User registrations for all 15 customers, Login sessions showing customer activity patterns.
-- 6. Redistration dates precede order dates, ensuring that all orders are associated with registered users.
-- 7. Login occur before order plcements, account updates scattered throughout customer lifecycle.
-- 8. Customer service interactions are logged to track user engagement and support requests.
-- 9. Timestamps reflect local time zones for each customer, activity frequency matches cultural shopping patterns.
-- 10. The schema is designed to be scalable, allowing for the addition of new users and activities as needed.
-- 11. The schema can be easily extended to include additional user activities or features in the future.

