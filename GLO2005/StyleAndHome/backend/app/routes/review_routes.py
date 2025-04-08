# review_routes.py
from flask import Blueprint, jsonify, request
from app.services import review_service

review_bp = Blueprint("review_bp", __name__, url_prefix="/reviews")

@review_bp.route("/", methods=["GET"])
def get_reviews():
    items = review_service.fetch_all_reviews()
    return jsonify(items)

@review_bp.route("/", methods=["POST"])
def create_review():
    data = request.get_json()
    review_id = review_service.create_review(data)
    return jsonify({"review_id": review_id}), 201

@review_bp.route("/<int:review_id>", methods=["PUT"])
def update_review(review_id):
    data = request.get_json()
    review_service.update_review(review_id, data)
    return jsonify({"message": "Review updated successfully"}), 200

@review_bp.route("/<int:review_id>", methods=["DELETE"])
def delete_review(review_id):
    review_service.delete_review(review_id)
    return jsonify({"message": "Review deleted successfully"}), 200
