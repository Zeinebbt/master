from flask import Blueprint, jsonify, request
from app.services import homeproduct_service

homeproduct_bp = Blueprint("homeproduct_bp", __name__, url_prefix="/homeproducts")

# GET all home products
@homeproduct_bp.route("/", methods=["GET"])
def get_homeproducts():
    items = homeproduct_service.fetch_all_homeproducts()
    return jsonify(items)

# POST new home product
@homeproduct_bp.route("/", methods=["POST"])
def create_homeproduct():
    data = request.get_json()
    product_id = homeproduct_service.create_homeproduct(data)
    return jsonify({"homeproduct_id": product_id}), 201

# PUT (update) home product
@homeproduct_bp.route("/<int:product_id>", methods=["PUT"])
def update_homeproduct(product_id):
    data = request.get_json()
    homeproduct_service.update_homeproduct(product_id, data)
    return jsonify({"message": "Home product updated successfully"}), 200

# DELETE home product
@homeproduct_bp.route("/<int:product_id>", methods=["DELETE"])
def delete_homeproduct(product_id):
    homeproduct_service.delete_homeproduct(product_id)
    return jsonify({"message": "Home product deleted successfully"}), 200
