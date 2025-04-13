from config import get_db_connection

def get_all_addresses():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Addresses")
    results = cursor.fetchall()
    cursor.close()
    return results

def get_address_by_user_id(user_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Addresses WHERE user_id = %s", (user_id,))
    result = cursor.fetchone()
    cursor.close()
    return result

def update_address(user_id, data):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    UPDATE Addresses
    SET Zip = %s, Province = %s, Country = %s, StreetNameAndNumber = %s
    WHERE User_Id = %s
    """
    values = (
        data["zip"],
        data["province"],
        data["country"],
        data["StreetNameAndNumber"],
        user_id
    )
    cursor.execute(query, values)
    conn.commit()
    cursor.close()

def delete_address(user_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM Addresses WHERE user_id = %s", (user_id,))
    conn.commit()
    cursor.close()
