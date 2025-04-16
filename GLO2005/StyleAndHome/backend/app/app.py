import sys
import os
sys.path.append(os.path.abspath(os.path.dirname(__file__)))

from flask import Flask, render_template
from flask_cors import CORS
from flask_jwt_extended import JWTManager

# Importation des blueprints
from app.routes.user_routes import user_bp
from app.routes.address_routes import address_bp
from app.routes.wallet_routes import wallet_bp
from app.routes.homeproduct_routes import homeproduct_bp
from app.routes.review_routes import review_bp
from app.routes.buys_routes import buys_bp
print("✅ Blueprints enregistrés :")
print(" - user_bp :", user_bp)
print(" - buys_bp :", buys_bp)
print(" - review_bp :", review_bp)

# Initialisation de l'app Flask
app = Flask(__name__)
CORS(app, resources={r"/*": {
    "origins": ["http://localhost:5500", "http://127.0.0.1:5500"],
    "supports_credentials": True,
    "allow_headers": "*",
    "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
}})


# Configuration des JWT
app.config['JWT_SECRET_KEY'] = 'Az52d@fghjklqDFIZIUZ12390sqdsdfUZj$*?dgdLqOPF84+WQvlp!sWQfIoaKxlE2'
jwt = JWTManager(app)

# Enregistrement des blueprints
app.register_blueprint(user_bp, url_prefix="/users")
app.register_blueprint(address_bp, url_prefix="/addresses")
app.register_blueprint(wallet_bp, url_prefix="/wallets")
app.register_blueprint(homeproduct_bp, url_prefix="/homeproducts")
app.register_blueprint(review_bp, url_prefix="/reviews")
app.register_blueprint(buys_bp, url_prefix="/buys")


@app.route("/")
def index():
    return {"message": "Welcome to the Style&Home API"}

# Route Nous Contacter
@app.route("/contact")
def contact():
    return render_template("contact.html")