# transaction_service.py
from backend.app.repositories.transaction_repository import TransactionRepository

transaction_repo = TransactionRepository()

def fetch_all_transactions():
    return transaction_repo.get_all()

def fetch_transaction_by_id(transaction_id):
    return transaction_repo.get_by_id(transaction_id)

def create_transaction(transaction_data):
    return transaction_repo.create(transaction_data)

def update_transaction(transaction_id, transaction_data):
    return transaction_repo.update(transaction_id, transaction_data)

def delete_transaction(transaction_id):
    return transaction_repo.delete(transaction_id)
