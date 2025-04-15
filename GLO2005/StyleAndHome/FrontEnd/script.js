// ---------------------- CONNEXION & REDIRECTION ----------------------
function redirigerVersSignUp() {
  window.location.href = "signup.html";
}

function redirigerVersLogin() {
  window.location.href = "login.html";
}


function estConnecte() {
  return localStorage.getItem("estConnecte") === "true";
}

function redirigerVersLoginOu(page) {
  if (estConnecte()) {
    window.location.href = page;
  } else {
    window.location.href = "login.html";
  }
}

function redirigerVersProfil() {
  redirigerVersLoginOu("profil.html");
}

function redirigerVersHome() {
  redirigerVersLoginOu("home.html");
}


function redirigerVersSolde() {
  redirigerVersLoginOu("balance.html");
}

let currentProductId = null;

document.addEventListener("DOMContentLoaded", async () => {
  await chargerArticlesDepuisBackend(); // fetch articles from backend
  const filtreCategorie = document.getElementById("filtre-categorie");
  const filtreMarque = document.getElementById("filtre-marque");
  const filtrePrix = document.getElementById("filtre-prix");

  if (filtreCategorie && filtreMarque && filtrePrix) {
    filtreCategorie.addEventListener("change", filtrerArticles);
    filtreMarque.addEventListener("change", filtrerArticles);
    filtrePrix.addEventListener("input", filtrerArticles);
  }
});

async function verifierEtConnecter(event) {
  event.preventDefault();

  const mdp1 = document.getElementById("motdepasse1").value;
  const mdp2 = document.getElementById("motdepasse2").value;
  const erreur = document.getElementById("erreur");

  if (mdp1 !== mdp2) {
    erreur.style.display = "block";
    return;
  }

  erreur.style.display = "none";

  const birthdateInput = document.getElementById("birthdate").value;
  const birthdate = new Date(birthdateInput);
  const today = new Date();

  let age = today.getFullYear() - birthdate.getFullYear();
  const m = today.getMonth() - birthdate.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birthdate.getDate())) {
    age--;
  }

  const erreurAge = document.getElementById("erreur-age");

  if (age < 18) {
    erreurAge.style.display = "block";
    return;
  } else {
    erreurAge.style.display = "none";
  }

  const data = {
    username: document.getElementById("username").value,
    email: document.querySelector("input[type='email']").value,
    password: mdp1,
    birthdate: birthdateInput,
    street: document.getElementById("StreetNameAndNumber").value,
    country: document.getElementById("country").value,
    province: document.getElementById("province").value,
    zip: document.getElementById("zip").value
  };

  try {
    const response = await fetch("http://localhost:5000/users/", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data)
    });

    const result = await response.json();

    if (response.ok) {
      alert("Compte créé !");
      window.location.href = "login.html";
    } else {
      alert(result.error || "Une erreur est survenue.");
    }
  } catch (err) {
    alert("Erreur de connexion au serveur.");
    console.error(err);
  }
}

// ---------------------- ARTICLES & SIMULATION ----------------------
function activerBoutonsDetails() {
  const boutons = document.querySelectorAll(".btn-details");
  boutons.forEach(btn => {
    btn.addEventListener("click", function () {
      const index = btn.getAttribute("data-index");
      localStorage.setItem("articleDetails", JSON.stringify(articles[index]));
      window.location.href = "details.html";
    });
  });
}

function getParametreURL(nom) {
  const params = new URLSearchParams(window.location.search);
  return params.get(nom);
}

// ---------------------- FILTRAGE ----------------------
function filtrerArticles() {
  const selectCategorie = document.getElementById("filtre-categorie");
  const selectMarque = document.getElementById("filtre-marque");
  const inputPrix = document.getElementById("filtre-prix");

  if (!selectCategorie || !selectMarque || !inputPrix) return;

  const cat = selectCategorie.value;
  const marq = selectMarque.value;
  const prixMax = parseFloat(inputPrix.value);

  const tousLesArticles = document.querySelectorAll(".article");

  tousLesArticles.forEach(article => {
    const articleCat = article.getAttribute("data-categorie");
    const articleMarque = article.getAttribute("data-marque");
    const articlePrix = parseFloat(
      article.querySelector(".article-prix").textContent.replace("Prix : ", "").replace(" $", "")
    );

    const catOK = (cat === "toutes" || articleCat === cat);
    const marqueOK = (marq === "toutes" || articleMarque === marq);
    const prixOK = isNaN(prixMax) || articlePrix <= prixMax;

    article.style.display = (catOK && marqueOK && prixOK) ? "inline-block" : "none";
  });
}



function afficherPopup(nom, prix, vendeur) {
  const idElem = document.getElementById("transaction-id");
  const messageElem = document.getElementById("message-confirmation");
  const popup = document.getElementById("popup");

  if (idElem) idElem.textContent = ""; // ou `Transaction enregistrée` si tu veux un texte

  messageElem.textContent = `Vous avez acheté le produit suivant "${nom}" au prix de ${prix}, mis en vente par "${vendeur}".`;

  popup.style.display = "flex";
  popup.scrollIntoView({ behavior: "smooth" });
}

function fermerPopup() {
  document.getElementById("popup").style.display = "none";
}

function activerPopups() {
  const boutons = document.querySelectorAll(".btn-acheter");

  boutons.forEach(btn => {
    btn.addEventListener("click", function () {
      const article = btn.closest(".article");
      const nom = article.querySelector(".article-nom").textContent;
      const prixText = article.querySelector(".article-prix").textContent;
      const prix = parseFloat(prixText.replace("Prix : ", "").replace(" $", ""));
      const vendeur = article.querySelector(".vendeur").textContent;
      const homeproduct_id = article.getAttribute("data-id");
      currentProductId = article.getAttribute("data-id");
      const user_id = localStorage.getItem("user_id");

      // ✅ INSÈRE LE CONSOLE.LOG ICI
      console.log("Achat →", {
        user_id,
        homeproduct_id,
        prix
      });

      // API call to save the buy
      fetch("http://127.0.0.1:5000/buys/", {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          user_id: parseInt(user_id),
          homeproduct_id: parseInt(homeproduct_id),
          taxed_price: prix
        })
      })
      .then(response => response.json())
      .then(data => {
        afficherPopup(nom, prix.toFixed(2) + " $", vendeur);
      })
      .catch(error => {
        alert("Erreur lors de l'achat : " + error.message);
      });
    });
  });
}
function soumettreReview() {
  const authorId = parseInt(localStorage.getItem("user_id"));
  const rating = parseInt(document.getElementById("review-rating").value);
  const comment = document.getElementById("review-comment").value;

  if (!currentProductId) {
    alert("Erreur : produit introuvable.");
    return;
  }

  fetch("http://127.0.0.1:5000/reviews/", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      author_id: authorId,
      homeproduct_id: parseInt(currentProductId),
      rating: rating,
      comment: comment
    })
  })
  .then(response => response.json())
  .then(data => {
    alert("Merci pour votre avis !");
    document.getElementById("review-comment").value = "";
    document.getElementById("review-rating").selectedIndex = 0;
    fermerPopup();
  })
  .catch(error => {
    alert("Erreur lors de la soumission de l'avis : " + error.message);
  });
}
// ---------------------- INITIALISATION ----------------------

async function connecterUtilisateur() {
  const username = document.getElementById("username").value;
  const password = document.getElementById("motdepasse").value;

  const data = { username, password };

  try {
    const response = await fetch("http://localhost:5000/users/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    });

    const result = await response.json();

    if (response.ok) {
      // ✅ Enregistrement dans le localStorage
      localStorage.setItem("estConnecte", "true");
      localStorage.setItem("nomUtilisateur", result.user.Username);
      localStorage.setItem("user_id", result.user.User_Id);
      localStorage.setItem("token", result.token);

      // ✅ Extraire birthdate et created_at
      localStorage.setItem(
        "anneeNaissance",
        result.user.Birthdate?.split("-")[0] || "Non renseignée"
      );
      localStorage.setItem(
        "dateInscription",
        result.user.CreatedAt?.split("T")[0] || "Aujourd'hui"
      );

      alert("Connexion réussie !");
      window.location.href = "balance.html";
    } else {
      alert(result.error || "Erreur de connexion.");
    }
  } catch (error) {
    console.error("Erreur:", error);
    alert("Une erreur est survenue lors de la connexion.");
  }
}



function ajouterCommentaire() {
  const texte = document.getElementById("nouveau-commentaire").value.trim();
  const nomUtilisateur = localStorage.getItem("nomUtilisateur") || "Utilisateur inconnu";

  if (texte) {
    const li = document.createElement("li");
    li.innerHTML = `<strong>${nomUtilisateur} :</strong> ${texte}`;
    listeCommentaires.appendChild(li);
    document.getElementById("nouveau-commentaire").value = "";
  }
}

let notes = []; // simule une base de données temporaire

function calculerMoyenne(notes) {
  if (notes.length === 0) return "Pas encore noté";
  const moyenne = notes.reduce((a, b) => a + b, 0) / notes.length;
  return moyenne.toFixed(1) + " / 5";
}

document.querySelectorAll('.etoile').forEach(star => {
  star.addEventListener('click', () => {
    const note = parseInt(star.getAttribute('data-note'));
    notes.push(note);

    // Met à jour l'affichage
    document.getElementById('note-moyenne').textContent = calculerMoyenne(notes);

    // Effet visuel
    document.querySelectorAll('.etoile').forEach(s => s.classList.remove('active'));
    for (let i = 0; i < note; i++) {
      document.querySelectorAll('.etoile')[i].classList.add('active');
    }
  });
});

function deconnecterUtilisateur() {
  localStorage.removeItem("estConnecte");
  localStorage.removeItem("token");
  localStorage.removeItem("user_id");
  localStorage.removeItem("nomUtilisateur");

  alert("Vous avez été déconnecté.");
  window.location.href = "login.html";
}

// ---------------------- TEMPLATE ----------------------
const articleTemplate = `
  <div class="article" data-id="{{id}}" data-categorie="{{categorie}}" data-marque="{{marque}}" data-nom="{{nom}}">
    <img src="{{image}}" alt="{{alt}}" class="article-img">
    <h3 class="article-nom">{{nom}}</h3>
    <p class="article-prix">Prix : {{prix}}</p>
    <p class="article-vendeur">Vendu par : <span class="vendeur">{{vendeur}}</span></p>
    <div class="article-rating">
      {{note_etoiles}} ({{note}}/5)
    </div>
    <p class="article-stock">Quantité disponible : {{stock}}</p>
    <div class="btn-article-group">
      <button class="btn-details" data-index="{{index}}">Voir en détails</button>
      <button class="btn-acheter">Acheter</button>
    </div>
  </div>
`;


// ---------------------- ARTICLES & SIMULATION ----------------------
let articles = [];

async function chargerArticlesDepuisBackend() {
  try {
    const response = await fetch("http://localhost:5000/homeproducts");
    const data = await response.json();
    console.log("Données reçues :", data); // 👈 ajoute ceci
    articles = data;
    afficherArticles(); // ✅ s'assurer qu'on affiche bien après chargement
  } catch (err) {
    console.error("Erreur de chargement des articles :", err);
    alert("Impossible de charger les articles.");
  }
}

function afficherArticles() {
  const container = document.querySelector(".article-container");
  if (!container) return;
  container.innerHTML = "";

  articles.forEach((article, index) => {
    let commentairesHTML = "";
    if (Array.isArray(article.commentaires)) {
      commentairesHTML = article.commentaires.map(c => `<li>${c}</li>`).join("");
    }

    // 💡 Calcul des étoiles et note
    const moyenne = article.average_rating;
    let etoiles = "Pas encore noté";
    if (moyenne !== null && moyenne !== undefined && !isNaN(moyenne)) {
      const fullStars = Math.floor(moyenne);
      const halfStar = moyenne % 1 >= 0.5 ? "½" : "";
      etoiles = "⭐".repeat(fullStars) + halfStar;
    }

    const html = articleTemplate
      .replace("{{image}}", article.ImgURL || "")
      .replace("{{alt}}", article.name || "")
      .replace(/{{nom}}/g, article.name || "")
      .replace("{{prix}}", article.price + " $" || "")
      .replace("{{vendeur}}", "Utilisateur #" + article.seller_id)
      .replace("{{note_etoiles}}", etoiles)
      .replace("{{note}}", (!isNaN(Number(moyenne)) ? Number(moyenne).toFixed(1) : "—"))
      .replace("{{categorie}}", article.category || "")
      .replace("{{marque}}", article.brand || "")
      .replace("{{stock}}", article.quantity || "")
      .replace("{{index}}", index)
      .replace("{{id}}", article.homeproduct_id);


    container.innerHTML += html;
  });

  activerBoutonsDetails();
  activerPopups();
  filtrerArticles();
}
