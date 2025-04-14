# user_service.py
import bcrypt
from app.repositories import user_repository


# Obtenir tous les utilisateurs
def fetch_all_users():
    return user_repository.get_all_users()

# Obtenir un utilisateur par son ID
def fetch_user_by_id(user_id):
    return user_repository.get_user_by_id(user_id)

# Créer un nouvel utilisateur (Inscription)
def create_user(user_data):
    email = user_data.get("email")
    username = user_data.get("username")
    password = user_data.get("password")
    birthdate = user_data.get("birthdate")

    existing_user = user_repository.get_user_by_username(username)
    if existing_user:
        raise Exception("Username already exists !")

    existing_email = user_repository.get_user_by_email(email)
    if existing_email:
        raise Exception("Email already exists !")

    password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

    user_repository.create_user(email, username, password_hash, birthdate)
    user = user_repository.get_user_by_username(username)
    return user["User_Id"]

# Mise à jour d'un utilisateur
def update_user(user_id, email, username, password, birthdate):
    password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    return user_repository.update_user(user_id, email, username, password_hash, birthdate)

# Supprimer un utilisateur
def delete_user(user_id):
    user_repository.delete_user(user_id)

# Fonction Login (Authentification)
def login_user(username, password):
    user = user_repository.get_user_by_username(username)

    if not user:
        raise Exception("User not found !")

    # Vérification du mot de passe
    if not bcrypt.checkpw(password.encode('utf-8'), user['PasswordHash'].encode('utf-8')):
        raise Exception("Incorrect password !")

    return user  # On retourne les infos utilisateur pour le token ou autre

# Obtenir un utilisateur par son username
def retrieve_user(username):
    user = user_repository.get_user_by_username(username)
    if not user:
        raise Exception("User not found !")
    return user
