# clothing_routes.py
from flask import Blueprint, jsonify, request
from app.services import clothing_service

clothing_bp = Blueprint("clothing_bp", __name__, url_prefix="/clothing")

@clothing_bp.route("/", methods=["GET"])
def get_clothing():
    items = clothing_service.fetch_all_clothing()
    return jsonify(items)

@clothing_bp.route("/", methods=["POST"])
def create_clothing():
    data = request.get_json()
    print("🧪 Données reçues :", data)  # Ajout ici pour débug
    clothing_id = clothing_service.create_clothing(data)
    return jsonify({"clothing_id": clothing_id}), 201

@clothing_bp.route("/<int:item_id>", methods=["PUT"])
def update_clothing(item_id):
    data = request.get_json()
    print(f"✏️ PUT /clothing/{item_id} triggered")
    clothing_service.update_clothing(item_id, data)
    return jsonify({"message": "Clothing item updated successfully"}), 200

@clothing_bp.route("/<int:item_id>", methods=["DELETE"])
def delete_clothing(item_id):
    print(f"🗑️ DELETE /clothing/{item_id} triggered")
    clothing_service.delete_clothing(item_id)
    return jsonify({"message": "Clothing item deleted successfully"}), 200
