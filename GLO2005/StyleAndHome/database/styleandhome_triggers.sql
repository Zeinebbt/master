USE StyleAndHome;

-- Trigger: Auto-create wallet and address after user insert
DROP TRIGGER IF EXISTS after_user_insert;
DELIMITER //
CREATE TRIGGER after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    -- Création automatique d'un portefeuille
    INSERT INTO Wallets (User_Id, Solde)
    VALUES (NEW.User_Id, 0.00);

    -- Création automatique d'une adresse vide
    INSERT INTO Addresses (User_Id, Zip, Province, Country, StreetNameAndNumber)
    VALUES (NEW.User_Id, '', '', '', '');
END;
//
DELIMITER ;

-- Trigger: Créditer le portefeuille du vendeur après un achat
DROP TRIGGER IF EXISTS after_buy_credit_seller;
DELIMITER //
CREATE TRIGGER after_buy_credit_seller
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    DECLARE seller_id INT;

    -- Récupération du vendeur lié au produit acheté
    SELECT Seller_Id INTO seller_id
    FROM HomeProduct
    WHERE HomeProduct_Id = NEW.HomeProduct_Id
    LIMIT 1;

    -- Créditer le portefeuille du vendeur
    UPDATE Wallets
    SET Solde = Solde + NEW.Taxed_Price
    WHERE User_Id = seller_id;
END;
//
DELIMITER ;

-- Trigger: Débiter le portefeuille de l'acheteur après un achat
DROP TRIGGER IF EXISTS after_buy_deduct_buyer;
DELIMITER //
CREATE TRIGGER after_buy_deduct_buyer
AFTER INSERT ON Buys
FOR EACH ROW
BEGIN
    -- Débiter le portefeuille de l'acheteur
    UPDATE Wallets
    SET Solde = Solde - NEW.Taxed_Price
    WHERE User_Id = NEW.User_Id;
END;
//
DELIMITER ;
