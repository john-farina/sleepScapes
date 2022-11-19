const header = document.querySelector("#pageHeader");
const main = document.querySelector("#mainPage");
const menuBtn = document.querySelector("#menuButton");
const arrowIcon = document.querySelector("#arrowIcon");
let menuOpen = true;
let animationGoing = false;

menuBtn.addEventListener("click", () => {
  if (menuOpen && !animationGoing) {
    animationGoing = true;

    main.classList.remove("smallMainStats");

    header.classList.add("closeHeader");

    main.classList.add("wideMain");

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

      menuOpen = false;

      animationGoing = false;
    }, 580);
  } else if (!menuOpen && !animationGoing) {
    animationGoing = true;

    header.style.display = "flex";

    main.classList.remove("whiteMainStats");

    header.classList.add("openHeader");

    main.classList.add("smallMain");

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

      menuOpen = true;

      animationGoing = false;
    }, 580);
  }
});
