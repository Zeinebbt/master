from flask import Blueprint, jsonify, request
from app.repositories import user_repository, homeproduct_repository
from app.services import review_service


review_bp = Blueprint("review_bp", __name__, url_prefix="/reviews")

# Obtenir toutes les reviews
@review_bp.route("/", methods=["GET"])
def get_reviews():
    limit = request.args.get("limit", default=-1, type=int)
    items = review_service.fetch_all_reviews(limit)
    return jsonify(items), 200

# Obtenir une review par ID
@review_bp.route("/<int:review_id>", methods=["GET"])
def get_review_by_id(review_id):
    review = review_service.fetch_review_by_id(review_id)
    if review:
        return jsonify(review), 200
    return jsonify({"error": "Review not found"}), 404

# Obtenir les reviews écrites par un user
@review_bp.route("/author/<int:author_id>", methods=["GET"])
def get_reviews_by_user(author_id):
    items = review_service.fetch_reviews_by_user(author_id)
    return jsonify(items), 200

# Obtenir les reviews d'un produit
@review_bp.route("/product/<int:homeproduct_id>", methods=["GET"])
def get_reviews_by_homeproduct(homeproduct_id):
    items = review_service.fetch_reviews_by_homeproduct(homeproduct_id)
    return jsonify(items), 200

# Créer une review
@review_bp.route("/", methods=["POST"])
def create_review():
    data = request.get_json()

    # Vérification existence author
    user = user_repository.get_user_by_id(data["author_id"])
    if not user:
        return jsonify({"error": "Author not found"}), 404

    # Vérification existence produit
    product = homeproduct_repository.get_homeproduct_by_id(data["homeproduct_id"])
    if not product:
        return jsonify({"error": "Product not found"}), 404

    try:
        review_id = review_service.create_review(data)
        return jsonify({"message": "Review created successfully", "review_id": review_id}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 400

# Modifier une review
@review_bp.route("/<int:review_id>", methods=["PUT"])
def update_review(review_id):
    data = request.get_json()
    review_service.update_review(review_id, data)
    return jsonify({"message": "Review updated successfully"}), 200

# Supprimer une review
@review_bp.route("/<int:review_id>", methods=["DELETE"])
def delete_review(review_id):
    review_service.delete_review(review_id)
    return jsonify({"message": "Review deleted successfully"}), 200