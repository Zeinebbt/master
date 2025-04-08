# user_service.py

from app.repositories import user_repository

def fetch_all_users():
    return user_repository.get_all_users()

def fetch_user_by_id(user_id):
    return user_repository.get_user_by_id(user_id)

def create_user(user_data):
    return user_repository.create_user(**user_data)

def update_user(user_id, email, username, password_hash, birthdate, balance):
    return user_repository.update_user(user_id, email, username, password_hash, birthdate, balance)

def insert_user(email, username, password_hash, birthdate):
    return user_repository.create_user(email, username, password_hash, birthdate)

def delete_user(user_id):
    return user_repository.delete_user(user_id)




