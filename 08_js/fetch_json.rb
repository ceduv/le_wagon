#=========== JS ==================
#           FETCH

# The HTTP method (aka verb)
# The HTTP headers (telling the server we’re sending some JSON)
# The HTTP body, with the actual JSON being posted

fetch("https://swapi.co/api/people/")
  .then(response => response.json())
  .then((data) => {
    console.log(data);            # `data` is now a JS object
  });

# POST

fetch(url, {
  method: "POST",
  headers: {
    "Content-Type": "application/json"
  },
  body: JSON.stringify(a_js_object)
})

# GET

const searchDico = (saisie) => {
    const apiUrl = `https://wagon-dictionary.herokuapp.com/autocomplete/${saisie}`;
    fetch(apiUrl)
      .then(response => response.json())
      .then((data) => {
        insertWord(data.words);
      });
};