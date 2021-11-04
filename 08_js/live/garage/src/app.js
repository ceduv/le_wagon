// TODO: Build an awesome garage!
import { addCar, getAllCars } from './cars';

getAllCars();

const form = document.getElementById("new-car");
form.addEventListener("submit", addCar);
