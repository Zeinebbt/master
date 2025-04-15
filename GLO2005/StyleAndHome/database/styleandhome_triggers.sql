USE StyleAndHome;

-- Supprimer les triggers existants pour éviter les conflits
DROP TRIGGER IF EXISTS after_user_insert;
DROP TRIGGER IF EXISTS after_buy_credit_seller;
DROP TRIGGER IF EXISTS after_buy_deduct_buyer;
DROP TRIGGER IF EXISTS calculate_taxed_price;

DELIMITER //

-- Trigger : Auto-create Wallet + Address après création d'un User
CREATE TRIGGER after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Wallets (User_Id, Solde)
    VALUES (NEW.User_Id, 0.00);
END;
//

-- Trigger : Créditer le Wallet du vendeur après un achat
CREATE TRIGGER after_buy_credit_seller
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE seller_id INT;

    SELECT Seller_Id INTO seller_id
    FROM HomeProducts
    WHERE HomeProduct_Id = NEW.HomeProduct_Id
    LIMIT 1;

    UPDATE Wallets
    SET Solde = Solde + NEW.Taxed_Price
    WHERE User_Id = seller_id;
END;
//

-- Trigger : Débiter le Wallet de l'acheteur après un achat
CREATE TRIGGER after_buy_deduct_buyer
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    UPDATE Wallets
    SET Solde = Solde - NEW.Taxed_Price
    WHERE User_Id = NEW.User_Id;
END;
//

-- Trigger : Calcul automatique du Taxed_Price avant insertion dans Buys
CREATE TRIGGER calculate_taxed_price
BEFORE INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE product_price DECIMAL(10,2);

    -- Récupérer le Price du produit acheté
    SELECT Price INTO product_price
    FROM HomeProducts
    WHERE HomeProduct_Id = NEW.HomeProduct_Id
    LIMIT 1;

    -- Calcul du Taxed_Price avec une taxe de 15%
    SET NEW.Taxed_Price = product_price * 1.15;
END;
//

DELIMITER ;
-- Trigger: Decrease stock after buying
DROP TRIGGER IF EXISTS after_buy_decrease_stock;
DELIMITER //
CREATE TRIGGER after_buy_decrease_stock
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    UPDATE HomeProduct
    SET Stock = Stock - 1
    WHERE HomeProduct_Id = NEW.HomeProduct_Id;
END;//
DELIMITER ;

-- Trigger: Prevent buying if out of stock
DROP TRIGGER IF EXISTS before_buy_check_stock;
DELIMITER //
CREATE TRIGGER before_buy_check_stock
BEFORE INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;

    SELECT Stock INTO available_stock
    FROM HomeProduct
    WHERE HomeProduct_Id = NEW.HomeProduct_Id;

    IF available_stock <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This product is out of stock.';
    END IF;
END;//
DELIMITER ;

-- Trigger: Delete product when stock reaches 0
DROP TRIGGER IF EXISTS after_update_check_stock_zero;
DELIMITER //
CREATE TRIGGER after_update_check_stock_zero
AFTER UPDATE ON HomeProduct
FOR EACH ROW
BEGIN
    IF NEW.Stock = 0 THEN
        DELETE FROM HomeProduct WHERE HomeProduct_Id = NEW.HomeProduct_Id;
    END IF;
END;//
DELIMITER ;
-- Trigger: Cascade delete related data when a user is deleted
DROP TRIGGER IF EXISTS before_user_delete;
DELIMITER //
CREATE TRIGGER before_user_delete
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    DELETE FROM Wallets WHERE User_Id = OLD.User_Id;
    DELETE FROM Addresses WHERE User_Id = OLD.User_Id;
    DELETE FROM HomeProduct WHERE Seller_Id = OLD.User_Id;
    DELETE FROM Reviews WHERE Author_Id = OLD.User_Id;
END;//
DELIMITER ;

-- Trigger: Prevent duplicate purchases by same user
DROP TRIGGER IF EXISTS prevent_duplicate_buys;
DELIMITER //
CREATE TRIGGER prevent_duplicate_buys
BEFORE INSERT ON Buys
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Buys
        WHERE User_Id = NEW.User_Id AND HomeProduct_Id = NEW.HomeProduct_Id
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You have already purchased this product.';
    END IF;
END;//
DELIMITER ;
