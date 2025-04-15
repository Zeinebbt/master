# user_routes.py
from flask import Blueprint, request, jsonify
from flask_jwt_extended import jwt_required, get_jwt_identity, create_access_token
from app.services import user_service

user_bp = Blueprint("user_bp", __name__, url_prefix="/users")


# GET ALL USERS
@user_bp.route("/", methods=["GET"])
def get_users():
    users = user_service.fetch_all_users()
    return jsonify(users), 200

# GET USER BY ID
@user_bp.route("/<int:user_id>", methods=["GET"])
def get_user_by_id(user_id):
    user = user_service.fetch_user_by_id(user_id)
    if user:
        return jsonify(user), 200
    else:
        return jsonify({"error": "User not found !"}), 404


# SIGN UP
@user_bp.route("/", methods=["POST"])
def sign_up():
    data = request.get_json()
    try:
        user_id = user_service.create_user(data)
        return jsonify({
            "message": "User created successfully !",
            "user_id": user_id
        }), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# LOGIN → étape 1 : Vérifie username/password et envoie OTP
@user_bp.route("/login", methods=["POST"])
def login():
    data = request.get_json()
    username = data.get("username")
    password = data.get("password")

    try:
        result = user_service.login_user(username, password)
        return jsonify({
            "message": "OTP sent to your email.",
            "otp_sent": True,
            "user_id": result["user_id"]
        }), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 401

# VERIFY OTP → étape 2 : Vérifie le code OTP et connecte
@user_bp.route("/verify", methods=["POST"])
def verify_otp():
    data = request.get_json()
    username = data.get("username")
    otp_code = data.get("otp")

    try:
        user = user_service.verify_otp(username, otp_code)
        access_token = create_access_token(identity=username)
        return jsonify({
            "message": "Login successful!",
            "token": access_token,
            "user": user
        }), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 401

# LOGOUT
@user_bp.route("/logout", methods=["POST"])
@jwt_required()
def logout():
    current_user = get_jwt_identity()
    return jsonify({"message": f"User '{current_user}' logged out successfully."}), 200


# UPDATE USER
@user_bp.route("/<int:user_id>", methods=["PUT"])
def update_user(user_id):
    data = request.get_json()

    # On récupère le mot de passe brut pour le hacher dans le service
    user_service.update_user(
        user_id=user_id,
        email=data["email"],
        username=data["username"],
        password=data["password"],
        birthdate=data["birthdate"]
    )
    return jsonify({"message": "User updated successfully !"}), 200


# DELETE USER
@user_bp.route("/<int:user_id>", methods=["DELETE"])
def delete_user(user_id):
    user_service.delete_user(user_id)
    return jsonify({"message": f"User {user_id} deleted successfully !"}), 200
