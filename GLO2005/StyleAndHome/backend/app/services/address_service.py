from app.repositories import address_repository

def fetch_all_addresses():
    return address_repository.get_all_addresses()

def fetch_address_by_user_id(user_id):
    address = address_repository.get_address_by_user_id(user_id)
    if not address:
        raise Exception("Address not found for this user.")
    return address

def update_address(user_id, data):
    address_repository.update_address(user_id, data)

def delete_address(user_id):
    return address_repository.delete_address(user_id)
