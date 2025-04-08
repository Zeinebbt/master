# user_routes.py
from flask import Blueprint, request, jsonify
from app.services import user_service

user_bp = Blueprint("user_bp", __name__, url_prefix="/users")

@user_bp.route("/", methods=["GET"])
def get_users():
    users = user_service.fetch_all_users()
    return jsonify(users)

@user_bp.route("/", methods=["POST"])
def create_user():
    data = request.get_json()
    print("🔥 POST /users/ triggered")

    user_service.insert_user(
        email=data["email"],
        username=data["username"],
        password_hash=data["password_hash"],
        birthdate=data["birthdate"]
    )

    return jsonify({"message": "User created successfully!"}), 201

@user_bp.route("/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    data = request.get_json()
    print("🔁 PUT /users/<id> triggered")

    user_service.update_user(
        user_id=user_id,
        email=data["email"],
        username=data["username"],
        password_hash=data["password_hash"],
        birthdate=data["birthdate"],
        balance=data["balance"]
    )
    return jsonify({"message": "Utilisateur mis à jour avec succès"}), 200

@user_bp.route('/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    print(f"🔥 DELETE /users/{user_id} triggered")
    user_service.delete_user(user_id)
    return jsonify({"message": f"User {user_id} supprimé avec succès"}), 200




