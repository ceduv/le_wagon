#================= JS =====================
#               CLASSLIST

# modifier class css sur un selecteur

element.classList.add("red");
element.classList.remove("red");
element.classList.toggle("red");

# check le contenu de la class de wagon pour voir si elle
# match avec "finish"

if (wagon.nextElementSibling.classList.contains("finish")) {
    console.log("coucpu");
    setTimeout(() => { window.alert(`win  player-${player}`); }, 10);
    window.location.reload();
  }