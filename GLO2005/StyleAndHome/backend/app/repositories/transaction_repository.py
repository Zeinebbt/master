from backend.config import get_db_connection

class TransactionRepository:

    def get_all(self):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Transactions")
        results = cursor.fetchall()
        cursor.close()
        conn.close()
        return results

    def get_by_id(self, transaction_id):
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Transactions WHERE transaction_id = %s", (transaction_id,))
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        return result

    def create(self, transaction):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        INSERT INTO Transactions (buyer_id, seller_id, date, total, status)
        VALUES (%s, %s, %s, %s, %s)
        """
        values = (
            transaction['buyer_id'], transaction['seller_id'], transaction['date'],
            transaction['total'], transaction['status']
        )
        cursor.execute(sql, values)
        conn.commit()
        transaction_id = cursor.lastrowid
        cursor.close()
        conn.close()
        return transaction_id

    def update(self, transaction_id, transaction):
        conn = get_db_connection()
        cursor = conn.cursor()
        sql = """
        UPDATE Transactions SET
            buyer_id = %s,
            seller_id = %s,
            date = %s,
            total = %s,
            status = %s
        WHERE transaction_id = %s
        """
        values = (
            transaction['buyer_id'], transaction['seller_id'], transaction['date'],
            transaction['total'], transaction['status'], transaction_id
        )
        cursor.execute(sql, values)
        conn.commit()
        cursor.close()
        conn.close()

    def delete(self, transaction_id):
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("DELETE FROM Transactions WHERE transaction_id = %s", (transaction_id,))
        conn.commit()
        cursor.close()
        conn.close()
