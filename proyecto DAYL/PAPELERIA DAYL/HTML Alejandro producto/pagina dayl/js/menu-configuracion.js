window.addEventListener('resize', function(event) {
  if(this.screen.width < 1600){
    console.log('change')
  }
}, true);



//funcion de ocultar el menu


document.addEventListener('DOMContentLoaded', function () {
  var iconoIzquierdo = document.getElementById('icon-izquierdo');
  var menuIzquierdo = document.querySelector('.menu-izq');
  var inputCentro = document.getElementById('input-centro');

  iconoIzquierdo.addEventListener('click', function () {
    menuIzquierdo.classList.toggle('menu-visible');
    inputCentro.classList.toggle('ocultar1');

    // Si el menú izquierdo está visible, ocultar la barra de búsqueda
    if (menuIzquierdo.classList.contains('menu-visible')) {
      inputCentro.classList.add('ocultar1');
    }
  });

  window.addEventListener('resize', function () {
    if (window.innerWidth > 400) {
      inputCentro.classList.remove('ocultar1');
    } else {
      
    }
  });
});