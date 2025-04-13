from flask import Blueprint, request, jsonify
from app.services import homeproduct_service

homeproduct_bp = Blueprint("homeproduct_bp", __name__, url_prefix="/homeproducts")

@homeproduct_bp.route("/", methods=["GET"])
def get_homeproducts():
    limit = request.args.get("limit", default=-1, type=int)
    search = request.args.get("search", default="", type=str)
    brand = request.args.get("brand", default="", type=str)
    category = request.args.get("category", default="", type=str)
    max_price = request.args.get("max_price", type=float)
    in_stock = request.args.get("in_stock", default=False, type=lambda v: v.lower() == 'true')

    products = homeproduct_service.fetch_all_homeproducts(limit, search, brand, category, max_price, in_stock)
    return jsonify(products), 200


@homeproduct_bp.route("/<int:product_id>", methods=["GET"])
def get_homeproduct_by_id(product_id):
    product = homeproduct_service.fetch_homeproduct_by_id(product_id)
    if product:
        return jsonify(product), 200
    else:
        return jsonify({"error": "Home product not found"}), 404


@homeproduct_bp.route("/", methods=["POST"])
def create_homeproduct():
    data = request.get_json()
    try:
        product_id = homeproduct_service.create_homeproduct(data)
        return jsonify({"homeproduct_id": product_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400


@homeproduct_bp.route("/<int:product_id>", methods=["PUT"])
def update_homeproduct(product_id):
    data = request.get_json()
    homeproduct_service.update_homeproduct(product_id, data)
    return jsonify({"message": "Home product updated successfully"}), 200


@homeproduct_bp.route("/<int:product_id>", methods=["DELETE"])
def delete_homeproduct(product_id):
    homeproduct_service.delete_homeproduct(product_id)
    return jsonify({"message": "Home product deleted successfully", "deleted_id": product_id}), 200
