from ...config import get_db_connection

def get_all_clothing(limit=-1, research=""):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if research == "":
        query = "SELECT * FROM Clothing"
    else:
        safe_research = research.replace("'", "''")
        query = f"SELECT * FROM Clothing WHERE name LIKE '%{safe_research}%'"

    if limit != -1:
        query += f" LIMIT {limit}"

    cursor.execute(query)
    result = cursor.fetchall()

    cursor.close()
    conn.close()

    return result


def get_clothing_by_id(clothing_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Clothing WHERE clothing_id = %s", (clothing_id,))
    clothing = cursor.fetchone()
    cursor.close()
    conn.close()
    return clothing


def insert_clothing(data):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
        INSERT INTO Clothing (name, description, price, brand, color, size, gender, category, image_url, seller_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """
    values = (
        data["name"], data["description"], data["price"], data["brand"], data["color"],
        data["size"], data["gender"], data["category"], data["image_url"], data["seller_id"]
    )
    cursor.execute(query, values)
    conn.commit()
    clothing_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return clothing_id


def delete_clothing(clothing_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Clothing WHERE clothing_id = %s", (clothing_id,))
    conn.commit()
    cursor.close()
    conn.close()
