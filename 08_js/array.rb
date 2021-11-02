#================== JS =======================
#                  ARRAY

const beatles = [ "john", "paul", "ringo", "george"];

beatles.forEach((beatle) => {
  console.log(beatle);
});

#---

# permet de recup un array plutot que nodelist

Array.from(document.querySelectorAll("tbody tr")).map