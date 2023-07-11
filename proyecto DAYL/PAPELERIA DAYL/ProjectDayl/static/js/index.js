function cambiarDiseno() {
  const anchoPantalla = window.innerWidth;
  const bodyElement = document.querySelector('body');

  if (anchoPantalla > 767) {
    bodyElement.classList.add('pantalla-grande');
    bodyElement.classList.remove('pantalla-pequena');
  } else {
    bodyElement.classList.remove('pantalla-grande');
    bodyElement.classList.add('pantalla-pequena');
  }
}
$(document).ready(function () {
  $('.ui.dropdown').dropdown();

  $('.hamburger-menu').click(function () {
      $(this).toggleClass('active');
      $('.menu-hamburger').toggle();
  });

  $(window).resize(function () {
      var windowWidth = $(window).width();
      if (windowWidth > 767) {
          $('.hamburger-menu').removeClass('active');
          $('.menu-hamburger').hide();
      }
  });
});
$(document).ready(function() {
  // Maneja el clic en el elemento principal del menú
  $('.dropdown-main').on('click', function() {
    $(this).children('.menu-dropdown').toggleClass('active');
  });
});

$(document).ready(function() {
  $('#registro-btn').click(function() {
      $('#registro-content').load('/registro/');
      $('.registro-modal').modal('show');
  });
});
function toggleForm() {
  var personType = document.getElementById('person-type').value;
  var juridicaForm = document.getElementById('juridica-form');
  var naturalForm = document.getElementById('natural-form');
  var questionSection = document.getElementById('question-section');

  if (personType === 'juridica') {
    juridicaForm.style.display = 'block';
    naturalForm.style.display = 'none';
  } else if (personType === 'natural') {
    juridicaForm.style.display = 'none';
    naturalForm.style.display = 'block';
  } else {
    juridicaForm.style.display = 'none';
    naturalForm.style.display = 'none';
    questionSection.style.display = 'block';
  }
}
