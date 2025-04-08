# user_routes.py
from flask import Blueprint, jsonify, request
from backend.app.services import user_service

user_bp = Blueprint("user_bp", __name__, url_prefix="/users")

@user_bp.route("/", methods=["GET"])
def get_users():
    users = user_service.fetch_all_users()
    return jsonify(users)
