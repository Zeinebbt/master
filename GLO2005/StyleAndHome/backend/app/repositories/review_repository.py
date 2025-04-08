from backend.config import get_db_connection

class ReviewRepository:

    def get_all(self):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Reviews")
        reviews = cursor.fetchall()
        cursor.close()
        conn.close()
        return reviews

    def get_by_id(self, review_id):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Reviews WHERE review_id = %s", (review_id,))
        review = cursor.fetchone()
        cursor.close()
        conn.close()
        return review

    def create(self, review):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        INSERT INTO Reviews (author_id, target_clothing_id, target_homeproduct_id, target_seller_id, rating, comment, review_date)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        values = (
            review['author_id'], review.get('target_clothing_id'), review.get('target_homeproduct_id'),
            review.get('target_seller_id'), review['rating'], review['comment'], review['review_date']
        )
        cursor.execute(sql, values)
        conn.commit()
        new_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return new_id

    def update(self, review_id, review):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        UPDATE Reviews SET
            author_id = %s,
            target_clothing_id = %s,
            target_homeproduct_id = %s,
            target_seller_id = %s,
            rating = %s,
            comment = %s,
            review_date = %s
        WHERE review_id = %s
        """
        values = (
            review['author_id'], review.get('target_clothing_id'), review.get('target_homeproduct_id'),
            review.get('target_seller_id'), review['rating'], review['comment'], review['review_date'], review_id
        )
        cursor.execute(sql, values)
        conn.commit()
        cursor.close()
        conn.close()

    def delete(self, review_id):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Reviews WHERE review_id = %s", (review_id,))
        conn.commit()
        cursor.close()
        conn.close()
