from flask import Blueprint, jsonify, request
from app.services import buys_service
from app.repositories import user_repository, homeproduct_repository

buys_bp = Blueprint("buys_bp", __name__, url_prefix="/buys")

@buys_bp.route("/", methods=["GET"])
def get_all_buys():
    buys = buys_service.fetch_all_buys()
    return jsonify(buys), 200

@buys_bp.route("/<int:user_id>", methods=["GET"])
def get_buys_by_user(user_id):
    buys = buys_service.fetch_buys_by_user(user_id)
    return jsonify(buys), 200

@buys_bp.route("/", methods=["POST"])
def create_buy():
    data = request.get_json()
    user = user_repository.get_user_by_id(data["user_id"])
    if not user:
        return jsonify({"error": "User not found"}), 404

    product = homeproduct_repository.get_homeproduct_by_id(data["homeproduct_id"])
    if not product:
        return jsonify({"error": "Product not found"}), 404

    try:
        buy_id = buys_service.create_buy(data)
        return jsonify({"message": "Purchase completed successfully", "buy_id": buy_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400