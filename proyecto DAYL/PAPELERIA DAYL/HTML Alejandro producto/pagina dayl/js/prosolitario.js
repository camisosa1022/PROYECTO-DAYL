function changeImage(event) {
  var selectedImage = event.target.value;
  var mainImage = document.getElementById("mainImage");
  mainImage.src = selectedImage;
}

function changeMainImage(element) {
  var mainImage = document.getElementById("mainImage");
  mainImage.src = element.src;

  var smallImages = document.getElementsByClassName("small-image");
  for (var i = 0; i < smallImages.length; i++) {
    smallImages[i].classList.remove("selected");
  }

  element.classList.add("selected");
}

let contador = 0;
const contadorElemento = document.querySelector("#contador");

function aumentar() {
  var contador = document.getElementById("contador");
  var valorActual = parseInt(contador.textContent);

  contador.textContent = valorActual + 1;
}

function disminuir() {
  var contador = document.getElementById("contador");
  var valorActual = parseInt(contador.textContent);

  if (valorActual > 0){
    contador.textContent = valorActual -1;
  }
}

function showConfirmation() {
  var cantidadInput = document.getElementById("cantidadInput");
  var cantidad = cantidadInput.value;
  alert("¡Formulario enviado correctamente! Cantidad: " + cantidad);
}

document.getElementById("miDropdown").selectedIndex = -1;
