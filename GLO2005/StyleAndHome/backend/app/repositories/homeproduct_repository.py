from ...config import get_db_connection

# Obtenir tous les produits de maison avec une limite et une recherche
def get_all_homeproducts(limit=-1, search=""):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if search:
        search = f"%{search}%"
        query = """
        SELECT homeproduct_id, name, description, price, brand, category, image_url, seller_id
        FROM HomeProducts
        WHERE name LIKE %s
        """
        params = (search,)
    else:
        query = """
        SELECT homeproduct_id, name, description, price, brand, category, image_url, seller_id
        FROM HomeProducts
        """
        params = ()

    if limit != -1:
        query += " LIMIT %s"
        params += (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

# Obtenir un produit maison par son ID
def get_homeproduct_by_id(homeproduct_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM HomeProducts WHERE homeproduct_id = %s"
    cursor.execute(query, (homeproduct_id,))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

# Créer un produit de maison
def create_homeproduct(homeproduct):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    INSERT INTO HomeProducts (name, description, price, brand, category, image_url, seller_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        homeproduct["name"],
        homeproduct["description"],
        homeproduct["price"],
        homeproduct["brand"],
        homeproduct["category"],
        homeproduct["image_url"],
        homeproduct["seller_id"]
    )
    cursor.execute(query, values)
    conn.commit()
    homeproduct_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return homeproduct_id

# Mettre à jour un produit
def update_homeproduct(homeproduct_id, homeproduct):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    UPDATE HomeProducts
    SET name = %s, description = %s, price = %s, brand = %s, category = %s, image_url = %s, seller_id = %s
    WHERE homeproduct_id = %s
    """
    values = (
        homeproduct["name"],
        homeproduct["description"],
        homeproduct["price"],
        homeproduct["brand"],
        homeproduct["category"],
        homeproduct["image_url"],
        homeproduct["seller_id"],
        homeproduct_id
    )
    cursor.execute(query, values)
    conn.commit()
    cursor.close()
    conn.close()

# Supprimer un produit
def delete_homeproduct(homeproduct_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "DELETE FROM HomeProducts WHERE homeproduct_id = %s"
    cursor.execute(query, (homeproduct_id,))
    conn.commit()
    cursor.close()
    conn.close()
