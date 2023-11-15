$(document).ready(function () {
    // Aplicar truncado de texto a los elementos h3 y p con clase "clamp-2"
    $('.clamp-2').each(function () {
        var maxHeight = parseFloat($(this).css('line-height')) * 2; // Calcular altura máxima en píxeles (2 líneas)
        var textHeight = $(this).height(); // Obtener altura actual del contenido
        if (textHeight > maxHeight) {
            $(this).text(function (index, currentText) {
                return currentText.replace(/\W*\s(\S)*$/, '...'); // Truncar texto agregando puntos suspensivos
            });
        }
    });
});

//para nombre producto subcategoria agregado el 9/julio//

// Función para actualizar los enlaces del breadcrumb
function updateBreadcrumb(pageName) {
    var breadcrumb = document.getElementById('breadcrumb');
    breadcrumb.innerHTML = '<a href="#">Index</a> <i class="right angle icon"></i> <a href="#">' + pageName + '</a>';
}

// Simulación de cambio de página
updateBreadcrumb('Categoría'); // Cambia el nombre de la categoría
updateBreadcrumb('Subcategoría'); // Cambia el nombre de la subcategoría

//filtros//
$(document).ready(function () { //me guie de chat gpt para agregar la funcion de que se vieran los productos que se subian desde django//
    $('#filtro').on('change', function () {
        var selectedOption = $(this).val();

        // Realizar una solicitud AJAX al servidor para obtener los productos filtrados
        $.ajax({
            url: '/obtener_productos/', // URL a la vista de Django que devuelve los productos en formato JSON
            method: 'GET',
            data: {
                opcion: selectedOption
            },
            success: function (response) {
                mostrarProductos(response.productos);
            },
            error: function (xhr, status, error) {
                console.error('Error al obtener los productos:', error);
            }
        });
    });

    function mostrarProductos(productos) {
        var $productosContainer = $('#productos');
        $productosContainer.empty();

        // Mostrar los productos en el contenedor
        productos.forEach(function (producto) {
            var $item = $('<div class="item">');
            var $content = $('<div class="content">');
            var $header = $('<div class="header">').text(producto.nombre);
            var $description = $('<div class="description">').text(producto.descripcion);

            $content.append($header);
            $content.append($description);
            $item.append($content);
            $productosContainer.append($item);
        });
    }
});