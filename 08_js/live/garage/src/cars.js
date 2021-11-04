const url = `https://wagon-garage-api.herokuapp.com/fred/cars`;
const list = document.querySelector(".cars-list");

const insertCar = (car) => {
  const carName = `${car.brand} ${car.model}`;
  const carTag = `<div class="car">
                    <div class="car-image">
                      <img src="http://loremflickr.com/280/280/${carName}"/>
                    </div>
                    <div class="car-info">
                      <h4>${carName}</h4>
                      <p><strong>Owner:</strong>${car.owner}</p>
                      <p><strong>Plate:</strong>${car.plate}</p>
                    </div>
                  </div>`;
  list.insertAdjacentHTML("beforeend", carTag);
};

const getAllCars = () => {
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      data.forEach(insertCar);
    });
};

const createCarData = () => {
  const brand = document.getElementById("brand").value;
  const model = document.getElementById("model").value;
  const plate = document.getElementById("plate").value;
  const owner = document.getElementById("owner").value;

  const carData = {};
  carData.brand = brand;
  carData.model = model;
  carData.plate = plate;
  carData.owner = owner;

  return carData;
};

const addCar = (event) => {
  event.preventDefault();

  fetch(url, {
    method: "POST",
    headers: { 'content-type': 'application/json' },
    body: JSON.stringify(createCarData())
  })
    .then(response => response.json())
    .then(() => {
      list.innerHTML = "";
      getAllCars();
    });
};

export { addCar, getAllCars };
