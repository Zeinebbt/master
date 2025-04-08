from backend.config import get_db_connection

conn = get_db_connection()

# Obtenir toutes les reviews (avec une limite facultative)
def get_all_reviews(limit=-1):
    cursor = conn.cursor(dictionary=True)

    query = """
    SELECT review_id, user_id, rating, comment, clothing_id, homeproduct_id, created_at
    FROM Review
    ORDER BY created_at DESC
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

# Obtenir les reviews d’un utilisateur
def get_reviews_by_user(user_id):
    cursor = conn.cursor(dictionary=True)
    query = """
    SELECT review_id, rating, comment, clothing_id, homeproduct_id, created_at
    FROM Review
    WHERE user_id = %s
    ORDER BY created_at DESC
    """
    cursor.execute(query, (user_id,))
    reviews = cursor.fetchall()
    cursor.close()
    conn.close()
    return reviews

# Créer une nouvelle review
def create_review(review):
    cursor = conn.cursor()
    query = """
    INSERT INTO Review (user_id, rating, comment, clothing_id, homeproduct_id)
    VALUES (%s, %s, %s, %s, %s)
    """
    values = (
        review["user_id"],
        review["rating"],
        review.get("comment"),
        review.get("clothing_id"),
        review.get("homeproduct_id")
    )
    cursor.execute(query, values)
    conn.commit()
    review_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return review_id

# Supprimer une review
def delete_review(review_id):
    cursor = conn.cursor()
    query = "DELETE FROM Review WHERE review_id = %s"
    cursor.execute(query, (review_id,))
    conn.commit()
    cursor.close()
    conn.close()
