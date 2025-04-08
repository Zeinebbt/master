# clothing_routes.py
from flask import Blueprint, jsonify, request
from app.services import clothing_service

clothing_bp = Blueprint("clothing_bp", __name__, url_prefix="/clothing")

@clothing_bp.route("/", methods=["GET"])
def get_clothing():
    items = clothing_service.fetch_all_clothing()
    return jsonify(items)
