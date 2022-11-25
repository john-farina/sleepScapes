const animationCont = document.querySelector("#animationContainer");

if (animationCont) {
  setTimeout(() => {
    animationCont.classList.add("scrollAnimation");
  }, 300);
}
