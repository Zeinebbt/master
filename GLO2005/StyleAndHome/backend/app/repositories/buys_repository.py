from config import get_db_connection
from app.repositories import user_repository, homeproduct_repository


def get_all_buys():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT buys_id, user_id, homeproduct_id, taxed_price, purchasedate
        FROM Buys
        ORDER BY purchasedate DESC
    """)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results


def get_buys_by_user(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("""
        SELECT buys_id, user_id, homeproduct_id, taxed_price, purchasedate
        FROM Buys
        WHERE user_id = %s
        ORDER BY purchasedate DESC
    """, (user_id,))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results


def create_buy(buy):
    # Sécurité : vérifier si l'user et le produit existent (optionnel)
    if not user_repository.get_user_by_id(buy["user_id"]):
        raise Exception("Utilisateur non trouvé.")

    if not homeproduct_repository.get_homeproduct_by_id(buy["homeproduct_id"]):
        raise Exception("Produit non trouvé.")

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
