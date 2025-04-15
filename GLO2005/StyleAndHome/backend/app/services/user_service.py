# user_service.py
import bcrypt
from app.repositories import user_repository, address_repository
from app.services.otp_service import generate_otp, send_otp_email


# Dictionnaire temporaire pour stocker les OTP (clé = username, valeur = code OTP)
otp_storage = {}

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
    street = user_data.get("street")
    country = user_data.get("country")
    province = user_data.get("province")
    zip_code = user_data.get("zip")

    if user_repository.get_user_by_username(username):
        raise Exception("Username already exists!")
    if user_repository.get_user_by_email(email):
        raise Exception("Email already exists!")

    password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
    user_id = user_repository.create_user(email, username, password_hash, birthdate)

    # Create address manually if you disabled the auto-trigger
    address_repository.create_address(user_id, zip_code, province, country, street)

    return user_id

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

    if not bcrypt.checkpw(password.encode('utf-8'), user['PasswordHash'].encode('utf-8')):
        raise Exception("Incorrect password !")

    otp = generate_otp()

    send_otp_email(user["Email"], otp)  # C'est ça qui envoie à l'utilisateur

    otp_storage[username] = otp

    return {"otp_sent": True, "user_id": user["User_Id"]}

# Étape 2 : Vérifier l’OTP
def verify_otp(username, otp_code):
    if otp_storage.get(username) != otp_code:
        raise Exception("Code de vérification incorrect.")

    # Authentification réussie → on peut supprimer l'OTP
    del otp_storage[username]

    user = user_repository.get_user_by_username(username)
    return user  # Pour générer le token dans user_routes ensuite

# Obtenir un utilisateur par son username
def retrieve_user(username):
    user = user_repository.get_user_by_username(username)
    if not user:
        raise Exception("User not found !")
    return user
