# homeproduct_service.py
import sys
import os
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(ROOT_DIR)

from app.repositories import homeproduct_repository

def fetch_all_homeproducts():
    return homeproduct_repository.get_all_homeproducts()

def fetch_homeproduct_by_id(product_id):
    return homeproduct_repository.get_homeproduct_by_id(product_id)

def create_homeproduct(product_data):
    return homeproduct_repository.create_homeproduct(product_data)

def update_homeproduct(product_id, product_data):
    return homeproduct_repository.update_homeproduct(product_id, product_data)

def delete_homeproduct(product_id):
    return homeproduct_repository.delete_homeproduct(product_id)
