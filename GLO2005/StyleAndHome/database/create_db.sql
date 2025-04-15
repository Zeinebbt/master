DROP DATABASE IF EXISTS StyleAndHome;
CREATE DATABASE IF NOT EXISTS StyleAndHome CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE StyleAndHome;

-- Suppression des tables
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Buys;
DROP TABLE IF EXISTS HomeProducts;
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Wallets;
DROP TABLE IF EXISTS Users;

-- Table Users
CREATE TABLE Users (
    User_Id INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    Birthdate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table Wallets
CREATE TABLE Wallets (
    Wallet_Id INT PRIMARY KEY AUTO_INCREMENT,
    Solde DECIMAL(10, 2) DEFAULT 0.00,
    User_Id INT UNIQUE NOT NULL,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE
);

-- Table Addresses
CREATE TABLE Addresses (
    Address_Id INT PRIMARY KEY AUTO_INCREMENT,
    Zip VARCHAR(10),
    Province VARCHAR(50),
    Country VARCHAR(50),
    StreetNameAndNumber VARCHAR(100),
    User_Id INT NOT NULL,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE CASCADE
);

-- Table HomeProducts
CREATE TABLE HomeProducts (
    HomeProduct_Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    Brand VARCHAR(50),
    Category VARCHAR(50),
    ImgURL TEXT,
    Quantity INT DEFAULT 1, -- Gestion du stock
    Seller_Id INT NOT NULL,
    FOREIGN KEY (Seller_Id) REFERENCES Users(User_Id) ON DELETE CASCADE
);

-- Table Reviews
CREATE TABLE Reviews (
    Review_Id INT AUTO_INCREMENT PRIMARY KEY,
    Comment TEXT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Author_Id INT,
    HomeProduct_Id INT,
    UNIQUE (Author_Id, HomeProduct_Id), -- Contrainte d'unicité
    FOREIGN KEY (Author_Id) REFERENCES Users(User_Id) ON DELETE SET NULL,
    FOREIGN KEY (HomeProduct_Id) REFERENCES HomeProducts(HomeProduct_Id) ON DELETE CASCADE
);

-- Table Buys
CREATE TABLE Buys (
    Buys_Id INT PRIMARY KEY AUTO_INCREMENT,
    User_Id INT,
    HomeProduct_Id INT,
    PurchaseDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Taxed_Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (User_Id) REFERENCES Users(User_Id) ON DELETE SET NULL,
    FOREIGN KEY (HomeProduct_Id) REFERENCES HomeProducts(HomeProduct_Id) ON DELETE SET NULL
);


INSERT INTO HomeProducts (
    Name,
    Description,
    Price,
    Brand,
    Category,
    ImgURL,
    Quantity,
    Seller_Id
) VALUES (
    'Canapé 3 places en tissu gris',
    'Confort et design scandinave réunis dans un canapé 3 places moderne.',
    549.99,
    'IKEA',
    'Salon',
    'https://example.com/images/canape.jpg',
    12,
    1
);

