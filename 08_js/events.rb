#================== JS ================
#                 EVENTS

const element = document.getElementById('an-id');

element.addEventListener('eventType', (event) => {
  # Do something with the event(callback)
});

#---

# KEYDOWN

function logKey(event) {
  if (event.key === 'p') {
    moveForward('1');
  } else if (event.key === 'q') {
    moveForward('2');
  }
}

document.addEventListener('keydown', logKey);

#---

# CLICK

document.querySelector(".restart").addEventListener("click", (event) => {
  document.querySelector(`#player1-race .active`).remove("active");
  document.querySelector('#player1-race').children[0].classList.add("active");
});