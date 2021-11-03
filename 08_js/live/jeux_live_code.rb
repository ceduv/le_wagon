#===================== JS =========================
#               EXO JEU LIVECODE

# jeux 16 carres , les remettre ds l ordre
# a base de td en html


# Faire apparaitre l'astuce lorsqu'on clique sur le bouton
const btn = document.querySelector("#show-hint");
const hint = document.querySelector(".hint");

btn.addEventListener("click", (event) => {
  hint.classList.toggle("active");
});

# Sélectionner toutes les tuiles
const tiles = document.querySelectorAll("td");

# Pour chaque tuile on pose un event listener pour le click
tiles.forEach((tile) => {
  tile.addEventListener("click", (event) => {
    # Pour le détail des fonctions canMove et moveTile voir plus bas
    if (canMove(event.currentTarget)) {
      moveTile(event.currentTarget);
    }
    # On exécute la fonction playerWins après un délai de 1 seconde (1000 millisecondes) 
    # pour éviter que la l'alerte ne se déclenche avant que la tuile ait eu le temps de bouger
    setTimeout(() => {
      playerWins()
    }, 1000);
  });
});

# On regarde si un voisin est vide
const canMove = (tile) => {
  const tileColumn = tile.cellIndex;
  const tileRow = tile.parentElement.rowIndex;
  const emptyTile = document.querySelector(".empty");
  const emptyTileColumn = emptyTile.cellIndex;
  const emptyTileRow = emptyTile.parentElement.rowIndex;

  return (tileRow === emptyTileRow && tileColumn + 1 === emptyTileColumn) ||
  (tileRow === emptyTileRow && tileColumn - 1 === emptyTileColumn) ||
  (tileColumn === emptyTileColumn && tileRow + 1 === emptyTileRow) ||
  (tileColumn === emptyTileColumn && tileRow - 1 === emptyTileRow)
};

# Si c'est le cas on swap la tuile clickée et la tuile vide
const moveTile = (tile) => {
  # 1. Sélectionner la tuile vide
  const emptyTile = document.querySelector(".empty");
  # 2. Remplacer son contenu avec celui de la tuile clickée
  emptyTile.innerText = tile.innerText;
  # 3. Supprimer le contenu de la tuile clickée
  tile.innerText = "";
  # 4. Supprimer la class empty de la tuile vide
  emptyTile.classList.remove("empty");
  # 5. Ajouter la class empty sur la tuile clickée
  tile.classList.add("empty");
};

# On vérifie si on a gagné
const playerWins = () => {
  const winList = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,NaN";
  const actualList = Array.from(tiles).map(tile => parseInt(tile.innerText, 10)).join(",");
  if (winList === actualList) {
    alert('You win!')
  }
}