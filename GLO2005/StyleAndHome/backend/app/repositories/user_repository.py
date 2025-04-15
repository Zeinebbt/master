from app.repositories import wallet_repository
from config import get_db_connection


def get_all_users(limit=-1, search=""):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    if search:
        search = f"%{search}%"
        query = "SELECT User_Id, Username, Email, Birthdate, CreatedAt FROM Users WHERE Username LIKE %s"
        params = (search,)
    else:
        query = "SELECT User_Id, Username, Email, Birthdate, CreatedAt FROM Users"
        params = ()

    if limit != -1:
        query += " LIMIT %s"
        params += (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def get_user_by_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Users WHERE User_Id = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    return user

def get_user_by_username(username):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Users WHERE Username = %s", (username,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    return user

def get_user_by_email(email):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
    user = cursor.fetchone()
    cursor.close()
    return user


def create_user(email, username, password_hash, birthdate):
    conn = get_db_connection()
    try:
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO Users (Email, Username, PasswordHash, Birthdate)
            VALUES (%s, %s, %s, %s)
        """, (email, username, password_hash, birthdate))

        conn.commit()

        user_id = cursor.lastrowid

        return user_id

    except Exception as e:
        conn.rollback()
        raise e

    finally:
        cursor.close()
        conn.close()


def update_user(user_id, email, username, password_hash, birthdate):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
        UPDATE Users
        SET Email = %s,
            Username = %s,
            PasswordHash = %s,
            Birthdate = %s
        WHERE User_Id = %s
    """
    cursor.execute(query, (email, username, password_hash, birthdate, user_id))
    conn.commit()
    cursor.close()
    conn.close()


def delete_user(user_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Users WHERE User_Id = %s", (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
