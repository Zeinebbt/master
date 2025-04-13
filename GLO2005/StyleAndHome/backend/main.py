import sys
import os
sys.path.append(os.path.abspath(os.path.dirname(__file__)))

# main.py — point d'entrée de l'API Flask pour Style&Home
from flask import Flask
from app.routes.user_routes import user_bp
from app.routes.homeproduct_routes import homeproduct_bp
from app.routes.transaction_routes import transaction_bp
from app.routes.review_routes import review_bp

app = Flask(__name__)

# Enregistrement des blueprints avec des préfixes clairs
app.register_blueprint(user_bp, url_prefix="/users")
app.register_blueprint(homeproduct_bp, url_prefix="/homeproducts")
app.register_blueprint(transaction_bp, url_prefix="/transactions")
app.register_blueprint(review_bp, url_prefix="/reviews")

@app.route("/")
def index():
    return {"message": "Bienvenue sur l'API Style&Home"}


if __name__ == "__main__":
    app.run(debug=True)

