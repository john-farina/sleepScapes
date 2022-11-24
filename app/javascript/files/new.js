const header = document.querySelector("#pageHeader");
const main = document.querySelector("#mainPage");
const menuBtn = document.querySelector("#menuButton");
const arrowIcon = document.querySelector("#arrowIcon");
let menuOpen = true;
let animationGoing = false;
if (menuBtn) {
  menuBtn.addEventListener("click", () => {
    ///CLOSE
    if (menuOpen && !animationGoing) {
      animationGoing = true;

      main.classList.remove("smallMainStats");

      header.classList.add("closeHeader");

      main.classList.add("wideMain");

      menuBtn.classList.remove("moveBtnStats");
      menuBtn.classList.add("moveBtnLeft");

      arrowIcon.classList.add("rightAnimation");

      setTimeout(() => {
        arrowIcon.classList.remove("left");
        arrowIcon.classList.add("right");
        arrowIcon.classList.remove("rightAnimation");
      }, 400);

      setTimeout(() => {
        header.style.display = "none";

        header.classList.remove("closeHeader");

        main.classList.remove("wideMain");
        main.classList.add("wideMainStats");

        menuBtn.classList.add("moveBtnZero");
        menuBtn.classList.remove("moveBtnLeft");

        menuOpen = false;

        animationGoing = false;
      }, 580);
    } else if (!menuOpen && !animationGoing) {
      animationGoing = true;
      menuBtn.classList.remove("moveBtnZero");

      header.style.display = "flex";

      main.classList.remove("whiteMainStats");

      header.classList.add("openHeader");

      main.classList.add("smallMain");

      menuBtn.classList.add("moveBtnRight");

      arrowIcon.classList.add("leftAnimation");
      setTimeout(() => {
        arrowIcon.classList.remove("right");
        arrowIcon.classList.add("left");
        arrowIcon.classList.remove("leftAnimation");
      }, 400);

      setTimeout(() => {
        header.classList.remove("openHeader");

        main.classList.remove("smallMain");

        main.classList.add("smallMainStats");

        menuBtn.classList.remove("moveBtnRight");
        menuBtn.classList.remove("moveBtnZero");
        menuBtn.classList.add("moveBtnStats");

        menuOpen = true;

        animationGoing = false;
      }, 580);
    }
  });
}
