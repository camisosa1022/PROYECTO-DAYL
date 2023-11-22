// carrito.js

// Variables globales para guardar el subtotal y el total del carrito
let subtotal = 0;
let total = 0;

// Función para actualizar la cantidad de productos
function updateQuantity(button, increment) {
    const quantityInput = button.parentElement.querySelector('#quantity-input');
    let quantity = parseInt(quantityInput.value);
    quantity += increment;
    if (quantity < 0) {
        quantity = 0;
    }
    quantityInput.value = quantity;

    // Actualizar subtotal del producto
    updateProductSubtotal(button);
}

// Función para formatear un precio con separadores de miles
function formatPrice(price) {
    return price.toFixed(3).replace(/\B(?=(\d{3})+(?!\d))/g, '.');
}

// Función para actualizar el subtotal de un producto
function updateProductSubtotal(button) {
    const quantityInput = button.parentElement.querySelector('#quantity-input');
    const quantity = parseInt(quantityInput.value);
    const row = button.parentElement.parentElement.parentElement.parentElement;
    const priceElement = row.querySelector('.product-price');
    const subtotalElement = row.querySelector('.product-subtotal');

    const price = parseFloat(priceElement.innerText.replace('$', ''));
    const rowSubtotal = price * quantity;

    subtotalElement.innerText = '$' + formatPrice(rowSubtotal);
}

// Función para actualizar el carrito
function updateCart() {
    const rows = document.querySelectorAll('.ten.wide.column .ui.unstackable.celled.table tbody tr');

    subtotal = 0;
    rows.forEach(row => {
        const quantityInput = row.querySelector('#quantity-input');
        const quantity = parseInt(quantityInput.value);
        const priceElement = row.querySelector('.product-price');
        const subtotalElement = row.querySelector('.product-subtotal');

        const price = parseFloat(priceElement.innerText.replace('$', ''));
        const rowSubtotal = price * quantity;

        subtotalElement.innerText = '$' + formatPrice(rowSubtotal);

        subtotal += rowSubtotal;
    });

    // Actualizar total del carrito solo si se hace clic en el botón "Actualizar Carrito"
    updateCartTotal();
}

// Función para actualizar el total del carrito
function updateCartTotal() {
    const subtotalElements = document.querySelectorAll('.subtotal-value');
    const totalElement = document.querySelector('.total-value');

    total = subtotal;

    subtotalElements.forEach(element => {
        element.innerText = '$' + formatPrice(subtotal);
    });
    totalElement.innerText = '$' + formatPrice(total);
}
