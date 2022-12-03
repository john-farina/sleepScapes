const animationCont = document.querySelector("#animationContainer");
let animationGoing = false;
const backVideo = document.querySelector("#indexVideo");
const rootPage = document.querySelector("#rootPage");

if (animationCont) {
  setTimeout(() => {
    animationCont.classList.add("scrollAnimation");
    animationGoing = true;
    setTimeout(() => {
      backVideo.controls = false;
      backVideo.play();
      animationCont.classList.remove("scrollAnimation");
      animationGoing = false;
    }, 1700);
  }, 400);

  animationCont.addEventListener("click", () => {
    backVideo.play();
    if (!animationGoing) {
      animationCont.classList.add("scrollAnimation");
      animationGoing = true;
      setTimeout(() => {
        animationCont.classList.remove("scrollAnimation");
        animationGoing = false;
      }, 1700);
    }
  });

  rootPage.addEventListener("click", () => {
    backVideo.play();
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
