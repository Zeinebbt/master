CREATE DATABASE IF NOT EXISTS StyleAndHome CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE StyleAndHome;

-- Drop tables if they already exist
DROP TABLE IF EXISTS Transactions_HomeProducts;
DROP TABLE IF EXISTS Transactions_Clothing;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS HomeProducts;
DROP TABLE IF EXISTS Clothing;
DROP TABLE IF EXISTS Users;

-- Table Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(100) UNIQUE NOT NULL,
    birthdate DATE,
    balance DECIMAL(10,2) DEFAULT 0.00,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);

-- Table Clothing
CREATE TABLE Clothing (
    clothing_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    brand VARCHAR(50),
    color VARCHAR(30),
    size VARCHAR(10),
    gender ENUM('male', 'female', 'unisex'),
    category VARCHAR(30),
    image_url TEXT,
    seller_id INT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table HomeProducts
CREATE TABLE HomeProducts (
    homeproduct_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    brand VARCHAR(50),
    material VARCHAR(50),
    room VARCHAR(50),
    category VARCHAR(30),
    image_url TEXT,
    seller_id INT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table Transactions
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT NOT NULL,
    seller_id INT NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    status ENUM('paid', 'shipped', 'cancelled') DEFAULT 'paid',
    FOREIGN KEY (buyer_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (seller_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Table associative N:M pour les vêtements
CREATE TABLE Transactions_Clothing (
    transaction_id INT,
    clothing_id INT,
    price_at_purchase DECIMAL(10,2),
    PRIMARY KEY (transaction_id, clothing_id),
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (clothing_id) REFERENCES Clothing(clothing_id) ON DELETE CASCADE
);

-- Table associative N:M pour les produits maison
CREATE TABLE Transactions_HomeProducts (
    transaction_id INT,
    homeproduct_id INT,
    price_at_purchase DECIMAL(10,2),
    PRIMARY KEY (transaction_id, homeproduct_id),
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id) ON DELETE CASCADE,
    FOREIGN KEY (homeproduct_id) REFERENCES HomeProducts(homeproduct_id) ON DELETE CASCADE
);

-- Table des avis
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
    target_clothing_id INT,
    target_homeproduct_id INT,
    target_seller_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (target_clothing_id) REFERENCES Clothing(clothing_id) ON DELETE SET NULL,
    FOREIGN KEY (target_homeproduct_id) REFERENCES HomeProducts(homeproduct_id) ON DELETE SET NULL,
    FOREIGN KEY (target_seller_id) REFERENCES Users(user_id) ON DELETE SET NULL
);
