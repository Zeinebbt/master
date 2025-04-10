from config import get_db_connection

conn = get_db_connection()

# Obtenir tous les utilisateurs avec une limite et une recherche
def get_all_users(limit=-1, search=""):
    cursor = conn.cursor(dictionary=True)

    if search:
        search = f"%{search}%"
        query = "SELECT user_id, username, email, birthdate, balance FROM Users WHERE username LIKE %s"
        params = (search,)
    else:
        query = "SELECT user_id, username, email, birthdate, balance FROM Users"
        params = ()

    if limit != -1:
        query += " LIMIT %s"
        params += (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()

    cursor.close()
    conn.close()
    return results

# Rechercher un utilisateur par son ID
def get_user_by_id(user_id):
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM Users WHERE user_id = %s", (user_id,))
    user = cursor.fetchone()

    cursor.close()
    conn.close()
    return user

# Créer un utilisateur
def create_user(email, username, password_hash, birthdate):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO Users (email, username, password_hash, birthdate)
        VALUES (%s, %s, %s, %s)
    """, (email, username, password_hash, birthdate))
    conn.commit()
    cursor.close()
    conn.close()

# Mettre à jour un utilisateur
def update_user(user_id, email, username, password_hash, birthdate, balance=0.00):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
        UPDATE Users
        SET email = %s,
            username = %s,
            password_hash = %s,
            birthdate = %s,
            balance = %s
        WHERE user_id = %s
    """
    cursor.execute(query, (email, username, password_hash, birthdate, balance, user_id))
    conn.commit()
    cursor.close()
    conn.close()

# Supprimer un utilisateur
def delete_user(user_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    query = "DELETE FROM Users WHERE user_id = %s"
    cursor.execute(query, (user_id,))
    connection.commit()
    cursor.close()
    connection.close()
