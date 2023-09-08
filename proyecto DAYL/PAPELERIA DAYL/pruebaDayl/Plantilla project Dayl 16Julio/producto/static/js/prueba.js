const decreaseBtn = document.querySelector('.decrease-btn');
const increaseBtn = document.querySelector('.increase-btn');
const quantityInput = document.getElementById('quantity-input');

decreaseBtn.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  if (currentValue > 1) {
    quantityInput.value = currentValue - 1;
  }
});

increaseBtn.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  if (currentValue<1) {
    quantityInput.value=1;
  }
  else if( currentValue>=quantityInput.max){
    quantityInput.value=quantityInput.max;
  }
  else{
    quantityInput.value = currentValue + 1;
  }
});
quantityInput.addEventListener('change', () => {
    let currentValue = parseInt(quantityInput.value);
    if (currentValue < 1 || isNaN(currentValue)) {
      quantityInput.value = 1;
    }
    else if (currentValue >= quantityInput.max) {}
      quantityInput.value = quantityInput.max;
    } );

  document.querySelector(".ui.icon.primary.basic.button").addEventListener("mouseover", function() {
    const iconElement = this.querySelector("i.icon");
    iconElement.classList.remove("shop");
    iconElement.classList.add("plus");
  
    // Agregar el evento mouseout después de cambiar la clase a "plus"
    this.addEventListener("mouseout", function() {
      iconElement.classList.remove("plus");
      iconElement.classList.add("shop");
    });
  });

  $('#colores-select').change(function() {
    var colorId = $(this).val();
    obtenerImagenColor(colorId);

  });
  
  function obtenerImagenColor(colorId) {
    $.ajax({
      url: '/obtener_imagen_color/',  // Reemplaza esta URL con la URL correcta para tu vista obtener_imagen_color
      method: 'GET',
      data: { colorId: colorId },
      success: function(response) {
        if (response.imagen_url) {
          actualizarImagen(response.imagen_url);
          actualizarCantidad(response.cantidad);
          actualizarinput();
        }
      },
      error: function() {
        console.error('Error al obtener la imagen del color');
      }
    });
  }
  function actualizarImagen(imagenUrl) {
    $('#producto-imagen').attr('src', imagenUrl);
  }
  function actualizarCantidad(cantidadProductoColor) {
    const cantidadDiv = document.querySelector('.Cantidad_actualizada_ajax');
    quantityInput.max = cantidadProductoColor;
    cantidadDiv.innerHTML = '<span><strong>Cantidad:</strong> ' + cantidadProductoColor + '</span>';
  }
  
  const agregarCarritoLink = document.getElementById("agregar-carrito");
  const coloresSelect = document.getElementById("colores-select");

  increaseBtn.addEventListener("click",actualizarURL);
  decreaseBtn.addEventListener("click",actualizarURL);
  coloresSelect.addEventListener("change", actualizarURL);
  quantityInput.addEventListener("input", actualizarURL);

  function actualizarURL() {
    const productoId = document.getElementById("product_id").value;
    const colorId = coloresSelect.value;
    const cantidad = quantityInput.value;

    const nuevaURL = "/carrito/agregarc/0/0/0"
      .replace("0", productoId)
      .replace("0", colorId)
      .replace("0", cantidad);

    agregarCarritoLink.href = nuevaURL;
  }
  document.addEventListener('DOMContentLoaded', function() {
    const colorId = coloresSelect.value;
    obtenerImagenColor(colorId);
  });
  function actualizarinput(){
    let cantidadValor = parseInt(quantityInput.value)
    if (cantidadValor >= quantityInput.max ){
      quantityInput.value = quantityInput.max;
    }
  }