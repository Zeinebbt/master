from app.repositories import clothing_repository

def fetch_all_clothing():
    return clothing_repository.get_all_clothing()

def create_clothing(data):
    return clothing_repository.insert_clothing(data)

def update_clothing(item_id, data):
    return clothing_repository.update_clothing(item_id, data)

def delete_clothing(item_id):
    return clothing_repository.delete_clothing(item_id)
