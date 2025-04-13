from app.repositories import homeproduct_repository

def fetch_all_homeproducts(limit=-1, search="", brand="", category="", max_price=None, in_stock=False):
    return homeproduct_repository.get_all_homeproducts(limit, search, brand, category, max_price, in_stock)

def fetch_homeproduct_by_id(product_id):
    return homeproduct_repository.get_homeproduct_by_id(product_id)

def create_homeproduct(data):
    return homeproduct_repository.create_homeproduct(data)

def update_homeproduct(product_id, data):
    return homeproduct_repository.update_homeproduct(product_id, data)

def delete_homeproduct(product_id):
    return homeproduct_repository.delete_homeproduct(product_id)
