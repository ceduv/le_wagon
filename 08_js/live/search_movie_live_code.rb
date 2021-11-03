// API Algolia

const searchAlgoliaPlaces = (event) => {
  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    });
};

const input = document.querySelector("#search");
input.addEventListener("keyup", searchAlgoliaPlaces);

// --------------

// API OMDB

const list = document.getElementById("list");
const form = document.querySelector("#search-form");

const insertMovies = (data) => {
  data.Search.forEach((movie) => {
    const movieElement = `<li>
      <img src="${movie.Poster}" alt="">
      <p>${movie.Title}</p>
    </li>`;
    list.insertAdjacentHTML("beforeend", movieElement);
  });
};

const searchMovie = (keyword) => {
  const apiUrl = `http://www.omdbapi.com/?s=${keyword}&apikey=adf1f2d7`;
  fetch(apiUrl)
    .then(response => response.json())
    .then(insertMovies);
};

form.addEventListener("submit", (event) => {
  event.preventDefault();
  list.innerHTML = "";
  const search = document.querySelector("#search-input");
  searchMovie(search.value);
});

searchMovie("Harry Potter");