from flask import Blueprint, jsonify, request
from app.services import wallet_service

wallet_bp = Blueprint("wallet_bp", __name__, url_prefix="/wallets")

@wallet_bp.route("/", methods=["GET"])
def get_all_wallets():
    wallets = wallet_service.fetch_all_wallets()
    return jsonify(wallets), 200

@wallet_bp.route("/<int:user_id>", methods=["GET"])
def get_wallet_by_user(user_id):
    try:
        wallet = wallet_service.fetch_wallet_by_user_id(user_id)
        return jsonify(wallet), 200
    except Exception as e:
        return jsonify({"error": "Wallet not found !"}), 404

@wallet_bp.route("/<int:user_id>/add", methods=["PUT"])
def add_money(user_id):
    data = request.get_json()
    amount = data.get("amount", 0)
    try:
        wallet_service.add_money_to_wallet(user_id, amount)
        return jsonify({"message": f"{amount} $ added successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@wallet_bp.route("/<int:user_id>/withdraw", methods=["PUT"])
def withdraw_money(user_id):
    data = request.get_json()
    amount = data.get("amount", 0)
    try:
        wallet_service.withdraw_money_from_wallet(user_id, amount)
        return jsonify({"message": f"{amount} $ withdrawn successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@wallet_bp.route("/<int:user_id>", methods=["DELETE"])
def delete_wallet(user_id):
    try:
        wallet_service.delete_wallet(user_id)
        return jsonify({"message": "Wallet deleted successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 404
