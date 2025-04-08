# review_routes.py
from flask import Blueprint, jsonify, request
from backend.app.services import review_service

review_bp = Blueprint("review_bp", __name__, url_prefix="/reviews")

@review_bp.route("/", methods=["GET"])
def get_reviews():
    items = review_service.fetch_all_reviews()
    return jsonify(items)
