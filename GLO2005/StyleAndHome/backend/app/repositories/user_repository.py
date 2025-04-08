from backend.config import get_db_connection

class UserRepository:

    def get_all_users(self):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT user_id, username, email, birthdate, balance FROM Users")
        users = cursor.fetchall()
        cursor.close()
        conn.close()
        return users

    def get_by_id(self, user_id):
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Users WHERE user_id = %s", (user_id,))
        user = cursor.fetchone()
        cursor.close()
        connection.close()
        return user

    def create(self, user):
        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "INSERT INTO Users (email, username, password_hash, birthdate, balance) VALUES (%s, %s, %s, %s, %s)"
        values = (user['email'], user['username'], user['password_hash'], user['birthdate'], user['balance'])
        cursor.execute(sql, values)
        connection.commit()
        user_id = cursor.lastrowid
        cursor.close()
        connection.close()
        return user_id

    def update(self, user_id, user):
        connection = get_db_connection()
        cursor = connection.cursor()
        sql = "UPDATE Users SET email=%s, username=%s, password_hash=%s, birthdate=%s, balance=%s WHERE user_id=%s"
        values = (user['email'], user['username'], user['password_hash'], user['birthdate'], user['balance'], user_id)
        cursor.execute(sql, values)
        connection.commit()
        cursor.close()
        connection.close()

    def delete(self, user_id):
        connection = get_db_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM Users WHERE user_id = %s", (user_id,))
        connection.commit()
        cursor.close()
        connection.close()
