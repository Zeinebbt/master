from config import get_db_connection


def get_all_wallets():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Wallets")
    results = cursor.fetchall()
    cursor.close()
    return results

def get_wallet_by_user_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Wallets WHERE user_id = %s", (user_id,))
    result = cursor.fetchone()
    cursor.close()
    return result

def update_wallet_balance(user_id, new_balance):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "UPDATE Wallets SET solde = %s WHERE user_id = %s"
    cursor.execute(query, (new_balance, user_id))
    conn.commit()
    cursor.close()

def delete_wallet_by_user_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "DELETE FROM Wallets WHERE user_id = %s"
    cursor.execute(query, (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
