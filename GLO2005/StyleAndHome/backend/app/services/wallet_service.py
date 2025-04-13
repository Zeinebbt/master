from app.repositories import wallet_repository

def fetch_all_wallets():
    return wallet_repository.get_all_wallets()

def fetch_wallet_by_user_id(user_id):
    wallet = wallet_repository.get_wallet_by_user_id(user_id)
    if not wallet:
        raise Exception("Wallet not found for this user.")
    return wallet

def create_wallet(user_id):
    return wallet_repository.create_wallet(user_id)

def add_money_to_wallet(user_id, amount):
    if amount <= 0:
        raise Exception("Amount must be positive !")
    wallet = fetch_wallet_by_user_id(user_id)
    new_balance = float(wallet["Solde"]) + amount
    wallet_repository.update_wallet_balance(user_id, new_balance)

def withdraw_money_from_wallet(user_id, amount):
    if amount <= 0:
        raise Exception("Amount must be positive !")
    wallet = fetch_wallet_by_user_id(user_id)
    if wallet["Solde"] < amount:
        raise Exception("Insufficient funds !")
    new_balance = float(wallet["Solde"]) - amount
    wallet_repository.update_wallet_balance(user_id, new_balance)

def delete_wallet(user_id):
    wallet = wallet_repository.get_wallet_by_user_id(user_id)
    if not wallet:
        raise Exception("Wallet not found for this user.")
    wallet_repository.delete_wallet_by_user_id(user_id)
