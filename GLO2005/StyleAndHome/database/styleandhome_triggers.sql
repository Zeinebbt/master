
USE StyleAndHome ;

-- Supprimer tous les triggers existants pour éviter les conflits
DROP TRIGGER IF EXISTS after_user_insert;
DROP TRIGGER IF EXISTS after_buy_credit_seller;
DROP TRIGGER IF EXISTS after_buy_deduct_buyer;
DROP TRIGGER IF EXISTS calculate_taxed_price;
DROP TRIGGER IF EXISTS after_buy_decrease_stock;
DROP TRIGGER IF EXISTS before_buy_check_stock;
DROP TRIGGER IF EXISTS after_update_check_stock_zero;
DROP TRIGGER IF EXISTS before_user_delete;
DROP TRIGGER IF EXISTS prevent_duplicate_buys;
DROP TRIGGER IF EXISTS prevent_review_without_purchase;

DELIMITER //

-- Trigger : Auto-create Wallet après création d'un User
CREATE TRIGGER after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO Wallets (User_Id, Solde)
    VALUES (NEW.User_Id, 0.00);

    INSERT INTO Addresses (User_Id, Zip, Province, Country, StreetNameAndNumber)
    VALUES (NEW.User_Id, '', '', '', '');
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

-- Trigger : Débiter le Wallet de l'acheteur si solde suffisant
CREATE TRIGGER before_buy_check_balance
BEFORE INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE current_solde DECIMAL(10,2);
    DECLARE product_price DECIMAL(10,2);

    SELECT Price INTO product_price
    FROM HomeProducts
    WHERE HomeProduct_Id = NEW.HomeProduct_Id;

    SET NEW.Taxed_Price = product_price * 1.15;

    SELECT Solde INTO current_solde
    FROM Wallets
    WHERE User_Id = NEW.User_Id;

    IF current_solde < NEW.Taxed_Price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient funds.';
    ELSE
        UPDATE Wallets
        SET Solde = Solde - NEW.Taxed_Price
        WHERE User_Id = NEW.User_Id;
    END IF;
END;
//

-- Trigger : Décrémenter le stock après achat
CREATE TRIGGER after_buy_decrease_stock
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    UPDATE HomeProducts
    SET Quantity = Quantity - 1
    WHERE HomeProduct_Id = NEW.HomeProduct_Id AND Quantity > 0;
END;
//

-- Trigger : Empêcher l'achat si stock insuffisant
CREATE TRIGGER before_buy_check_stock
BEFORE INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;

    SELECT Quantity INTO available_stock
    FROM HomeProducts
    WHERE HomeProduct_Id = NEW.HomeProduct_Id;

    IF available_stock <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This product is out of stock.';
    END IF;
END;
//

-- Trigger : Supprimer produit si stock atteint 0
CREATE TRIGGER after_update_check_stock_zero
AFTER UPDATE ON HomeProducts
FOR EACH ROW
BEGIN
    IF NEW.Quantity = 0 THEN
        DELETE FROM HomeProducts WHERE HomeProduct_Id = NEW.HomeProduct_Id;
    END IF;
END;
//

-- Trigger : Supprimer données liées à un user supprimé
CREATE TRIGGER before_user_delete
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
    DELETE FROM Wallets WHERE User_Id = OLD.User_Id;
    DELETE FROM Addresses WHERE User_Id = OLD.User_Id;
    DELETE FROM HomeProducts WHERE Seller_Id = OLD.User_Id;
END;
//

-- Trigger : Empêcher un user d'acheter 2 fois le même produit
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
END;
//

-- FUNCTION : Vérifier si un user a déjà acheté un produit
CREATE FUNCTION hasBoughtProduct(userId INT, productId INT)
RETURNS BOOLEAN
READS SQL DATA
BEGIN
    DECLARE count_buys INT;

    SELECT COUNT(*) INTO count_buys
    FROM Buys
    WHERE User_Id = userId AND HomeProduct_Id = productId;

    RETURN count_buys > 0;
END;
//

-- Trigger : Empêcher un user de commenter sans achat
CREATE TRIGGER prevent_review_without_purchase
BEFORE INSERT ON Reviews
FOR EACH ROW
BEGIN
    IF hasBoughtProduct(NEW.Author_Id, NEW.HomeProduct_Id) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You cannot review a product you did not purchase.';
    END IF;
END;
//

DELIMITER ;
