#================== JS =======================
#                 LISTENER

# add un toggle img-circle au click sur toutes les images

document.querySelectorAll("img").forEach((img) => {
    img.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("img-circle");
    });
  });