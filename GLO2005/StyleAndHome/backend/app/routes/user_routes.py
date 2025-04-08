# user_routes.py
from flask import Blueprint, jsonify, request
from backend.app.services import user_service

user_bp = Blueprint("user_bp", __name__, url_prefix="/users")

@user_bp.route("/", methods=["GET"])
def get_users():
    users = user_service.fetch_all_users()
    return jsonify(users)

@user_bp.route("/", methods=["POST"])
def create_user():
    data = request.get_json()
    print("🔥 POST /users/ triggered")  # Debug print

    user_service.insert_user(
        email=data["email"],
        username=data["username"],
        password_hash=data["password_hash"],
        birthdate=data["birthdate"]
    )

    return jsonify({"message": "User created successfully!"}), 201

