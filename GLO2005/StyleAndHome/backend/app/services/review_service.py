import mysql.connector
from app.repositories import review_repository


def fetch_all_reviews(limit=-1):
    return review_repository.get_all_reviews(limit)

def fetch_review_by_id(review_id):
    return review_repository.get_review_by_id(review_id)

def fetch_reviews_by_user(author_id):
    return review_repository.get_reviews_by_user(author_id)

def fetch_reviews_by_homeproduct(homeproduct_id):
    return review_repository.get_reviews_by_homeproduct(homeproduct_id)

def create_review(review_data):
    try:
        return review_repository.create_review(review_data)
    except mysql.connector.errors.IntegrityError as e:
        if "Duplicate entry" in str(e):
            raise Exception("Review already exists for this user and product.")
        else:
            raise e

def update_review(review_id, review_data):
    return review_repository.update_review(review_id, review_data)

def delete_review(review_id):
    return review_repository.delete_review(review_id)