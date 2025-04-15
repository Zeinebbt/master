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

function redirigerVersPanier() {
  redirigerVersLoginOu("panier.html");
}

function redirigerVersSolde() {
  redirigerVersLoginOu("balance.html");
}

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
      window.location.href = "detail.html"; // ou "détails.html" selon ton fichier
    });
  });
}
async function chargerArticlesDepuisBackend() {
  try {
    const response = await fetch("http://localhost:5000/homeproducts");
    const data = await response.json();
    articles = data; // ⚠️ Attention au format de données renvoyé
    afficherArticles(); // maintenant que articles[] est rempli, on affiche
  } catch (err) {
    console.error("Erreur de chargement des articles :", err);
    alert("Impossible de charger les articles.");
  }
}


function getParametreURL(nom) {
  const params = new URLSearchParams(window.location.search);
  return params.get(nom);
}

function chargerModeleArticle() {
  const container = document.querySelector(".article-container");
  if (!container) return;

  container.innerHTML = "";

  const template = `
  <div class="article" data-categorie="{{categorie}}" data-marque="{{marque}}" data-nom="{{nom}}">
    <img src="{{image}}" alt="{{alt}}" class="article-img">
    <h3 class="article-nom">{{nom}}</h3>
    <p class="article-prix">Prix : {{prix}}</p>
    <p class="article-vendeur">Vendu par : <span class="vendeur">{{vendeur}}</span></p>
    <div class="article-rating">{{note_etoiles}} ({{note}}/5)</div>
    <div class="btn-article-group">
      <button class="btn-details" data-index="{{index}}">Voir en détails</button>
      <button class="btn-acheter">Acheter</button>
    </div>
  </div>
`;


  articles.forEach((article, index) => {
    let html = template
    .replace("{{image}}", article.image)
    .replace("{{alt}}", article.alt)
    .replace("{{nom}}", article.nom)
    .replace("{{prix}}", article.prix)
    .replace("{{vendeur}}", article.vendeur)
    .replace("{{note_etoiles}}", article.note_etoiles)
    .replace("{{note}}", article.note)
    .replace("{{categorie}}", article.categorie)
    .replace("{{marque}}", article.marque)
    .replace("{{index}}", index);

    container.innerHTML += html;
  });

  const paramCat = getParametreURL("categorie");
  if (paramCat) {
    const selectCategorie = document.getElementById("filtre-categorie");
    if (selectCategorie) {
      selectCategorie.value = paramCat;
    }
  }

  function activerBoutonsDetails() {
    const boutons = document.querySelectorAll(".btn-details");
    boutons.forEach(btn => {
      btn.addEventListener("click", function () {
        const index = btn.getAttribute("data-index");
        localStorage.setItem("articleDetails", JSON.stringify(articles[index]));
        window.location.href = "détails.html";
      });
    });
  }

  activerPopups();
  activerBoutonsDetails();
  filtrerArticles();
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
      const prix = article.querySelector(".article-prix").textContent.replace("Prix : ", "");
      const vendeur = article.querySelector(".vendeur").textContent;
      afficherPopup(nom, prix, vendeur);
    });
  });
}

// ---------------------- INITIALISATION ----------------------
document.addEventListener("DOMContentLoaded", () => {
  chargerModeleArticle();
  const filtreCategorie = document.getElementById("filtre-categorie");
  const filtreMarque = document.getElementById("filtre-marque");
  const filtrePrix = document.getElementById("filtre-prix");

  if (filtreCategorie && filtreMarque && filtrePrix) {
    filtreCategorie.addEventListener("change", filtrerArticles);
    filtreMarque.addEventListener("change", filtrerArticles);
    filtrePrix.addEventListener("input", filtrerArticles);
  }
});

async function connecterUtilisateur() {
  const username = document.getElementById("username").value.trim();
  const password = document.getElementById("motdepasse").value.trim();

  console.log("Tentative de connexion avec :");
  console.log("Username :", username);
  console.log("Password :", password);

  const erreur = document.getElementById("erreur");
  const otpSection = document.getElementById("otp-section");

  const data = { username, password };

  try {
    const response = await fetch("http://localhost:5000/users/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    });

    const result = await response.json();

    if (response.ok) {
      erreur.style.display = "none";
      otpSection.style.display = "block";
      localStorage.setItem("username_temp", username);
      alert("Un code vous a été envoyé par mail.");
    } else {
      erreur.style.display = "block";
      erreur.textContent = result.error || "Erreur de connexion.";
    }
  } catch (error) {
    console.error("Erreur:", error);
    erreur.style.display = "block";
    erreur.textContent = "Erreur de connexion au serveur.";
  }
}

async function verifierOtp() {
  const otp = document.getElementById("otp").value;
  const username = localStorage.getItem("username_temp");
  const erreur = document.getElementById("erreur");

  const data = { username, otp };

  try {
    const response = await fetch("http://localhost:5000/users/verify", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    });

    const result = await response.json();

    if (response.ok) {
      localStorage.setItem("estConnecte", "true");
      localStorage.setItem("nomUtilisateur", result.user.Username);
      localStorage.setItem("user_id", result.user.User_Id);
      localStorage.setItem("token", result.token);

      alert("Connexion réussie !");
      window.location.href = "balance.html";
    } else {
      erreur.style.display = "block";
      erreur.textContent = result.error || "Code incorrect.";
    }
  } catch (error) {
    console.error("Erreur:", error);
    erreur.style.display = "block";
    erreur.textContent = "Erreur de connexion au serveur.";
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
function supprimerCompte() {
  const confirmation = confirm("Êtes-vous sûr(e) de vouloir supprimer votre compte ? Cette action est irréversible.");
  if (confirmation) {
    // Suppression des données du localStorage
    localStorage.removeItem("estConnecte");
    localStorage.removeItem("nomUtilisateur");
    localStorage.removeItem("anneeNaissance");
    localStorage.removeItem("dateInscription");

    alert("Votre compte a été supprimé.");
    window.location.href = "index.html";
  }
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
  <div class="article" data-categorie="{{categorie}}" data-marque="{{marque}}" data-nom="{{nom}}">
    <img src="{{image}}" alt="{{alt}}" class="article-img">
    <h3 class="article-nom">{{nom}}</h3>
    <p class="article-prix">Prix : {{prix}}</p>
    <p class="article-vendeur">Vendu par : <span class="vendeur">{{vendeur}}</span></p>
    <div class="article-rating">
      {{note_etoiles}} ({{note}}/5)
    </div>
    <div class="article-commentaires">
      <p><strong>Commentaires :</strong></p>
      <ul>
        {{commentaires}}
      </ul>
    </div>
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
    articles = data;
    afficherArticles(); // ✅ s'assurer qu'on affiche bien après chargement
  } catch (err) {
    console.error("Erreur de chargement des articles :", err);
    alert("Impossible de charger les articles.");
  }
}

function afficherArticles() {
  const container = document.querySelector(".article-container");
  container.innerHTML = "";

  articles.forEach((article, index) => {
    let commentairesHTML = "";
    if (Array.isArray(article.commentaires)) {
      commentairesHTML = article.commentaires.map(c => `<li>${c}</li>`).join("");
    }

    let html = articleTemplate
      .replace("{{image}}", article.image || "")
      .replace("{{alt}}", article.alt || "")
      .replace(/{{nom}}/g, article.nom || "")
      .replace("{{prix}}", article.prix || "")
      .replace("{{vendeur}}", article.vendeur || "")
      .replace("{{note_etoiles}}", article.note_etoiles || "⭐️⭐️⭐️⭐️")
      .replace("{{note}}", article.note || "4")
      .replace("{{categorie}}", article.categorie || "")
      .replace("{{marque}}", article.marque || "")
      .replace("{{index}}", index)
      .replace("{{commentaires}}", commentairesHTML);

    container.innerHTML += html;
  });

  activerBoutonsDetails();
  activerPopups();
  filtrerArticles();
}
