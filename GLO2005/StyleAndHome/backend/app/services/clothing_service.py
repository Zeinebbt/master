# clothing_service.py

import sys
import os

# Ajoute le dossier racine "StyleAndHome" au chemin Python
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
sys.path.append(ROOT_DIR)

from app.repositories import clothing_repository

def fetch_all_clothing():
    return clothing_repository.get_all_clothing()

def fetch_clothing_by_id(clothing_id):
    return clothing_repository.get_clothing_by_id(clothing_id)

def create_clothing(clothing_data):
    return clothing_repository.insert_clothing(clothing_data)

def delete_clothing(clothing_id):
    return clothing_repository.delete_clothing(clothing_id)
