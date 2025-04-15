// ---------------------- CONNEXION & REDIRECTION ----------------------
function redirigerVersSignUp() {
  window.location.href = "signup.html";
}

function redirigerVersLogin() {
  window.location.href = "login.html";
}

function connecterUtilisateur() {
  localStorage.setItem("estConnecte", "true");
  window.location.href = "index.html";
  return false;
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

  const data = {
    username: document.getElementById("username").value,
    email: document.querySelector("input[type='email']").value,
    password: mdp1,
    birthdate: document.getElementById("birthyear").value,
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
      localStorage.setItem("estConnecte", "true");
      localStorage.setItem("nomUtilisateur", result.user.Username);
      localStorage.setItem("token", result.token); // Save JWT
      localStorage.setItem("user_id", result.user.User_Id);

      alert("Connexion réussie !");
      window.location.href = "balance.html"; // Or home/dashboard
    } else {
      alert(result.error || "Erreur de connexion.");
    }
  } catch (error) {
    console.error("Erreur:", error);
    alert("Une erreur est survenue lors de la connexion.");
  }
}


// ---------------------- ARTICLES & SIMULATION ----------------------
const articles = [
  {
    image: "img/coussin.jpg",
    alt: "Coussin beige doux",
    nom: "Coussin beige doux",
    prix: "24.99 $",
    vendeur: "Atelier Chic",
    note: "4",
    note_etoiles: "⭐⭐⭐⭐☆",
    commentaires: ["Super confortable !", "Couleur fidèle à la photo."],
    categorie: "Salon",
    marque: "IKEA"
  },
  {
    image: "img/lampe.jpg",
    alt: "Lampe bois naturel",
    nom: "Lampe bois naturel",
    prix: "39.99 $",
    vendeur: "Lumière & Co",
    note: "5",
    note_etoiles: "⭐⭐⭐⭐⭐",
    commentaires: ["Parfaite sur ma table de chevet !", "Lumière douce, très zen."],
    categorie: "Chambre",
    marque: "Maisons du Monde"
  },
  {
    image: "img/plaid.jpg",
    alt: "Plaid en coton bio",
    nom: "Plaid en coton bio",
    prix: "34.50 $",
    vendeur: "Maison Douce",
    note: "4",
    note_etoiles: "⭐⭐⭐⭐☆",
    commentaires: ["Très doux au toucher 💚", "Parfait pour l'hiver !"],
    categorie: "Salle à manger",
    marque: "Conforama"
  }
];

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

function deconnecterUtilisateur() {
  localStorage.removeItem("estConnecte");
  localStorage.removeItem("nomUtilisateur");
  localStorage.removeItem("anneeNaissance");
  localStorage.removeItem("dateInscription");
  window.location.href = "index.html";
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