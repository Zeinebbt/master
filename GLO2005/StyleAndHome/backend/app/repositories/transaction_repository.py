from backend.config import get_db_connection

conn = get_db_connection()

# Obtenir toutes les transactions (limite facultative)
def get_all_transactions(limit=-1):
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT transaction_id, buyer_id, seller_id, total_price, created_at
    FROM Transactions
    ORDER BY created_at DESC
    """
    params = ()

    if limit != -1:
        query += " LIMIT %s"
        params = (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

# Obtenir les transactions d’un utilisateur (en tant qu’acheteur ou vendeur)
def get_transactions_by_user(user_id):
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT transaction_id, buyer_id, seller_id, total_price, created_at
    FROM Transactions
    WHERE buyer_id = %s OR seller_id = %s
    ORDER BY created_at DESC
    """
    cursor.execute(query, (user_id, user_id))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

# Créer une nouvelle transaction
def create_transaction(transaction):
    cursor = conn.cursor()
    query = """
    INSERT INTO Transactions (buyer_id, seller_id, total_price)
    VALUES (%s, %s, %s)
    """
    values = (
        transaction["buyer_id"],
        transaction["seller_id"],
        transaction["total_price"]
    )
    cursor.execute(query, values)
    conn.commit()
    transaction_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return transaction_id
