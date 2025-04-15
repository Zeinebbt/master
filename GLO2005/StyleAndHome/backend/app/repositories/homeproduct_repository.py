from config import get_db_connection

conn = get_db_connection()

# Obtenir tous les produits avec filtres
def get_all_homeproducts(limit=-1, search="", brand="", category="", max_price=None, in_stock=False):
    cursor = conn.cursor(dictionary=True)
    print("Connected to the database.")
    query = """
    SELECT homeproduct_id, name, description, price, brand, category, ImgURL, quantity, seller_id
    FROM HomeProducts WHERE 1=1
    """

    params = ()

    if search:
        query += " AND name LIKE %s"
        params += (f"%{search}%",)

    if brand:
        query += " AND brand = %s"
        params += (brand,)

    if category:
        query += " AND category = %s"
        params += (category,)

    if max_price:
        query += " AND price <= %s"
        params += (max_price,)

    if in_stock:
        query += " AND quantity > 0"

    if limit != -1:
        query += " LIMIT %s"
        params += (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    return results

def get_homeproduct_by_id(homeproduct_id):
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM HomeProducts WHERE homeproduct_id = %s", (homeproduct_id,))
    product = cursor.fetchone()
    cursor.close()
    return product

def get_homeproducts_by_seller(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM HomeProducts WHERE Seller_Id = %s", (user_id,))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results


def create_homeproduct(data):
    cursor = conn.cursor()

    # Vérification des valeurs importantes
    if data["price"] < 0 or data["quantity"] < 0:
        raise Exception("Price and Quantity must be non-negative values.")

    query = """
    INSERT INTO HomeProducts (name, description, price, brand, category, ImgURL, quantity, seller_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        data["name"],
        data["description"],
        data["price"],
        data["brand"],
        data["category"],
        data["image_url"],  # Côté code on laisse image_url mais dans SQL ça insère dans ImgURL
        data["quantity"],
        data["seller_id"]
    )
    cursor.execute(query, values)
    conn.commit()
    product_id = cursor.lastrowid
    cursor.close()
    return product_id


def update_homeproduct(product_id, data):
    cursor = conn.cursor()

    # Vérification des valeurs importantes
    if data["price"] < 0 or data["quantity"] < 0:
        raise Exception("Price and Quantity must be non-negative values.")

    query = """
    UPDATE HomeProducts
    SET name=%s, description=%s, price=%s, brand=%s, category=%s, ImgURL=%s, quantity=%s, seller_id=%s
    WHERE homeproduct_id=%s
    """
    values = (
        data["name"],
        data["description"],
        data["price"],
        data["brand"],
        data["category"],
        data["image_url"],
        data["quantity"],
        data["seller_id"],
        product_id
    )
    cursor.execute(query, values)
    conn.commit()
    cursor.close()


def delete_homeproduct(product_id):
    cursor = conn.cursor()
    cursor.execute("DELETE FROM HomeProducts WHERE homeproduct_id=%s", (product_id,))
    conn.commit()
    cursor.close()
