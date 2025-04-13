from flask import Blueprint, jsonify, request
from app.services import address_service

address_bp = Blueprint("address_bp", __name__, url_prefix="/addresses")

@address_bp.route("/", methods=["GET"])
def get_addresses():
    addresses = address_service.fetch_all_addresses()
    return jsonify(addresses), 200

@address_bp.route("/<int:user_id>", methods=["GET"])
def get_address_by_user(user_id):
    try:
        address = address_service.fetch_address_by_user_id(user_id)
        return jsonify(address), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 404

@address_bp.route("/<int:user_id>", methods=["PUT"])
def update_address(user_id):
    data = request.get_json()
    try:
        address_service.update_address(user_id, data)
        return jsonify({"message": "Address updated successfully."}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 400

@address_bp.route("/<int:user_id>", methods=["DELETE"])
def delete_address(user_id):
    address_service.delete_address(user_id)
    return jsonify({"message": "Address deleted successfully."}), 200
