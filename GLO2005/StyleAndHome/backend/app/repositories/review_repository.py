from config import get_db_connection

def get_all_reviews(limit=-1):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT review_id, author_id, rating, comment, homeproduct_id, reviewdate
    FROM Reviews
    ORDER BY reviewdate DESC
    """
    params = ()

    if limit != -1:
        query += " LIMIT %s"
        params = (limit,)

    cursor.execute(query, params)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

def get_review_by_id(review_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT review_id, author_id, rating, comment, homeproduct_id, reviewdate
    FROM Reviews
    WHERE review_id = %s
    """
    cursor.execute(query, (review_id,))
    result = cursor.fetchone()
    cursor.close()
    conn.close()
    return result

def get_reviews_by_user(author_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT review_id, rating, comment, homeproduct_id, reviewdate
    FROM Reviews
    WHERE author_id = %s
    ORDER BY reviewdate DESC
    """
    cursor.execute(query, (author_id,))
    reviews = cursor.fetchall()
    cursor.close()
    conn.close()
    return reviews

def get_reviews_by_homeproduct(homeproduct_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT review_id, author_id, rating, comment, homeproduct_id, reviewdate
    FROM Reviews
    WHERE homeproduct_id = %s
    ORDER BY reviewdate DESC
    """
    cursor.execute(query, (homeproduct_id,))
    reviews = cursor.fetchall()
    cursor.close()
    conn.close()
    return reviews

def create_review(review):
    conn = get_db_connection()
    cursor = conn.cursor()

    query = """
    INSERT INTO Reviews (author_id, rating, comment, homeproduct_id)
    VALUES (%s, %s, %s, %s)
    """
    values = (
        review["author_id"],
        review["rating"],
        review.get("comment"),
        review["homeproduct_id"]
    )

    cursor.execute(query, values)
    conn.commit()

    review_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return review_id

def update_review(review_id, review):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = """
    UPDATE Reviews
    SET author_id = %s, rating = %s, comment = %s, homeproduct_id = %s
    WHERE review_id = %s
    """
    values = (
        review["author_id"],
        review["rating"],
        review.get("comment"),
        review["homeproduct_id"],
        review_id
    )
    cursor.execute(query, values)
    conn.commit()
    cursor.close()
    conn.close()

def delete_review(review_id):
    conn = get_db_connection()
    cursor = conn.cursor()
    query = "DELETE FROM Reviews WHERE review_id = %s"
    cursor.execute(query, (review_id,))
    conn.commit()
    cursor.close()
    conn.close()
