const animationCont = document.querySelector("#animationContainer");
let animationGoing = false;
const backVideo = document.querySelector("#indexVideo");
const rootPage = document.querySelector("#rootPage");

if (animationCont) {
  backVideo.controls = false;

  backVideo.play();

  function addRemoveAnimationClass() {
    animationCont.classList.add("scrollAnimation");

    animationGoing = true;

    setTimeout(() => {
      animationCont.classList.remove("scrollAnimation");

      animationGoing = false;
    }, 1700);
  }

  // start the animation after open
  setTimeout(() => {
    addRemoveAnimationClass();
  }, 400);

  animationCont.addEventListener("click", () => {
    backVideo.play();

    if (!animationGoing) {
      addRemoveAnimationClass();
    }
  });

  rootPage.addEventListener("click", () => {
    backVideo.play();

    if (!animationGoing) {
      addRemoveAnimationClass();
    }
  });
}
