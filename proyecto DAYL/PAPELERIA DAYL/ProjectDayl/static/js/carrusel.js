const swiper = new Swiper(".swiper-hero", {
    direction: "horizontal",
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    autoplay: {
        delay: 2000,
        disableOnInteraction: false,
    },
    loop: true,
});

swiper.on("slideChangeTransitionEnd", function () {
    swiper.autoplay.start();
});