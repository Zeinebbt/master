# transaction_routes.py
from flask import Blueprint, jsonify, request
from app.services import transaction_service

transaction_bp = Blueprint("transaction_bp", __name__, url_prefix="/transactions")

@transaction_bp.route("/", methods=["GET"])
def get_transactions():
    items = transaction_service.fetch_all_transactions()
    return jsonify(items)
