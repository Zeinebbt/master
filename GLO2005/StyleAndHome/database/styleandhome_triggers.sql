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

DELIMITER ;
