from config import get_db_connection


def get_all_buys():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT buys_id, user_id, homeproduct_id, taxed_price, purchasedate
    FROM Buys
    ORDER BY purchasedate DESC
    """
    cursor.execute(query)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def get_buys_by_user(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT buys_id, user_id, homeproduct_id, taxed_price, purchasedate
    FROM Buys
    WHERE user_id = %s
    ORDER BY purchasedate DESC
    """
    cursor.execute(query, (user_id,))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def create_buy(buy):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    INSERT INTO Buys (user_id, homeproduct_id, taxed_price)
    VALUES (%s, %s, %s)
    """
    values = (buy["user_id"], buy["homeproduct_id"], buy["taxed_price"])
    cursor.execute(query, values)
    conn.commit()
    buy_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return buy_id
