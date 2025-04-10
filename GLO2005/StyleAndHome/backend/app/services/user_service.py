# user_service.py
import bcrypt
from app.repositories import user_repository


def fetch_all_users():
    return user_repository.get_all_users()

def fetch_user_by_id(user_id):
    return user_repository.get_user_by_id(user_id)

def create_user(user_data):
    email = user_data.get("email")
    username = user_data.get("username")
    password = user_data.get("password")
    birthdate = user_data.get("birthdate")

    # Hachage sécurisé du mot de passe
    password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    return user_repository.create_user(email, username, password_hash, birthdate)

def update_user(user_id, email, username, password_hash, birthdate, balance):
    return user_repository.update_user(user_id, email, username, password_hash, birthdate, balance)

def insert_user(email, username, password_hash, birthdate):
    return user_repository.create_user(email, username, password_hash, birthdate)

def delete_user(user_id):
    return user_repository.delete_user(user_id)




