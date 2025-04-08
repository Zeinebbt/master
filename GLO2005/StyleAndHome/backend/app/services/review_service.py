# review_service.py
import sys
import os
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(ROOT_DIR)

from app.repositories import review_repository

def fetch_all_reviews():
    return review_repository.get_all_reviews()

def fetch_review_by_id(review_id):
    return review_repository.get_review_by_id(review_id)

def create_review(review_data):
    return review_repository.create_review(review_data)

def update_review(review_id, review_data):
    return review_repository.update_review(review_id, review_data)

def delete_review(review_id):
    return review_repository.delete_review(review_id)
