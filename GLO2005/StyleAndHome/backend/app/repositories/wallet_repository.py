from config import get_db_connection

def get_all_wallets():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Wallets")
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def get_wallet_by_user_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Wallets WHERE User_Id = %s", (user_id,))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

def update_wallet_balance(user_id, new_balance):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("UPDATE Wallets SET Solde = %s WHERE User_Id = %s", (new_balance, user_id))
    conn.commit()
    cursor.close()
    conn.close()

def delete_wallet_by_user_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Wallets WHERE User_Id = %s", (user_id,))
    conn.commit()
    cursor.close()
    conn.close()

def insert_wallet(user_id, initial_balance=0.0):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO Wallets (User_Id, Solde) VALUES (%s, %s)", (user_id, initial_balance))
    conn.commit()
    cursor.close()
    conn.close()
