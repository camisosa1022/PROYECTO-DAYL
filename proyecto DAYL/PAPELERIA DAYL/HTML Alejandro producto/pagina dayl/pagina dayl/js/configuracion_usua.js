function togglePedido(pedidoId) {
    var contenidoPedido = $('#' + pedidoId);
    contenidoPedido.slideToggle();
}

function mostrarInputNombresApellidos() {
    $('#inputNombres').toggle();
    $('#inputApellidos').toggle();
}

function mostrarInputCorreo() {
    $('#inputCorreo').toggle();
}

function mostrarInputContrasena() {
    $('#inputContrasenaActual').toggle();
    $('#inputContrasenaNueva').toggle();
    $('#inputConfirmacionContrasena').toggle();
}

function guardarCambios() {
    // Aquí puedes agregar el código para guardar los cambios en la configuración
    alert("Cambios guardados exitosamente"); // Ejemplo de mensaje de alerta
}

$(document).ready(function () {
    function cargarPedidos() {
        $('.tab-content').hide();
        $('#pedidos').show();
    }

    cargarPedidos();

    $('.option').click(function (e) {
        e.preventDefault();
        var tabId = $(this).data('tab');
        $('.tab-content').hide();
        $('#' + tabId).show();
    });

    $('.ui.accordion').accordion();
});
