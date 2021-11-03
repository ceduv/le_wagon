const authorization = "Bearer YOUR_API_KEY";

const form = document.querySelector("#clearbitForm");
const input = document.querySelector("#clearbitEmail");
const userName = document.getElementById("userName");
const userEmail = document.getElementById("userEmail");
const userBio = document.getElementById("userBio");
const userLocation = document.getElementById("userLocation");

const insertInfos = (data) => {
  userName.innerText = `${data.name.fullName}`;
  userEmail.innerText = `${data.email}`;
  userBio.innerText = `${data.bio}`;
  userLocation.innerText = `${data.geo.country}`;
}

const callClearbitApi = (event) => {
  event.preventDefault();
  const email = input.value;        
  # le champ saisie par l user
  const url = `https://person.clearbit.com/v1/people/email/${email}`;
  fetch(url, {
    headers: { Authorization: authorization }       
    # header obligatoire pour cette api
  })
    .then(response => response.json())
    .then(insertInfos);
}

form.addEventListener("submit", callClearbitApi);