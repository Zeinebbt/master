# transaction_routes.py
from flask import Blueprint, jsonify, request
from app.services import transaction_service

transaction_bp = Blueprint("transaction_bp", __name__, url_prefix="/transactions")

# Route GET pour récupérer toutes les transactions
@transaction_bp.route("/", methods=["GET"])
def get_transactions():
    items = transaction_service.fetch_all_transactions()
    return jsonify(items)

# Route POST pour créer une nouvelle transaction
@transaction_bp.route("/", methods=["POST"])
def create_transaction():
    data = request.get_json()  # Récupérer les données envoyées dans le corps de la requête
    try:
        transaction_id = transaction_service.create_transaction(data)  # Appel au service pour créer la transaction
        return jsonify({"transaction_id": transaction_id}), 201  # Retourne l'ID de la transaction créée
    except Exception as e:
        return jsonify({"error": str(e)}), 400  # En cas d'erreur, retourner un message d'erreur avec un code 400

# Route PUT pour mettre à jour une transaction existante
@transaction_bp.route("/<int:transaction_id>/cancel", methods=["PUT"])
def cancel_transaction_route(transaction_id):
    success = transaction_service.cancel_transaction(transaction_id)
    if success:
        return jsonify({"message": "Transaction annulée avec succès ✅"}), 200
    return jsonify({"error": "Échec de l'annulation ❌"}), 400
