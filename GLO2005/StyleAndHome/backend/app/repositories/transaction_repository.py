from config import get_db_connection

# Obtenir toutes les transactions (limite facultative)
def get_all_transactions(limit=-1):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT transaction_id, buyer_id, seller_id, total AS total_price, date AS created_at
    FROM Transactions
    ORDER BY date DESC
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
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT transaction_id, buyer_id, seller_id, total AS total_price, date AS created_at
    FROM Transactions
    WHERE buyer_id = %s OR seller_id = %s
    ORDER BY date DESC
    """
    cursor.execute(query, (user_id, user_id))
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

# Créer une nouvelle transaction
def create_transaction(transaction):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    INSERT INTO Transactions (buyer_id, seller_id, total)
    VALUES (%s, %s, %s)
    """
    values = (
        transaction["buyer_id"],
        transaction["seller_id"],
        transaction["total"]  # <-- clé corrigée
    )
    cursor.execute(query, values)
    conn.commit()
    transaction_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return transaction_id

# Annuler la transaction en mettant son status à 'cancelled'
def cancel_transaction(transaction_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "UPDATE Transactions SET status = 'cancelled' WHERE transaction_id = %s"
    cursor.execute(query, (transaction_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return True
