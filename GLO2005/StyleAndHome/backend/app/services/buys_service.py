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
