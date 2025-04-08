# homeproduct_routes.py
from flask import Blueprint, jsonify, request
from app.services import homeproduct_service

homeproduct_bp = Blueprint("homeproduct_bp", __name__, url_prefix="/homeproducts")

@homeproduct_bp.route("/", methods=["GET"])
def get_homeproducts():
    items = homeproduct_service.fetch_all_homeproducts()
    return jsonify(items)
