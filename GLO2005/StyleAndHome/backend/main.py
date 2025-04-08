# main.py — point d'entrée de l'API Flask pour Style&Home

from flask import Flask
from backend.app.routes.user_routes import user_bp
from backend.app.routes.clothing_routes import clothing_bp
from backend.app.routes.homeproduct_routes import homeproduct_bp
from backend.app.routes.transaction_routes import transaction_bp
from backend.app.routes.review_routes import review_bp

app = Flask(__name__)

# Enregistrement des blueprints avec des préfixes clairs
app.register_blueprint(user_bp, url_prefix="/users")
app.register_blueprint(clothing_bp, url_prefix="/clothing")
app.register_blueprint(homeproduct_bp, url_prefix="/homeproducts")
app.register_blueprint(transaction_bp, url_prefix="/transactions")
app.register_blueprint(review_bp, url_prefix="/reviews")

@app.route("/")
def index():
    return {"message": "Bienvenue sur l'API Style&Home"}

if __name__ == "__main__":
    app.run(debug=True)
