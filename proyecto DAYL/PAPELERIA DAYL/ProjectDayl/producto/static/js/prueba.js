const decreaseBtn = document.querySelector('.decrease-btn');
const increaseBtn = document.querySelector('.increase-btn');
const quantityInput = document.getElementById('quantity-input');

decreaseBtn.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  if (currentValue > 0) {
    quantityInput.value = currentValue - 1;
  }
});

increaseBtn.addEventListener('click', () => {
  let currentValue = parseInt(quantityInput.value);
  if (currentValue<=0) {
    quantityInput.value=1;
  }else{
    quantityInput.value = currentValue + 1;
  }
});
quantityInput.addEventListener('change', () => {
    let currentValue = parseInt(quantityInput.value);
    if (currentValue < 0 || isNaN(currentValue)) {
      quantityInput.value = 0;
    }
  });

  document.querySelector(".ui.icon.primary.basic.button").addEventListener("mouseover", function() {
    const iconElement = this.querySelector("i.icon");
    iconElement.classList.remove("shop");
    iconElement.classList.add("plus");
  
    // Agregar el evento mouseout después de cambiar la clase a "plus"
    this.addEventListener("mouseout", function() {
      const iconElement = this.querySelector("i.icon");
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