document.querySelectorAll('#contenedor-car-general .ui.action.input').forEach(function(element) {
    let id_color = element.getAttribute('data-producto-id');
    input_cant(id_color, 'gen');
});

document.querySelectorAll('#contenedor-car-responsive-padre .ui.action.input').forEach(function(element) {
    let id_color = element.getAttribute('data-producto-id');
    input_cant(id_color, 'res');
});

function input_cant(id_color, containerId) {
    $.ajax({
        url: '/obtener_imagen_color/',
        method: 'GET',
        data: { 'colorId': id_color },
        success: function(response) {
            let quantityInput = document.getElementById(containerId + '-' + id_color);
            let increaseBtn = document.getElementById(containerId + '-increase-' + id_color);
            let decreaseBtn = document.getElementById(containerId + '-decrease-'+ id_color);

            quantityInput.max = response.cantidad;

            increaseBtn.addEventListener('click', function() {
                if (parseInt(quantityInput.value) < parseInt(quantityInput.max)) {
                    quantityInput.value = parseInt(quantityInput.value) + 1;
                }
            });

            decreaseBtn.addEventListener('click', function() {
                if (parseInt(quantityInput.value) >= 2) {
                    quantityInput.value = parseInt(quantityInput.value) - 1;
                }
                else if (parseInt(quantityInput.value) <= 1) {
                    quantityInput.value = 1;
                }
            });
            quantityInput.addEventListener("change", function() {
                if (parseInt(quantityInput.value) > parseInt(quantityInput.max)) {
                    quantityInput.value = parseInt(quantityInput.max);
                }
                else if (parseInt(quantityInput.value)< 1){
                    quantityInput.value = 1;
                }
            }
            )

        },
        error: function() {
            console.log("Super error");
        }
    });
}
