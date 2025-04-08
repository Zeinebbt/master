# transaction_service.py
import sys
import os

# Configuration du chemin racine
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(ROOT_DIR)

from app.repositories import transaction_repository

# Récupère toutes les transactions
def fetch_all_transactions():
    return transaction_repository.get_all_transactions()

# Récupère une transaction par son ID
def fetch_transaction_by_id(transaction_id):
    return transaction_repository.get_transaction_by_id(transaction_id)

# Crée une nouvelle transaction
def create_transaction(transaction_data):
    # Assure que "total" (et non "total_price") est la bonne clé
    if "total_price" in transaction_data:
        transaction_data["total"] = transaction_data.pop("total_price")
    return transaction_repository.create_transaction(transaction_data)

# Annule une transaction
def cancel_transaction(transaction_id):
    return transaction_repository.cancel_transaction(transaction_id)
