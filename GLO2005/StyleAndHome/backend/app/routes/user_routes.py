# user_routes.py
from flask import Blueprint, request, jsonify
from app.services import user_service

user_bp = Blueprint("user_bp", __name__, url_prefix="/users")

# Récupérer tous les utilisateurs
@user_bp.route("/", methods=["GET"])
def get_users():
    users = user_service.fetch_all_users()
    return jsonify(users), 200

# Créer un utilisateur
@user_bp.route("/", methods=["POST"])
def create_user():
    data = request.get_json()

    user_service.create_user(data)

    return jsonify({"message": "User created successfully!"}), 201

# Mettre à jour un utilisateur
@user_bp.route("/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    data = request.get_json()

    user_service.update_user(
        user_id=user_id,
        email=data.get("email"),
        username=data.get("username"),
        password_hash=data.get("password_hash"),
        birthdate=data.get("birthdate")
    )

    return jsonify({"message": "User updated successfully!"}), 200

# Supprimer un utilisateur
@user_bp.route("/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    user_service.delete_user(user_id)
    return jsonify({"message": f"User {user_id} deleted successfully!"}), 200
