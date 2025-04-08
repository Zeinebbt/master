# app/repositories/clothing_repository.py
from backend.config import get_db_connection

class ClothingRepository:

    def get_all(self):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Clothing")
        clothing = cursor.fetchall()
        cursor.close()
        conn.close()
        return clothing

    def get_by_id(self, clothing_id):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Clothing WHERE clothing_id = %s", (clothing_id,))
        clothing = cursor.fetchone()
        cursor.close()
        conn.close()
        return clothing

    def create(self, clothing):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = '''INSERT INTO Clothing 
                 (name, description, price, brand, color, size, gender, category, image_url, seller_id)
                 VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'''
        values = (
            clothing['name'], clothing['description'], clothing['price'], clothing['brand'],
            clothing['color'], clothing['size'], clothing['gender'], clothing['category'],
            clothing['image_url'], clothing['seller_id']
        )
        cursor.execute(sql, values)
        conn.commit()
        clothing_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return clothing_id

    def update(self, clothing_id, clothing):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = '''UPDATE Clothing SET name=%s, description=%s, price=%s, brand=%s, color=%s, 
                 size=%s, gender=%s, category=%s, image_url=%s, seller_id=%s 
                 WHERE clothing_id=%s'''
        values = (
            clothing['name'], clothing['description'], clothing['price'], clothing['brand'],
            clothing['color'], clothing['size'], clothing['gender'], clothing['category'],
            clothing['image_url'], clothing['seller_id'], clothing_id
        )
        cursor.execute(sql, values)
        conn.commit()
        cursor.close()
        conn.close()

    def delete(self, clothing_id):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Clothing WHERE clothing_id = %s", (clothing_id,))
        conn.commit()
        cursor.close()
        conn.close()
