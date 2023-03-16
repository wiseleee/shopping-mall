window.onload = function() {
  const images = document.querySelectorAll('.product-images img');

  if (images.length > 0) {
    let currentIndex = 0;

    function runSlideShow() {
      images[currentIndex].classList.remove('visible');
      currentIndex = (currentIndex + 1) % images.length;
      images[currentIndex].classList.add('visible');
      setTimeout(runSlideShow, 2000);
    }

    runSlideShow();
  }
};
