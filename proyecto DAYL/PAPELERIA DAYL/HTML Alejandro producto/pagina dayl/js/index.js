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
$(document).ready(function () {
  // Maneja el clic en el elemento principal del menú
  $('.dropdown-main').on('click', function () {
    $(this).children('.menu-dropdown').toggleClass('active');
  });
});

//agregado 9 de julio//

const menuContainer = document.querySelector('.menu-container');
const contUl = document.querySelector('.cont-ul');
const hamburgerMenu = document.querySelector('.hamburger-menu');
const hamburgerUl = document.querySelector('.hamburger-ul');

function checkWindowSize() {
  if (window.innerWidth < 1100) {
    contUl.style.display = 'none';
    hamburgerMenu.style.display = 'block';
  } else {
    contUl.style.display = 'flex';
    hamburgerMenu.style.display = 'none';
    hamburgerUl.style.display = 'none';
  }
}

function toggleHamburgerMenu() {
  if (hamburgerUl.style.display === 'block') {
    hamburgerUl.style.display = 'none';
  } else {
    hamburgerUl.style.display = 'block';
  }
}

checkWindowSize();

window.addEventListener('resize', checkWindowSize);
hamburgerMenu.addEventListener('click', toggleHamburgerMenu);


//10 de julio//

$(document).ready(function () {
  $('.hamburger-icon').click(function () {
    $('.hamburger-ul').slideToggle();
  });

  // Controla la apertura y desplazamiento del submenú
  $('.hamburger-ul .develop').click(function () {
    $(this).toggleClass('active');
    $(this).find('.ul-second').slideToggle();
    $(this).siblings().removeClass('active');
    $(this).siblings().find('.ul-second').slideUp();
    $('html, body').animate({
      scrollTop: $(this).offset().top
    }, 500);
  });
});

function toggleHamburgerMenu() {
  const hamburgerUl = document.querySelector('.hamburger-ul');
  if (hamburgerUl.style.display === 'block') {
    hamburgerUl.style.display = 'none';
  } else {
    hamburgerUl.style.display = 'block';
  }
}

document.querySelector('.hamburger-icon').addEventListener('click', toggleHamburgerMenu);

