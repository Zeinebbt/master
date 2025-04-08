from backend.config import get_db_connection

class HomeProductRepository:

    def get_all(self):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM HomeProducts")
        results = cursor.fetchall()
        cursor.close()
        conn.close()
        return results

    def get_by_id(self, product_id):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM HomeProducts WHERE homeproduct_id = %s", (product_id,))
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result

    def create(self, product):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        INSERT INTO HomeProducts (name, description, price, brand, material, room, category, image_url, seller_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        values = (
            product['name'], product['description'], product['price'], product['brand'],
            product['material'], product['room'], product['category'], product['image_url'],
            product['seller_id']
        )
        cursor.execute(sql, values)
        conn.commit()
        new_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return new_id

    def update(self, product_id, product):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        UPDATE HomeProducts SET
            name = %s,
            description = %s,
            price = %s,
            brand = %s,
            material = %s,
            room = %s,
            category = %s,
            image_url = %s,
            seller_id = %s
        WHERE homeproduct_id = %s
        """
        values = (
            product['name'], product['description'], product['price'], product['brand'],
            product['material'], product['room'], product['category'], product['image_url'], product['seller_id'], product_id
        )
        cursor.execute(sql, values)
        conn.commit()
        cursor.close()
        conn.close()

    def delete(self, product_id):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM HomeProducts WHERE homeproduct_id = %s", (product_id,))
        conn.commit()
        cursor.close()
        conn.close()
