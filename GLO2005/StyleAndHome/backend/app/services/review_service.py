# review_service.py
from backend.app.repositories.review_repository import ReviewRepository

review_repo = ReviewRepository()

def fetch_all_reviews():
    return review_repo.get_all()

def fetch_review_by_id(review_id):
    return review_repo.get_by_id(review_id)

def create_review(review_data):
    return review_repo.create(review_data)

def update_review(review_id, review_data):
    return review_repo.update(review_id, review_data)

def delete_review(review_id):
    return review_repo.delete(review_id)
