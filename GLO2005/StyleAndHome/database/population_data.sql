USE StyleAndHome;


INSERT INTO Users (User_Id, Username, Email, PasswordHash, Birthdate, CreatedAt) VALUES
(1, 'oliviawilliams1', 'oliviawilliams1@example.com', 'hash1', '1994-12-15', '2025-04-13 05:05:31'),
(2, 'noahjohnson2', 'noahjohnson2@example.com', 'hash2', '1999-02-16', '2025-04-13 05:05:31'),
(3, 'jamesrodriguez3', 'jamesrodriguez3@example.com', 'hash3', '1980-12-16', '2025-04-11 05:05:31'),
(4, 'oliviabrown4', 'oliviabrown4@example.com', 'hash4', '1999-12-04', '2025-04-08 05:05:31'),
(5, 'noahgarcia5', 'noahgarcia5@example.com', 'hash5', '1979-11-10', '2025-04-08 05:05:31'),
(6, 'noahjones6', 'noahjones6@example.com', 'hash6', '1995-10-12', '2025-04-08 05:05:31'),
(7, 'avamiller7', 'avamiller7@example.com', 'hash7', '1978-03-13', '2025-04-12 05:05:31'),
(8, 'sophiabrown8', 'sophiabrown8@example.com', 'hash8', '1992-11-11', '2025-04-11 05:05:31'),
(9, 'sophiajohnson9', 'sophiajohnson9@example.com', 'hash9', '1991-08-27', '2025-04-13 05:05:31'),
(10, 'jamesjohnson10', 'jamesjohnson10@example.com', 'hash10', '1996-11-26', '2025-04-14 05:05:31'),
(11, 'noahgarcia11', 'noahgarcia11@example.com', 'hash11', '1973-03-13', '2025-04-09 05:05:31'),
(12, 'emmamiller12', 'emmamiller12@example.com', 'hash12', '1976-04-19', '2025-04-10 05:05:31'),
(13, 'jamesbrown13', 'jamesbrown13@example.com', 'hash13', '1997-07-22', '2025-04-12 05:05:31'),
(14, 'benjaminbrown14', 'benjaminbrown14@example.com', 'hash14', '1974-08-26', '2025-04-14 05:05:31'),
(15, 'charlotterodriguez15', 'charlotterodriguez15@example.com', 'hash15', '1998-10-11', '2025-04-09 05:05:31'),
(16, 'sophiabrown16', 'sophiabrown16@example.com', 'hash16', '1977-05-10', '2025-04-08 05:05:31'),
(17, 'noahjohnson17', 'noahjohnson17@example.com', 'hash17', '1976-04-02', '2025-04-09 05:05:31'),
(18, 'noahmartinez18', 'noahmartinez18@example.com', 'hash18', '1979-05-10', '2025-04-08 05:05:31'),
(19, 'williamdavis19', 'williamdavis19@example.com', 'hash19', '1970-03-18', '2025-04-14 05:05:31'),
(20, 'noahgarcia20', 'noahgarcia20@example.com', 'hash20', '1986-05-15', '2025-04-12 05:05:31');

INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'HEMNES - Lit d\'appoint 3 tiroirs',
    'Structure de lit d\'appoint avec trois tiroirs intégrés, en bois massif blanc, idéale pour chambre d\'enfant ou chambre d\'amis.',
    399.00,
    'IKEA',
    'Chambre enfant',
    'https://www.ikea.com/ca/fr/images/products/hemnes-structure-lit-dappoint-a-3-tiroirs-blanc__1180454_pe896328_s5.jpg?f=xl',
    555,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'STRANDMON - Fauteuil à oreilles',
    'Fauteuil confortable à oreilles en tissu Nordvalla gris foncé, idéal pour le salon ou un coin lecture. Design classique avec accoudoirs arrondis.',
    349.00,
    'IKEA',
    'Salon',
    'https://www.ikea.com/ca/fr/images/products/strandmon-fauteuil-a-oreilles-nordvalla-gris-fonce__0325432_pe517964_s5.jpg?f=xl',
    444,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'ÄLMAREN - Mitigeur couleur inox',
    'Mitigeur au design moderne avec une finition inox, idéal pour les éviers de cuisine ou salle de bain. Poignée unique pour un contrôle précis de la température et du débit.',
    89.00,
    'IKEA',
    'Salle de bain',
    'https://www.ikea.com/ca/fr/images/products/aelmaren-mitigeur-couleur-inox__0804883_pe769403_s5.jpg?f=xl',
    1000,
    18
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'IKEA 365+ - Bocal avec couvercle',
    'Bocal en verre transparent avec couvercle en bambou, parfait pour le rangement d\'aliments secs comme les pâtes, le riz ou le café. Design simple et hermétique.',
    7.99,
    'IKEA',
    'Rangement',
    'https://www.ikea.com/ca/fr/images/products/ikea-365-bocal-avec-couvercle-verre-bambou__0650353_pe706148_s5.jpg?f=xl',
    475,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'STOCKHOLM 2025 - Canapé Sundhamn beige',
    'Canapé 3 places au design scandinave, revêtement Sundhamn beige, assise profonde et confortable. Structure robuste et élégante pour un salon contemporain.',
    1699.00,
    'IKEA',
    'Salon',
    'https://www.ikea.com/ca/fr/images/products/stockholm-2025-canape-sundhamn-beige__1362734_pe955310_s5.jpg?f=xl',
    1111,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'BESTÅ - Meuble télé brun-noir avec portes chêne plaqué',
    'Meuble TV au design moderne avec structure brun-noir et façades en chêne plaqué. Équipé de portes HEDEVIKEN/STUBBARP pour un rangement discret et élégant.',
    279.00,
    'IKEA',
    'Salon',
    'https://www.ikea.com/ca/fr/images/products/besta-meuble-tele-avec-portes-brun-noir-hedeviken-stubbarp-chene-plaque__0992038_pe819771_s5.jpg?f=xl',
    1111,
    11
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'BILLY - Bibliothèque vitrée bleu foncé',
    'Bibliothèque avec portes vitrées au coloris bleu foncé, idéale pour exposer livres ou objets décoratifs. Design intemporel et modulable selon les besoins.',
    179.00,
    'IKEA',
    'Bureau',
    'https://www.ikea.com/ca/fr/images/products/billy-bibliotheque-vitree-bleu-fonce__0429309_pe584188_s5.jpg?f=xl',
    1111,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'EKENÄSET - Fauteuil Jonsbyn noir',
    'Fauteuil au style rétro avec revêtement en tissu Jonsbyn noir. Structure en bois massif, dossier incliné et accoudoirs en angle pour un confort optimal dans le salon.',
    279.00,
    'IKEA',
    'Salon',
    'https://www.ikea.com/ca/fr/images/products/ekenaeset-fauteuil-jonsbyn-noir__1109680_pe870147_s5.jpg?f=xl',
    1222,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'NYMÅNE - Lampe de table anthracite',
    'Lampe de table moderne au fini anthracite mat. Design minimaliste, idéale pour le bureau ou la chambre à coucher. Tête orientable pour un éclairage ciblé.',
    34.99,
    'IKEA',
    'Bureau',
    'https://www.ikea.com/ca/fr/images/products/nymane-lampe-de-table-anthracite__1377218_pe960803_s5.jpg?f=xl',
    144,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'OFTAST - Bol blanc',
    'Bol en opale blanc, léger et résistant aux chocs. Convient parfaitement pour un usage quotidien, passe au micro-ondes et lave-vaisselle.',
    1.49,
    'IKEA',
    'Salle à manger',
    'https://www.ikea.com/ca/fr/images/products/oftast-bol-blanc__0712208_pe728639_s5.jpg?f=xl',
    1444,
    13
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'VINTROSA - Lave-vaisselle encastrable acier inox',
    'Lave-vaisselle encastrable en acier inoxydable, silencieux et écoénergétique. Capacité adaptée aux grandes familles, avec programmes automatiques et panier réglable.',
    799.00,
    'IKEA',
    'Cuisine',
    'https://www.ikea.com/ca/fr/images/products/vintrosa-lave-vaisselle-encastrable-acier-inox__1320273_pe941194_s5.jpg?f=xl',
    17,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Salon de jardin 5 places - Aluminium gris anthracite',
    'Salon d\'extérieur 5 places en aluminium gris anthracite. Comprend un canapé d\'angle, une table basse et des coussins assortis. Résistant aux intempéries et au design contemporain.',
    1190.00,
    'Maisons du Monde',
    'Extérieur',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/salon-de-jardin-5-places-en-aluminium-gris-anthracite-1000-0-6-219028_1.jpg',
    175,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lit effet bois blanc et anthracite 190x90',
    'Lit simple au design contemporain, finition bois blanc et anthracite. Structure robuste idéale pour chambre enfant ou ado. Dimensions 190x90 cm.',
    249.00,
    'Maisons du Monde',
    'Chambre enfant',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M23160878_1/lit-effet-bois-blanc-et-anthracite-190x90.jpg',
    147,
    16
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Salon de jardin 6 places - Acacia massif et toile écrue recyclée',
    'Salon de jardin en bois d\'acacia massif, composé d\'un canapé 6 places avec coussins en toile écrue recyclée. Élégant, confortable et écologique, parfait pour les espaces extérieurs.',
    1390.00,
    'Maisons du Monde',
    'Extérieur',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/salon-de-jardin-6-places-en-acacia-massif-et-toile-ecrue-recyclee-1000-14-24-238439_4.jpg',
    147,
    19
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble vinyle vintage décor bois 100 cm',
    'Meuble de rangement pour platines et vinyles au style vintage, finition décor bois. Dispose d\'étagères et d\'un compartiment pour ampli ou accessoires audio. Largeur : 100 cm.',
    229.00,
    'Maisons du Monde',
    'Salon',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M23133377_4/meuble-vinyle-vintage-decor-bois-100-cm.jpg',
    174,
    18
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lot de 2 chevets - Effet chêne et cannage rotin 40 cm',
    'Ensemble de 2 tables de chevet au style naturel et bohème. Finition effet chêne clair et façade en cannage rotin. Parfaites pour une chambre chaleureuse et tendance.',
    159.00,
    'Maisons du Monde',
    'Chambre',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M23173403_1/lot-de-2-chevets-effet-chene-et-cannage-rotin-40cm.jpg',
    447,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tables gigognes - Verre trempé et métal noir',
    'Ensemble de deux tables gigognes au design moderne et épuré. Plateau en verre trempé et structure en métal noir, idéal pour les petits espaces ou comme table basse d\'appoint.',
    179.00,
    'Maisons du Monde',
    'Salon',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/tables-gigognes-en-verre-trempe-et-metal-noir-1000-12-20-166357_1.jpg',
    471,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Mobile musical bébé - Baleine, étoiles et pompons en coton bio',
    'Mobile musical multicolore en coton biologique, décoré d\'une baleine, d\'étoiles et de pompons. Idéal pour apaiser bébé et décorer la chambre avec douceur.',
    45.00,
    'Maisons du Monde',
    'Chambre enfant',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/mobile-musical-bebe-baleine-etoiles-et-pompons-en-coton-bio-multicolore-1000-2-7-238053_1.jpg',
    4741,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Parure de lit enfant - Lion réversible 140x200 cm',
    'Parure de lit réversible pour enfant, motif lion amusant sur une face et motif étoilé sur l\'autre. En coton doux, idéale pour un couchage 140x200 cm.',
    39.99,
    'Maisons du Monde',
    'Chambre enfant',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M24174673_1/parure-de-lit-enfant-lion-reversible-140x200cm.jpg',
    471,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Plaid imitation fourrure blanche 130x170 cm',
    'Plaid doux et chaleureux en imitation fourrure blanche. Dimensions 130x170 cm, parfait pour ajouter une touche cosy au salon ou à la chambre.',
    49.99,
    'Maisons du Monde',
    'Chambre',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/plaid-imitation-fourrure-blanche-130x170-1000-15-14-231623_1.jpg',
    471,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Transat bain de soleil pliable grand confort',
    'Transat pliable conçu pour le bain de soleil, alliant confort et praticité. Structure légère et résistante, idéal pour les moments de détente en extérieur.',
    109.00,
    'Maisons du Monde',
    'Extérieur',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M21024493_1/transat-bain-de-soleil-pliable-grand-confort.jpg',
    571,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Saladier en bambou bleu-vert',
    'Saladier décoratif et fonctionnel en bambou, intérieur coloré bleu-vert. Léger et résistant, idéal pour servir salades ou fruits avec style.',
    19.90,
    'Maisons du Monde',
    'Salle à manger',
    'https://medias.maisonsdumonde.com/image/upload/ar_1:1,c_fill,f_auto,q_auto,w_732/v1/img/saladier-en-bambou-bleu-vert-1000-4-26-244345_1.jpg',
    451,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Égouttoir en métal noir',
    'Égouttoir pratique et design en métal noir. Offre une grande capacité pour assiettes, verres et couverts. Idéal pour un plan de travail moderne et fonctionnel.',
    24.99,
    'Maisons du Monde',
    'Cuisine',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/egouttoir-en-metal-noir-1000-15-18-244050_1.jpg',
    165,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble vasque - Bois d’orme recyclé et pierre bleue',
    'Meuble vasque au design authentique, fabriqué en bois d’orme recyclé avec un plan en pierre bleue. Allie charme naturel et fonctionnalité pour la salle de bain.',
    890.00,
    'Maisons du Monde',
    'Salle de bain',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/meuble-vasque-en-bois-d-orme-recycle-et-pierre-bleue-1000-8-31-236478_7.jpg',
    18,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Distributeur de savon - Verre moucheté noir et transparent',
    'Distributeur de savon élégant en verre moucheté noir et transparent. Ajoute une touche moderne à la salle de bain ou à la cuisine.',
    14.99,
    'Maisons du Monde',
    'Salle de bain',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/distributeur-de-savon-en-verre-mouchete-noir-et-transparent-1000-12-28-246971_2.jpg',
    15,
    13
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Brosse de toilette - Résine noire',
    'Brosse WC au design sobre et moderne, fabriquée en résine noire. Parfaite pour compléter la décoration d\'une salle de bain contemporaine.',
    12.99,
    'Maisons du Monde',
    'Salle de bain',
    'https://medias.maisonsdumonde.com/image/upload/f_auto,q_auto/v1/img/brosse-de-toilette-en-resine-noire-1000-1-12-247980_2.jpg',
    188,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Cuit-pâtes en inox argent 24 cm - Multifonctions',
    'Cuit-pâtes en acier inoxydable de 24 cm avec panier intégré. Idéal pour cuire pâtes, légumes ou fruits de mer. Compatible tous feux, dont induction.',
    39.90,
    'Maisons du Monde',
    'Cuisine',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto/v1/mkp/M24176375_1/cuit-pates-en-inox-argent-24cm-multifonctions.jpg',
    1787,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lot de 3 poêles - 20/24/28 cm, revêtement céramique, poignée amovible',
    'Ensemble de 3 poêles en aluminium avec revêtement céramique antiadhésif. Poignée amovible pour un rangement pratique. Compatibles tous feux sauf induction.',
    59.99,
    'Maisons du Monde',
    'Cuisine',
    'https://medias.maisonsdumonde.com/images/ar_1:1,c_pad,f_auto,q_auto,w_732/v1/mkp/M24160832_1/lot-de-3-poeles-20-24-28cm-revetement-ceramique-et-poignee-amovible-i.jpg',
    188,
    11
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Canapé convertible 3 places - Gris clair',
    'Canapé 3 places au design moderne, revêtement tissu gris clair. Convertible en lit d\'appoint, idéal pour les petits espaces. Confortable et fonctionnel.',
    449.00,
    'Conforama',
    'Salon',
    'https://www.conforama.fr/fstrz/r/s/media.conforama.fr/m/export/Medias/100000/00000/2000/800/30/G_102836_Y.jpg',
    188,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble TV contemporain - Bois clair et noir',
    'Meuble TV au design moderne associant bois clair et noir mat. Dispose de rangements fermés et ouverts, parfait pour organiser les équipements multimédia.',
    189.00,
    'Conforama',
    'Salon',
    'https://lebomeuble.com/cdn/shop/files/LV2-KL-1-min_4_11zon.webp?v=1742311000',
    187,
    3
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lit double avec tiroirs - Blanc 140x190 cm',
    'Lit double fonctionnel en panneau blanc avec deux tiroirs intégrés pour rangement. Dimensions 140x190 cm. Parfait pour chambre moderne et gain de place.',
    279.00,
    'Conforama',
    'Chambre',
    'https://images.homedepot.ca/productimages/p_1000736229.jpg?product-images=l',
    185,
    3
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Commode 3 tiroirs - Bois naturel et blanc',
    'Commode pratique avec trois tiroirs spacieux, design épuré en bois naturel et blanc. Parfaite pour le rangement dans la chambre ou l\'entrée.',
    149.00,
    'Conforama',
    'Chambre',
    'https://cdn2.conforama.fr/product/image/26ec/G_CNF_H91974747_E.jpeg',
    155,
    2
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table à manger extensible - Imitation bois clair',
    'Table à manger extensible au design contemporain avec finition imitation bois clair. Convient pour 4 à 6 personnes, idéale pour les repas en famille ou entre amis.',
    229.00,
    'Conforama',
    'Salle à manger',
    'https://pictureserver.net/pic_storage/pic/f7/a7/undef_src_sa_picid_786559_x_1800_type_color_image.jpg?ver=34',
    155,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Chaise de salle à manger - Capitonnée gris foncé',
    'Chaise élégante et confortable avec assise capitonnée en tissu gris foncé. Pieds noirs en métal, parfaite pour compléter une table à manger moderne.',
    69.99,
    'Conforama',
    'Salle à manger',
    'https://media.rueducommerce.fr/mktp/product/productImage/1/61/d71b847f66204e1ba0aea00bb6bbf85f.webp',
    198,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble à chaussures 3 abattants - Bois clair et blanc',
    'Meuble de rangement pour chaussures avec 3 abattants. Design compact en bois clair et blanc, idéal pour l\'entrée ou le couloir.',
    109.00,
    'Conforama',
    'Rangement',
    'https://www.cdiscount.com/pdt2/4/3/9/3/700x700/aaaev17439/rw/meuble--chaussures-homcom-3.jpg',
    681,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Bibliothèque contemporaine - Effet bois et noir',
    'Bibliothèque au design contemporain avec structure noire et étagères effet bois. Idéale pour ranger livres, objets déco ou classeurs dans un salon ou bureau moderne.',
    159.00,
    'Conforama',
    'Bureau',
    'https://medias.maisonsdumonde.com/images/f_auto,q_auto,w_732/v1/mkp/M24176611_2/bibliotheque-etagere-rangement-moderne-effet-bois-et-noir-w80-w30-h100.jpg',
    581,
    5
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Buffet bas 2 portes - Effet bois clair et blanc',
    'Buffet de rangement bas avec deux portes, finition bois clair et blanc. Compact et fonctionnel, idéal pour la salle à manger ou l’entrée.',
    139.00,
    'Conforama',
    'Salle à manger',
    'https://www.ikea.com/ca/fr/images/products/besta-rangement-a-portes-blanc-hedeviken-oesarp-chene-plaque__0994434_pe821091_s5.jpg?f=l',
    581,
    6
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Bureau d’angle avec rangements - Blanc et chêne',
    'Bureau d’angle fonctionnel avec rangements intégrés, finition blanche et chêne clair. Idéal pour optimiser l’espace de travail dans un bureau ou une chambre.',
    199.00,
    'Conforama',
    'Bureau',
    'https://www.cbc-meubles.com/20851-thickbox_default/bureau-design-angle-blanc-et-chene.jpg',
    581,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lit coffre 140x190 cm - Tissu gris',
    'Lit double avec coffre de rangement intégré, revêtement en tissu gris. Pratique et élégant, parfait pour optimiser l’espace dans une chambre.',
    359.00,
    'Conforama',
    'Chambre',
    'https://www.conforama.fr/fstrz/r/s/cdn.conforama.fr/prod/product/image/7ce6/G_CNF_T41713045_B.jpeg',
    961,
    8
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble de rangement bas 2 portes - Imitation chêne',
    'Meuble bas avec deux portes battantes, finition imitation chêne clair. Idéal pour le rangement dans un salon, une chambre ou un couloir.',
    119.00,
    'Conforama',
    'Rangement',
    'https://medias.maisonsdumonde.com/images/ar_1:1,c_pad,f_auto,q_auto,w_354/v1/mkp/M23105818_2/buffet-2-portes-2-tiroirs-decor-chene-l90-x-h80-cm.jpg',
    581,
    9
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Canapé d’angle convertible - Tissu gris avec coffre',
    'Canapé d’angle spacieux et confortable en tissu gris. Convertible en lit et équipé d\'un coffre de rangement, parfait pour les salons fonctionnels.',
    699.00,
    'Conforama',
    'Salon',
    'https://www.cdiscount.com/pdt2/9/0/7/1/700x700/daytonaa131907/rw/canape-d-angle-convertible-reversible-avec-coffre.jpg',
    51,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Aspirateur balai sans fil 2-en-1',
    'Aspirateur balai sans fil multifonction 2-en-1. Léger, pratique et adapté aux sols et tapis. Batterie rechargeable et bac facile à vider.',
    119.00,
    'But',
    'Autre',
    'https://dam.groupeseb.com/m/4230406f2166bf1f/Digital-RH6751_LIFESTYLE.tif?timestamp=20250317040315',
    881,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Grille-pain double fente - Acier inoxydable',
    'Grille-pain 2 fentes avec réglage de brunissage, finition en acier inoxydable. Compact et élégant, parfait pour les petits déjeuners du quotidien.',
    34.90,
    'But',
    'Cuisine',
    'https://m.media-amazon.com/images/I/81YPnWD79nS._AC_SX679_.jpg',
    581,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Micro-ondes 20L - Blanc avec minuterie mécanique',
    'Micro-ondes compact d’une capacité de 20L, coloris blanc. Équipé d’une minuterie mécanique et de plusieurs niveaux de puissance pour un usage quotidien simple et efficace.',
    59.99,
    'But',
    'Cuisine',
    'https://banliat.com/4789-large_default/four-micro-ondes-20l-700w-blanc-minut-meca.jpg',
    51,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Bouilloire électrique 1,7L - Inox brossé',
    'Bouilloire électrique d\'une capacité de 1,7 litre avec finition en inox brossé. Ébullition rapide, base pivotante 360° et arrêt automatique pour plus de sécurité.',
    29.99,
    'But',
    'Cuisine',
    'https://twicpics.krups.fr/https://dam.groupeseb.com/m/18d546cd819d9562/Digital-KPS_BW552D10_FIRST-KETTLE_QUALITYIDEO-CAROUSEL.png?timestamp=20250312025307&twic=v1/resize=500',
    51,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lampe de table - Céramique marbrée et abat-jour blanc',
    'Lampe de table décorative avec pied en céramique effet marbre et abat-jour en tissu blanc. Apporte une touche élégante à un bureau, salon ou chambre.',
    24.90,
    'But',
    'Bureau',
    'https://m.media-amazon.com/images/I/81092Lqg8eL.jpg',
    551,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table basse carrée - Style industriel bois et métal noir',
    'Table basse au design industriel, plateau effet bois vieilli et structure en métal noir. Format carré, parfaite pour compléter un salon contemporain.',
    89.99,
    'But',
    'Salon',
    'https://m.media-amazon.com/images/I/81dQ53RPK5L._AC_SX679_.jpg',
    851,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Étagère murale 5 niveaux - Métal noir',
    'Étagère murale au design minimaliste avec 5 niveaux de rangement. Structure fine en métal noir, idéale pour exposer livres, plantes ou objets déco.',
    49.99,
    'But',
    'Rangement',
    'https://m.media-amazon.com/images/I/81b7v+rUtVL.jpg',
    158,
    5
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Porte-manteau sur pied - Métal noir style industriel',
    'Porte-manteau sur pied en métal noir, design industriel avec plusieurs crochets à différentes hauteurs. Stable et fonctionnel pour entrée ou bureau.',
    39.99,
    'But',
    'Rangement',
    'https://medias.maisonsdumonde.com/images/ar_1:1,c_pad,f_auto,q_auto,w_732/v1/mkp/M23092209_2/porte-manteaux-avec-8-crochets-sur-pieds-en-metal-noir-178x62x62cm.jpg',
    185,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tapis graphique noir et blanc 160x230 cm',
    'Tapis rectangulaire aux motifs graphiques noirs et blancs. Dimensions 160x230 cm, idéal pour ajouter une touche moderne et chaleureuse au salon ou à la chambre.',
    79.99,
    'But',
    'Salon',
    'https://m.media-amazon.com/images/I/71flnClh-2L._AC_SX679_.jpg',
    185,
    2
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Ventilateur sur pied oscillant 40 cm - Blanc',
    'Ventilateur sur pied blanc avec tête oscillante, diamètre 40 cm. Hauteur réglable, 3 vitesses, idéal pour rafraîchir une pièce en été.',
    29.99,
    'But',
    'Autre',
    'https://m.media-amazon.com/images/I/41vKgC95hOL._AC_UF894,1000_QL80_.jpg',
    185,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Radiateur soufflant céramique - Compact blanc',
    'Radiateur soufflant céramique compact et puissant, coloris blanc. Idéal pour chauffer rapidement une petite pièce. Fonction oscillation et sécurité anti-surchauffe.',
    39.99,
    'But',
    'Autre',
    'https://i5.walmartimages.com/asr/6ffaed05-fc5a-4e7c-a3d2-4a1fcd2902fe.1ce0af91301cf1979a78526a0dec3ee1.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF',
    185,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tabouret de bar réglable - Velours gris et métal noir',
    'Tabouret de bar design avec assise en velours gris et pied en métal noir. Hauteur réglable, repose-pieds intégré. Confort et style pour cuisine ou îlot central.',
    59.90,
    'But',
    'Salle à manger',
    'https://www.cdiscount.com/pdt2/9/7/6/1/700x700/ohm8325204404976/rw/ohmg-ensemble-de-deux-tabourets-de-bar-en-velours.jpg',
    185,
    8
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tapis de bain antidérapant - Gris 50x80 cm',
    'Tapis de bain doux et absorbant, coloris gris. Dimensions 50x80 cm. Dessous antidérapant pour une sécurité optimale dans la salle de bain.',
    14.99,
    'But',
    'Salle de bain',
    'https://m.media-amazon.com/images/I/617u6TKUduL._AC_UF1000,1000_QL80_.jpg',
    185,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Canapé sectionnel 2 pièces - Velours côtelé',
    'Canapé d’angle 2 pièces au revêtement en velours côtelé. Confort maximal et style contemporain, parfait pour les grands salons.',
    1249.00,
    'Wayfair',
    'Salon',
    'https://assets.wfcdn.com/im/26075483/resize-h800-w800%5Ecompr-r85/2487/248778691/Aristotele+2+-+Piece+Corduroy+Sectional-562603074.jpg',
    18,
    5
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Buffet Ceeva 47.5" - Bois et noir style moderne',
    'Buffet contemporain avec portes battantes et étagères intérieures. Finition bois clair et noir, idéal pour la salle à manger ou le salon.',
    349.00,
    'Wayfair',
    'Salle à manger',
    'https://assets.wfcdn.com/im/84217462/resize-h1600-w1600%5Ecompr-r85/2535/253533730/Ceeva+47.5%27%27+Sideboard.jpg',
    155,
    8
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Cuisinière rétro 30" - Gaz 4 brûleurs avec four à convection',
    'Cuisinière indépendante au style rétro avec 4 brûleurs à gaz et un four à convection de 3.9 pi³. Design vintage, idéale pour une cuisine au charme d’antan.',
    1999.00,
    'Wayfair',
    'Cuisine',
    'https://assets.wfcdn.com/im/48960138/resize-h755-w755%5Ecompr-r85/1770/177044396/Classic+Retro+30%22+4+burner+3.9+cu.+ft.+Freestanding+Gas+Range+with+Convection+Oven.jpg',
    100,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table à manger Rahn - Style contemporain',
    'Table à manger élégante avec plateau rectangulaire et pieds en métal noir. Design moderne parfait pour accueillir 4 à 6 personnes dans une salle à manger raffinée.',
    429.00,
    'Wayfair',
    'Salle à manger',
    'https://assets.wfcdn.com/im/20952788/resize-h800-w800%5Ecompr-r85/3299/329961214/Rahn+Dining+Table-183639933.jpg',
    185,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lot de chaises de salle à manger - Similicuir moderne',
    'Ensemble de chaises rembourrées en similicuir avec pieds en métal noir. Design épuré et contemporain, parfait pour une salle à manger élégante.',
    189.00,
    'Wayfair',
    'Salle à manger',
    'https://assets.wfcdn.com/im/11492839/resize-h755-w755%5Ecompr-r85/3051/305132459/Modern+Upholstered+Faux+Leather+Dining+Chairs.jpg',
    158,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Service de vaisselle 16 pièces - Gibson Home Oslo',
    'Service de vaisselle complet pour 4 personnes, comprenant assiettes, bols et tasses. Design moderne et épuré en céramique blanche.',
    64.99,
    'Gibson Home',
    'Salle à manger',
    'https://assets.wfcdn.com/im/96579325/resize-h800-w800%5Ecompr-r85/2236/223645383/Gibson+Home+Oslo+16+Piece+Dinnerware+Set-701779654.jpg',
    157,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Set de service Libbey Boozy Brunch - Pichet + 6 verres highball',
    'Set d\'entertainment moderne comprenant un pichet élégant et 6 verres highball assortis. Idéal pour les brunchs et cocktails en toute occasion.',
    39.99,
    'Libbey',
    'Salle à manger',
    'https://assets.wfcdn.com/im/79926586/compr-r85/8862/88625676/Modern+Bar+Libbey+Boozy+Brunch+Entertaining+Set+with+6+Highball+Glasses+and+Pitcher.jpg',
    185,
    6
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table basse Sparta - Relevable extensible avec rangement',
    'Table basse multifonction avec plateau relevable et espace de rangement intégré. Design moderne et pratique pour optimiser l’espace dans un salon.',
    229.00,
    'Wayfair',
    'Salon',
    'https://assets.wfcdn.com/im/09361137/resize-h800-w800%5Ecompr-r85/2572/257248912/Sparta+Lift+Top+Extendable+Coffee+Table+With+Storage-1056518390.jpg',
    177,
    6
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tables basses gigognes Briajah',
    'Lot de 2 tables basses gigognes au design élégant. Plateau imitation marbre et structure en métal doré. Parfaites pour les salons modernes et sophistiqués.',
    199.00,
    'Wayfair',
    'Salon',
    'https://assets.wfcdn.com/im/43621981/resize-h800-w800%5Ecompr-r85/1975/197524222/Briajah+Nesting+Coffee+Table-932048850-937974278-932048851.jpg',
    158,
    5
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble à chaussures Lismore - 12 paires',
    'Meuble à chaussures compact et moderne avec portes battantes, pouvant contenir jusqu’à 12 paires. Parfait pour les entrées ou les petits espaces.',
    129.00,
    'Wayfair',
    'Rangement',
    'https://assets.wfcdn.com/im/23432753/resize-h1600-w1600%5Ecompr-r85/2399/239999874/Lismore+12+Pair+Shoe+Storage+Cabinet.jpg',
    158,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Service de vaisselle Daytona 12 pièces - Grès (4 personnes)',
    'Service de vaisselle élégant en grès comprenant 4 assiettes plates, 4 assiettes à dessert et 4 bols. Finition texturée, passe au lave-vaisselle et micro-ondes.',
    54.99,
    'Wayfair',
    'Salle à manger',
    'https://assets.wfcdn.com/im/29209718/resize-h800-w800%5Ecompr-r85/2286/228667264/Daytona+12+Piece+Stoneware+Dinnerware+Set+-+Service+for+4-669515105.jpg',
    158,
    4
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lit plateforme capitonné Hegg',
    'Lit plateforme élégant avec tête de lit capitonnée et revêtement en tissu. Structure robuste, sans sommier à lattes. Idéal pour un style contemporain en chambre.',
    389.00,
    'Wayfair',
    'Chambre',
    'https://assets.wfcdn.com/im/13620376/resize-h755-w755%5Ecompr-r85/2521/252194370/Hegg+Tufted+Upholstered+Platform+Bed.jpg',
    158,
    2
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Commode Yarber - 6 tiroirs en bois massif',
    'Commode double en bois massif avec 6 grands tiroirs. Design sobre et élégant, parfaite pour une chambre spacieuse avec beaucoup de rangement.',
    599.00,
    'Wayfair',
    'Chambre',
    'https://assets.wfcdn.com/im/21507755/resize-h755-w755%5Ecompr-r85/2677/267774245/Yarber+6+Drawer+Solid+Wood+Double+Dresser.jpg',
    178,
    3
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Plafonnier semi-encastré Yearby - Verre',
    'Plafonnier semi-encastré avec abat-jour en verre transparent et base en métal noir. Design industriel chic, parfait pour une entrée, un couloir ou une cuisine.',
    84.99,
    'Wayfair',
    'Autre',
    'https://assets.wfcdn.com/im/58319419/resize-h755-w755%5Ecompr-r85/3118/311876330/Yearby+Glass+Semi+Flush+Mount.jpg',
    147,
    3
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Fauteuil Bopp - Rembourré avec accoudoirs',
    'Fauteuil élégant au design contemporain, revêtement tissu doux avec accoudoirs incurvés. Confortable et parfait pour un salon ou un coin lecture.',
    269.00,
    'Wayfair',
    'Salon',
    'https://assets.wfcdn.com/im/04273033/resize-h800-w800%5Ecompr-r85/1891/189130714/Bopp+Upholstered+Armchair-2085442900.jpg',
    11,
    2
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Plafonnier semi-encastré Jacobson',
    'Plafonnier au style industriel moderne avec globe en verre transparent et finition métal noir. Parfait pour illuminer une entrée, une cuisine ou un couloir.',
    74.99,
    'Wayfair',
    'Autre',
    'https://assets.wfcdn.com/im/08054502/resize-h800-w800%5Ecompr-r85/1470/147075090/Jacobson+Semi+Flush+Mount-703754808.jpg',
    471,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Support mural universel pour télévision',
    'Support mural inclinable et pivotant compatible avec la plupart des téléviseurs de 26 à 65 pouces. Construction robuste en acier, facile à installer.',
    32.99,
    'Amazon Basics',
    'Salon',
    'https://m.media-amazon.com/images/I/71SuH0TCdGL.__AC_SY300_SX300_QL70_ML2_.jpg',
    741,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble de rangement 3 tiroirs - Tissu et métal',
    'Meuble de rangement compact avec structure en métal et tiroirs en tissu. Léger, facile à déplacer, idéal pour chambre, bureau ou entrée.',
    44.99,
    'Amazon Basics',
    'Rangement',
    'https://i5.walmartimages.ca/images/Enlarge/460/791/6000204460791.jpg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF',
    871,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table d\'appoint ronde - Plateau noir et pieds en bois',
    'Petite table d\'appoint ronde avec plateau noir mat et pieds inclinés en bois naturel. Idéale pour salon, chambre ou coin lecture.',
    39.99,
    'Amazon Basics',
    'Salon',
    'https://m.media-amazon.com/images/I/71zPMO2RaML.__AC_SX300_SY300_QL70_ML2_.jpg',
    471,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Lampe de chevet LED tactile avec variateur',
    'Lampe de chevet moderne à intensité variable avec commande tactile. Éclairage LED doux et base métallique. Parfaite pour la chambre ou le bureau.',
    26.99,
    'Amazon Basics',
    'Chambre',
    'https://m.media-amazon.com/images/I/51JDAbE6ZvL._AC_UF894,1000_QL80_.jpg',
    581,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Tapis de bain antidérapant - Microfibre gris',
    'Tapis de bain doux et absorbant en microfibre avec dessous antidérapant. Coloris gris neutre, parfait pour ajouter confort et sécurité à la salle de bain.',
    18.99,
    'Amazon Basics',
    'Salle de bain',
    'https://i5.walmartimages.com/asr/3fc96228-95fe-48df-817c-6a2319b71381.6ccce0b168b0590382d62f752c354505.jpeg?odnHeight=2000&odnWidth=2000&odnBg=FFFFFF',
    741,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Porte-serviettes mural - Métal noir',
    'Porte-serviettes mural au design moderne en métal noir. Idéal pour suspendre plusieurs serviettes dans une salle de bain ou une buanderie.',
    22.99,
    'Amazon Basics',
    'Salle de bain',
    'https://m.media-amazon.com/images/I/61bcpc5suaL._AC_UF894,1000_QL80_.jpg',
    581,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Parure de lit 3 pièces - Motif géométrique gris et blanc',
    'Ensemble de literie comprenant une housse de couette et deux taies d’oreiller. Design géométrique moderne, tissu doux et respirant. Taille standard pour lit double.',
    36.90,
    'Amazon Basics',
    'Chambre',
    'https://m.media-amazon.com/images/I/71jSA2Qvr6L._AC_SX679_.jpg',
    471,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Support ordinateur portable - Réglable en aluminium',
    'Support ergonomique pour ordinateur portable, inclinable et pliable. Conception en aluminium robuste avec système de ventilation intégré. Idéal pour le bureau ou la maison.',
    27.99,
    'Amazon Basics',
    'Bureau',
    'https://m.media-amazon.com/images/I/71cOnHXOg9L.__AC_SY300_SX300_QL70_ML2_.jpg',
    471,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Organisateur de tiroir extensible - Bambou',
    'Organisateur de tiroir en bambou naturel, extensible pour s’adapter à différentes tailles de tiroirs. Idéal pour les ustensiles, accessoires ou fournitures de bureau.',
    25.99,
    'Amazon Basics',
    'Cuisine',
    'https://www.bacpanier.ca/cdn/shop/files/tiroir_organis_en_bambou.png?v=1741888830&width=3000',
    851,
    10
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Set de 6 verres à eau - Verre transparent',
    'Lot de 6 verres à eau au design épuré, en verre transparent. Parfaits pour un usage quotidien à la maison ou pour recevoir des invités.',
    19.99,
    'Amazon Basics',
    'Salle à manger',
    'https://cdn.laredoute.com/cdn-cgi/image/width=500,height=500,fit=pad,dpr=1/products/1/3/d/13dbdc64ae4fed4bf5a51f655601ff40.jpg',
    471,
    11
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Ensemble de 2 coussins décoratifs - Velours bleu',
    'Lot de 2 coussins décoratifs carrés avec housses en velours bleu doux. Idéals pour canapé, lit ou fauteuil, ajoutant une touche de couleur et de confort.',
    21.99,
    'Amazon Basics',
    'Salon',
    'https://m.media-amazon.com/images/I/81pd7BwDinL.__AC_SX300_SY300_QL70_ML2_.jpg',
    471,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Étagère murale flottante - Bois noir',
    'Étagère murale au design minimaliste en bois noir. Idéale pour exposer des objets décoratifs, livres ou plantes dans un salon, une chambre ou un bureau.',
    17.99,
    'Amazon Basics',
    'Rangement',
    'https://m.media-amazon.com/images/I/61eVfhMWcaL._AC_SL1294_.jpg',
    471,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Canapé 3 places - Tissu gris clair',
    'Canapé moderne 3 places avec revêtement en tissu gris clair. Assise confortable et accoudoirs larges. Parfait pour un salon contemporain.',
    499.00,
    'Vente-Unique',
    'Salon',
    'https://pictureserver.net/pic_storage/pic/e2/11/undef_src_sa_picid_920542_x_1800_type_whitesh_image.jpg?ver=6',
    151,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Canapé d’angle convertible - Gris clair avec coffre',
    'Canapé d’angle spacieux en tissu gris clair, convertible en lit avec coffre de rangement intégré. Confort optimal et design fonctionnel pour grand salon.',
    749.00,
    'Vente-Unique',
    'Salon',
    'https://cdn1.vente-unique.com/thumbnails/product/436/436887/product_raw/xs/canape_28718881.jpg',
    18,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Fauteuil bouclette - Blanc cassé',
    'Fauteuil au revêtement en tissu bouclette blanc cassé. Design cosy et tendance avec assise enveloppante, idéal pour un salon ou une chambre cocooning.',
    229.00,
    'Vente-Unique',
    'Salon',
    'https://imagescdn.simons.ca/images/20411-23201232-11-A1_2/le-fauteuil-bouclette-sur-cadre-de-bois.jpg?__=3',
    15,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble TV style industriel - Bois et métal noir',
    'Meuble TV bas avec structure en métal noir et panneaux effet bois. Design industriel moderne, doté de niches et placards pour un rangement optimal.',
    189.00,
    'Vente-Unique',
    'Salon',
    'https://cdn1.vente-unique.com/thumbnails/product/624/624113/gallery_slider/xl/meuble-tv_26578849.webp',
    187,
    17
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table basse ronde - Bois clair et métal noir',
    'Table basse au design industriel avec plateau en bois clair et piètement en métal noir croisé. Élégante et pratique pour compléter un salon moderne.',
    139.00,
    'Vente-Unique',
    'Salon',
    'https://www.miliboo.com/table-basse-ronde-bois-clair-chene-et-metal-noir-d80-cm-lace-44030-5bb374d74551f_1200_800_0.jpg',
    158,
    18
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Table basse rectangulaire - Bois et métal avec rangements',
    'Table basse rectangulaire au style industriel, avec plateau en bois et structure métallique noire. Équipée de rangements ouverts pour une organisation pratique du salon.',
    159.00,
    'Vente-Unique',
    'Salon',
    'https://cdn1.vente-unique.com/thumbnails/product/2694/2694097/gallery_slider/xl/table-basse_37808059.webp',
    185,
    16
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble de cuisine bas - Portes et tiroirs',
    'Meuble de cuisine bas avec portes et tiroirs, idéal pour optimiser le rangement des ustensiles, épices et accessoires de cuisine. Design moderne et pratique.',
    159.00,
    'Vente-Unique',
    'Cuisine',
    'https://cdn1.vente-unique.com/thumbnails/product/3433/3433855/gallery_slider/xl/meuble-de-cuisine_250311112658_46310714.webp',
    185,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Moulin à poivre - Bois et métal',
    'Moulin à poivre élégant en bois avec mécanisme en métal. Design simple et fonctionnel, parfait pour la cuisine ou la table.',
    19.99,
    'Vente-Unique',
    'Cuisine',
    'https://m.media-amazon.com/images/I/71Meic-ZNSL._AC_UF1000,1000_QL80_.jpg',
    174,
    15
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Panier de rangement cuisine - Métal',
    'Panier de rangement pratique en métal, idéal pour organiser les accessoires de cuisine, les épices ou les ustensiles. Design moderne et robuste.',
    12.99,
    'Vente-Unique',
    'Cuisine',
    'https://m.media-amazon.com/images/I/71AnkSNY8iL._AC_UF1000,1000_QL80_.jpg',
    851,
    14
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Couteau de cuisine professionnel - Manche ergonomique',
    'Couteau de cuisine professionnel avec lame en acier inoxydable et manche ergonomique pour une prise en main confortable. Idéal pour une utilisation quotidienne.',
    29.99,
    'Vente-Unique',
    'Cuisine',
    'https://m.media-amazon.com/images/I/71ti69NenUL._AC_UF1000,1000_QL80_.jpg',
    158,
    13
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Moulin à sel - Bois et métal',
    'Moulin à sel élégant avec corps en bois et mécanisme en métal. Design simple et fonctionnel, parfait pour assaisonner vos plats à table.',
    18.99,
    'Vente-Unique',
    'Cuisine',
    'https://medias.maisonsdumonde.com/images/ar_1:1,c_pad,f_auto,q_auto,w_732/v1/mkp/M24176343_1/moulin-a-sel-et-poivre-electrique-inox-bambou.jpg',
    158,
    13
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Presse-agrumes manuel - Métal',
    'Presse-agrumes manuel en métal robuste. Idéal pour extraire facilement le jus des citrons, oranges et autres agrumes avec peu d\'effort.',
    22.99,
    'Vente-Unique',
    'Cuisine',
    'https://m.media-amazon.com/images/I/71zzToynSlL._AC_UF894,1000_QL80_.jpg',
    174,
    12
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Matelas mousse à mémoire de forme',
    'Matelas en mousse à mémoire de forme offrant un confort optimal et un soutien adapté à toutes les positions de sommeil. Idéal pour améliorer la qualité du sommeil.',
    299.00,
    'Vente-Unique',
    'Chambre',
    'https://cdn1.vente-unique.com/thumbnails/product/69/69675/product_raw/xs/matelas_250123021604_44409834.jpg',
    147,
    11
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble vasque - Bois et plan de travail en pierre',
    'Meuble vasque moderne avec structure en bois et plan de travail en pierre. Équipé d\'un lavabo intégré et d\'un rangement sous vasque. Idéal pour la salle de bain.',
    499.00,
    'Vente-Unique',
    'Salle de bain',
    'https://cdn1.vente-unique.com/thumbnails/product/2420/2420011/gallery_slider/xl/meuble-vasque_30434085.webp',
    18,
    9
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble vasque - Bois et blanc avec miroir',
    'Meuble vasque avec une structure en bois clair et blanc, accompagné d\'un miroir. Design élégant et pratique, parfait pour la salle de bain moderne.',
    359.00,
    'Vente-Unique',
    'Salle de bain',
    'https://cdn1.vente-unique.com/thumbnails/product/3885/3885942/gallery_slider/xl/meuble-vasque_250224112940_45541826.webp',
    177,
    8
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Meuble vasque - Bois avec lavabo intégré',
    'Meuble vasque avec une structure en bois et un lavabo intégré. Design moderne et pratique, parfait pour ajouter du style et de la fonctionnalité à la salle de bain.',
    299.00,
    'Vente-Unique',
    'Salle de bain',
    'https://cdn1.masalledebain.com/344398-thickbox/meuble-suspendu-salle-de-bain-meuble-vasque-bois-chene.jpg',
    114,
    7
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Porte-serviettes mural - Métal chromé',
    'Porte-serviettes mural moderne en métal chromé, parfait pour suspendre vos serviettes de manière pratique et esthétique dans la salle de bain.',
    19.99,
    'Vente-Unique',
    'Salle de bain',
    'https://m.media-amazon.com/images/I/71sLklgU27L._AC_UF894,1000_QL80_.jpg',
    185,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Baignoire en acrylic - Blanc',
    'Baignoire moderne en acrylic blanc, offrant un confort optimal pour un bain relaxant. Design élégant et épuré, idéale pour toute salle de bain.',
    399.00,
    'Vente-Unique',
    'Salle de bain',
    'https://cdn1.vente-unique.com/thumbnails/product/895/895177/product_raw/xs/baignoire_23197953.jpg',
    185,
    1
);
INSERT INTO HomeProducts (Name, Description, Price, Brand, Category, ImgURL, Quantity, Seller_Id)
VALUES (
    'Baignoire îlot en acrylic - Blanc',
    'Baignoire îlot moderne en acrylic blanc, design épuré et élégant. Parfaite pour une salle de bain spacieuse, offrant confort et relaxation.',
    699.00,
    'Vente-Unique',
    'Salle de bain',
    'https://cdn1.vente-unique.com/thumbnails/product/135/135475/product_raw/xs/baignoire_502141.jpg',
    10,
    2
);



-- Insertion pour la table Buys (achats)
INSERT INTO Buys (User_Id, HomeProduct_Id, PurchaseDate, Taxed_Price)
VALUES
(1, 3, '2025-04-15 10:00:00', 199.99),
(2, 5, '2025-04-15 10:05:00', 349.00),
(3, 10, '2025-04-15 10:10:00', 449.00),
(4, 7, '2025-04-15 10:15:00', 79.99),
(5, 2, '2025-04-15 10:20:00', 299.99),
(6, 1, '2025-04-15 10:25:00', 199.00),
(7, 8, '2025-04-15 10:30:00', 119.00),
(8, 6, '2025-04-15 10:35:00', 259.00),
(9, 4, '2025-04-15 10:40:00', 89.99),
(10, 11, '2025-04-15 10:45:00', 399.00),
(11, 12, '2025-04-15 10:50:00', 189.00),
(12, 9, '2025-04-15 10:55:00', 169.00),
(13, 13, '2025-04-15 11:00:00', 149.00),
(14, 14, '2025-04-15 11:05:00', 79.00),
(15, 15, '2025-04-15 11:10:00', 129.00),
(16, 16, '2025-04-15 11:15:00', 199.99),
(17, 17, '2025-04-15 11:20:00', 249.00),
(18, 18, '2025-04-15 11:25:00', 169.99),
(19, 19, '2025-04-15 11:30:00', 299.99),
(20, 20, '2025-04-15 11:35:00', 159.00);

-- Insertion pour la table Reviews (avis)
INSERT INTO Reviews (Comment, Rating, ReviewDate, Author_Id, HomeProduct_Id)
VALUES
('Très pratique et d excellente qualité', 5, '2025-04-15 10:00:00', 19, 15),
('Très satisfait, il répond à mes attentes.', 1, '2025-04-15 10:00:00', 13, 16),
('Produit qui correspond à la description mais l odeur est assez forte.', 3, '2025-04-15 10:00:00', 20, 1),
('Satisfait de mon achat, je vais le recommander.', 1, '2025-04-15 10:00:00', 5, 17),
('Produit qui correspond à la description mais l odeur est assez forte.', 5, '2025-04-15 10:00:00', 4, 13),
('Produit de bonne qualité mais un peu trop lourd.', 2, '2025-04-15 10:00:00', 13, 6),
('Excellente qualité, livraison rapide.', 3, '2025-04-15 10:00:00', 9, 4),
('Le produit fonctionne très bien, mais j ai eu des problèmes avec l emballage.', 5, '2025-04-15 10:00:00', 1, 16),
('Bien mais il manque quelques améliorations.', 3, '2025-04-15 10:00:00', 12, 17),
('Produit très bon, je recommande sans hésiter.', 3, '2025-04-15 10:00:00', 4, 15),
('Agréablement surpris par la qualité.', 1, '2025-04-15 10:00:00', 19, 2),
('Produit conforme à mes attentes, mais la livraison était un peu longue.', 2, '2025-04-15 10:00:00', 8, 16),
('Excellente qualité, livraison rapide.', 2, '2025-04-15 10:00:00', 9, 15),
('Produit conforme, rien à redire.', 3, '2025-04-15 10:00:00', 6, 13),
('Le produit fonctionne très bien, mais j ai eu des problèmes avec l emballage.', 2, '2025-04-15 10:00:00', 9, 13),
('Bonne qualité, mais l assemblage n était pas facile.', 1, '2025-04-15 10:00:00', 16, 10),
('Bonne qualité, mais l assemblage n était pas facile.', 5, '2025-04-15 10:00:00', 15, 10),
('Le produit est un peu fragile mais ça reste correct.', 2, '2025-04-15 10:00:00', 8, 20),
('Bon produit, mais pas assez de fonctionnalités.', 5, '2025-04-15 10:00:00', 11, 2),
('Produit conforme, mais l assemblage est assez difficile.', 4, '2025-04-15 10:00:00', 12, 8),
('Produit agréable, mais je pense qu il peut être amélioré.', 2, '2025-04-15 10:00:00', 2, 7),
('Excellente qualité, rien à dire.', 2, '2025-04-15 10:00:00', 4, 3),
('J aurais aimé plus de choix de couleurs.', 2, '2025-04-15 10:00:00', 4, 10),
('Produit conforme, rien à redire.', 1, '2025-04-15 10:00:00', 18, 10),
('Très bon achat, je suis satisfait.', 1, '2025-04-15 10:00:00', 13, 15),
('Produit efficace mais un peu bruyant.', 5, '2025-04-15 10:00:00', 20, 10),
('Produit décevant, pas comme sur la photo.', 2, '2025-04-15 10:00:00', 9, 5),
('Produit qui correspond à la description mais l odeur est assez forte.', 2, '2025-04-15 10:00:00', 1, 7),
('Très bon rapport qualité/prix.', 2, '2025-04-15 10:00:00', 16, 10),
('Très satisfait du produit, je vais en acheter un autre.', 1, '2025-04-15 10:00:00', 4, 11),
('Produit très pratique et bien conçu.', 1, '2025-04-15 10:00:00', 9, 14),
('Très satisfait, le produit est de qualité.', 2, '2025-04-15 10:00:00', 1, 2),
('Très bonne qualité, livraison rapide.', 4, '2025-04-15 10:00:00', 19, 7),
('Bonne qualité, mais l assemblage n était pas facile.', 5, '2025-04-15 10:00:00', 15, 10),
('Bien mais il manque quelques améliorations.', 4, '2025-04-15 10:00:00', 11, 14),
('Qualité médiocre, je ne recommande pas.', 5, '2025-04-15 10:00:00', 8, 20),
('Très bonne qualité, mais il manque quelques accessoires.', 4, '2025-04-15 10:00:00', 5, 3),
('Très bien mais un peu plus grand que prévu.', 2, '2025-04-15 10:00:00', 6, 19),
('Très bon achat, je suis satisfait.', 2, '2025-04-15 10:00:00', 13, 11),
('Le produit est bien mais la livraison a pris trop de temps.', 2, '2025-04-15 10:00:00', 16, 11),
('Le produit est un peu fragile mais ça reste correct.', 5, '2025-04-15 10:00:00', 13, 19),
('Bonne qualité, conforme à la description.', 2, '2025-04-15 10:00:00', 15, 6),
('Bon produit, mais pas assez de fonctionnalités.', 4, '2025-04-15 10:00:00', 18, 4),
('Le produit est correct, mais un peu cher.', 4, '2025-04-15 10:00:00', 4, 13),
('Produit satisfaisant, mais les instructions de montage sont peu claires.', 5, '2025-04-15 10:00:00', 5, 17),
('Produit très pratique, mais je trouve qu il manque quelques fonctionnalités.', 1, '2025-04-15 10:00:00', 2, 7),
('Très bon produit, facile à utiliser.', 4, '2025-04-15 10:00:00', 7, 3),
('Produit de qualité, mais j aurais aimé un prix un peu plus bas.', 3, '2025-04-15 10:00:00', 15, 10),
('Très beau produit, facile à installer.', 3, '2025-04-15 10:00:00', 1, 8),
('Je suis content du produit mais il est un peu plus grand que ce à quoi je m attendais.', 4, '2025-04-15 10:00:00', 2, 2),
('Bonne qualité, conforme à la description.', 2, '2025-04-15 10:00:00', 8, 8),
('Très bon rapport qualité/prix.', 1, '2025-04-15 10:00:00', 1, 5),
('Produit de bonne qualité, mais la livraison était un peu lente.', 1, '2025-04-15 10:00:00', 4, 8),
('Très bon produit, facile à utiliser.', 4, '2025-04-15 10:00:00', 13, 8),
('Satisfait de mon achat, je vais le recommander.', 4, '2025-04-15 10:00:00', 4, 12),
('Produit très bon, je recommande sans hésiter.', 2, '2025-04-15 10:00:00', 6, 5),
('Le produit est de bonne qualité, je recommande.', 1, '2025-04-15 10:00:00', 16, 18),
('Produit pratique mais la finition est à revoir.', 5, '2025-04-15 10:00:00', 6, 20),
('Produit solide et pratique, je suis satisfait.', 1, '2025-04-15 10:00:00', 13, 14),
('Excellente qualité, livraison rapide.', 1, '2025-04-15 10:00:00', 19, 10),
('Produit de qualité, mais j aurais aimé un prix un peu plus bas.', 4, '2025-04-15 10:00:00', 1, 12),
('Très bon achat, je suis satisfait.', 2, '2025-04-15 10:00:00', 11, 18),
('Produit décevant, pas comme sur la photo.', 4, '2025-04-15 10:00:00', 12, 6),
('Très content de mon achat, facile à assembler.', 5, '2025-04-15 10:00:00', 9, 7),
('Le montage était difficile, mais le produit est de bonne qualité.', 2, '2025-04-15 10:00:00', 16, 6),
('Produit de bonne qualité, mais la livraison était un peu lente.', 2, '2025-04-15 10:00:00', 17, 4),
('Pas mal, mais je m attendais à mieux.', 1, '2025-04-15 10:00:00', 16, 5),
('Livraison rapide, produit conforme.', 3, '2025-04-15 10:00:00', 8, 15),
('Le produit est exactement ce que je cherchais.', 4, '2025-04-15 10:00:00', 8, 13),
('Le produit est de bonne qualité, je recommande.', 4, '2025-04-15 10:00:00', 15, 1),
('Bonne qualité, conforme à la description.', 3, '2025-04-15 10:00:00', 20, 20),
('Excellente qualité, livraison rapide.', 4, '2025-04-15 10:00:00', 12, 9),
('Produit conforme, rien à redire.', 1, '2025-04-15 10:00:00', 19, 15),
('Produit satisfaisant, mais les instructions de montage sont peu claires.', 1, '2025-04-15 10:00:00', 18, 16),
('Bien mais il manque quelques améliorations.', 5, '2025-04-15 10:00:00', 6, 5),
('Très satisfait, le produit est de qualité.', 4, '2025-04-15 10:00:00', 9, 17),
('Produit qui correspond à la description mais l odeur est assez forte.', 3, '2025-04-15 10:00:00', 1, 19),
('Produit de qualité, mais j aurais aimé un prix un peu plus bas.', 4, '2025-04-15 10:00:00', 7, 19),
('Agréablement surpris par la qualité.', 2, '2025-04-15 10:00:00', 17, 15),
('Produit facile à utiliser et bien conçu.', 1, '2025-04-15 10:00:00', 14, 14),
('Excellente qualité, livraison rapide.', 1, '2025-04-15 10:00:00', 5, 2),
('Très content de mon achat, facile à assembler.', 3, '2025-04-15 10:00:00', 10, 12),
('Bon produit, mais je trouve que le prix est élevé.', 1, '2025-04-15 10:00:00', 2, 18),
('Le produit est un peu fragile mais ça reste correct.', 1, '2025-04-15 10:00:00', 3, 17),
('Un produit solide et pratique.', 5, '2025-04-15 10:00:00', 19, 2),
('Agréablement surpris par la qualité.', 2, '2025-04-15 10:00:00', 3, 18),
('Produit robuste, mais les instructions de montage sont peu claires.', 5, '2025-04-15 10:00:00', 2, 16),
('Un excellent produit, je suis ravi de mon achat.', 5, '2025-04-15 10:00:00', 13, 18),
('Produit robuste, mais les instructions de montage sont peu claires.', 4, '2025-04-15 10:00:00', 14, 10),
('Très bon produit, facile à utiliser.', 4, '2025-04-15 10:00:00', 16, 19),
('Produit satisfaisant, mais les instructions de montage sont peu claires.', 4, '2025-04-15 10:00:00', 2, 8),
('Produit très joli, mais le confort pourrait être amélioré.', 3, '2025-04-15 10:00:00', 10, 16),
('Produit intéressant, mais j aurais aimé plus de fonctionnalités.', 4, '2025-04-15 10:00:00', 15, 19),
('Bon produit dans l ensemble.', 4, '2025-04-15 10:00:00', 9, 2),
('Très bonne qualité, mais il manque quelques accessoires.', 4, '2025-04-15 10:00:00', 11, 11),
('Produit décevant, pas comme sur la photo.', 4, '2025-04-15 10:00:00', 1, 7),
('Très bonne qualité, livraison rapide.', 1, '2025-04-15 10:00:00', 9, 13),
('Produit très pratique, mais je trouve qu il manque quelques fonctionnalités.', 1, '2025-04-15 10:00:00', 13, 19),
('J aurais aimé plus de choix de couleurs.', 1, '2025-04-15 10:00:00', 2, 1),
('Bon produit dans l ensemble.', 5, '2025-04-15 10:00:00', 14, 9),