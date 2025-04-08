# transaction_service.py
import sys
import os
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(ROOT_DIR)

from app.repositories import transaction_repository

def fetch_all_transactions():
    return transaction_repository.get_all_transactions()

def fetch_transaction_by_id(transaction_id):
    return transaction_repository.get_transaction_by_id(transaction_id)

def create_transaction(transaction_data):
    return transaction_repository.create_transaction(transaction_data)

def update_transaction(transaction_id, transaction_data):
    return transaction_repository.update_transaction(transaction_id, transaction_data)

def delete_transaction(transaction_id):
    return transaction_repository.delete_transaction(transaction_id)
