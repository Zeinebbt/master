from app.repositories import buys_repository
import mysql.connector


def fetch_all_buys():
    return buys_repository.get_all_buys()

def fetch_buys_by_user(user_id):
    return buys_repository.get_buys_by_user(user_id)

def create_buy(buy_data):
    try:
        return buys_repository.create_buy(buy_data)
    except mysql.connector.errors.IntegrityError as e:
        if "foreign key constraint fails" in str(e):
            raise Exception("User or Product does not exist.")
        else:
            raise e

def cancel_buy(buy_id):
    return buys_repository.cancel_buy(buy_id)

def update_buy_status(buy_id, new_status):
    allowed_status = ['completed', 'shipped', 'cancelled']
    if new_status not in allowed_status:
        raise Exception("Invalid status.")
    return buys_repository.update_buy_status(buy_id, new_status)
