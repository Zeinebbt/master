from config import get_db_connection

def get_all_homeproducts(limit=-1, search="", brand="", category="", max_price=None, in_stock=False):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT 
        hp.homeproduct_id,
        hp.name,
        hp.description,
        hp.price,
        hp.brand,
        hp.category,
        hp.ImgURL,
        hp.quantity,
        hp.seller_id,
        ROUND(AVG(r.rating), 1) AS average_rating,
        GROUP_CONCAT(r.comment SEPARATOR '||') AS comments
    FROM HomeProducts hp
    LEFT JOIN Reviews r ON hp.homeproduct_id = r.homeproduct_id
    WHERE 1=1
    """

    params = ()

    if search:
        query += " AND hp.name LIKE %s"
        params += (f"%{search}%",)

    if brand:
        query += " AND hp.brand = %s"
        params += (brand,)

    if category:
        query += " AND hp.category = %s"
        params += (category,)

    if max_price:
        query += " AND hp.price <= %s"
        params += (max_price,)

    if in_stock:
        query += " AND hp.quantity > 0"

    query += " GROUP BY hp.homeproduct_id"

    if limit != -1:
        query += " LIMIT %s"
        params += (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()

    # Traitement des commentaires (séparateur ||)
    for article in results:
        article["commentaires"] = article["comments"].split("||") if article.get("comments") else []

    cursor.close()
    conn.close()
    return results


def get_homeproduct_by_id(homeproduct_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT 
        hp.*, 
        ROUND(AVG(r.rating), 1) AS average_rating,
        GROUP_CONCAT(r.comment SEPARATOR '||') AS comments
    FROM HomeProducts hp
    LEFT JOIN Reviews r ON hp.homeproduct_id = r.homeproduct_id
    WHERE hp.homeproduct_id = %s
    GROUP BY hp.homeproduct_id
    """

    cursor.execute(query, (homeproduct_id,))
    product = cursor.fetchone()
    if product:
        product["commentaires"] = product["comments"].split("||") if product.get("comments") else []
    cursor.close()
    conn.close()
    return product


def get_homeproducts_by_seller(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM HomeProducts WHERE Seller_Id = %s"
    cursor.execute(query, (user_id,))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results


def create_homeproduct(data):
    conn = get_db_connection()
    cursor = conn.cursor()

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
        data["image_url"],
        data["quantity"],
        data["seller_id"]
    )
    cursor.execute(query, values)
    conn.commit()
    product_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return product_id


def update_homeproduct(product_id, data):
    conn = get_db_connection()
    cursor = conn.cursor()

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
    conn.close()


def delete_homeproduct(product_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM HomeProducts WHERE homeproduct_id=%s", (product_id,))
    conn.commit()
    cursor.close()
    conn.close()
