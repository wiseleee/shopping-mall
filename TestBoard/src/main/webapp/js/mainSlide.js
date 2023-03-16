const slideshow = document.getElementById("slideshow");
const slideDuration = 3000; // 3 seconds
let currentSlideIndex = 0;
let slideCount = slideshow.children.length;

function showNextSlide() {
  currentSlideIndex = (currentSlideIndex + 1) % slideCount;
  for (let i = 0; i < slideCount; i++) {
    slideshow.children[i].style.opacity = i === currentSlideIndex ? 1 : 0;
  }
  setTimeout(showNextSlide, slideDuration);
}

// reset currentSlideIndex to 0 if it exceeds slideCount
if (currentSlideIndex >= slideCount) {
  currentSlideIndex = 0;
}

// show the first slide
showNextSlide();
