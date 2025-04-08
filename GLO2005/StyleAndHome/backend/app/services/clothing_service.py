# clothing_service.py
from backend.app.repositories.clothing_repository import ClothingRepository

clothing_repo = ClothingRepository()

def fetch_all_clothing():
    return clothing_repo.get_all()

def fetch_clothing_by_id(clothing_id):
    return clothing_repo.get_by_id(clothing_id)

def create_clothing(clothing_data):
    return clothing_repo.create(clothing_data)

def update_clothing(clothing_id, clothing_data):
    return clothing_repo.update(clothing_id, clothing_data)

def delete_clothing(clothing_id):
    return clothing_repo.delete(clothing_id)
