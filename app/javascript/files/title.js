const animationCont = document.querySelector("#animationContainer");
let animationGoing = false;
if (animationCont) {
  setTimeout(() => {
    animationCont.classList.add("scrollAnimation");
    animationGoing = true;
    setTimeout(() => {
      animationCont.classList.remove("scrollAnimation");
      animationGoing = false;
    }, 1700);
  }, 400);

  animationCont.addEventListener("click", () => {
    if (!animationGoing) {
      animationCont.classList.add("scrollAnimation");
      animationGoing = true;
      setTimeout(() => {
        animationCont.classList.remove("scrollAnimation");
        animationGoing = false;
      }, 1700);
    }
  });
}
