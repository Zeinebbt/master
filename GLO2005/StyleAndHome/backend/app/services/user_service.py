# user_service.py
from backend.app.repositories.user_repository import UserRepository

user_repo = UserRepository()

def fetch_all_users():
    return user_repo.get_all_users()

def fetch_user_by_id(user_id):
    return user_repo.get_by_id(user_id)

def create_user(user_data):
    return user_repo.create(user_data)

def update_user(user_id, user_data):
    return user_repo.update(user_id, user_data)

def delete_user(user_id):
    return user_repo.delete(user_id)
