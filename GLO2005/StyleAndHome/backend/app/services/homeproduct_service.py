# homeproduct_service.py
from backend.app.repositories.homeproduct_repository import HomeProductRepository

homeproduct_repo = HomeProductRepository()

def fetch_all_homeproducts():
    return homeproduct_repo.get_all()

def fetch_homeproduct_by_id(product_id):
    return homeproduct_repo.get_by_id(product_id)

def create_homeproduct(product_data):
    return homeproduct_repo.create(product_data)

def update_homeproduct(product_id, product_data):
    return homeproduct_repo.update(product_id, product_data)

def delete_homeproduct(product_id):
    return homeproduct_repo.delete(product_id)
