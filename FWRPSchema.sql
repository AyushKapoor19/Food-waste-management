
-- create schema name fwrp
CREATE DATABASE IF NOT EXISTS fwrp;
use fwrp;

-- Table for User
CREATE TABLE Users (
    UserId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    usertype ENUM('retailer', 'consumer', 'Charitable_Organization') NOT NULL
);

-- Table for Inventory
CREATE TABLE Inventory (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
    ExpirationDate DATE,
    RetailerPrice DOUBLE,
    IsDonation BOOLEAN,
    IsSale BOOLEAN,
	DiscountPrice DOUBLE
);

-- Table for Claims
CREATE TABLE Claims (
    ClaimID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT,
    ClaimDate DATE,
    QuantityClaimed INT,
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);

-- Table for Purchases
CREATE TABLE Purchases (
    PurchaseID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT,
    PurchaseDate DATE,
    QuantityClaimed INT,
    FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID)
);

CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    itemID int not null,
    feedback_text TEXT NOT NULL,
    
    feedback_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rating INT CHECK (rating <= 5),
FOREIGN KEY (ItemID) REFERENCES Inventory(ItemID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Table for Subscriptions
CREATE TABLE Subscriptions (
    SubscriptionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT ,
     email VARCHAR(100) UNIQUE,
    CommunicationMethod ENUM('email', 'phone') NOT NULL,
 Location VARCHAR(255),
    FoodPreferences VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

    