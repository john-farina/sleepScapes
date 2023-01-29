const header = document.querySelector("#pageHeader");
const main = document.querySelector("#mainPage");
const menuBtn = document.querySelector("#menuButton");
const arrowIcon = document.querySelector("#arrowIcon");
const rootPage = document.querySelector("#rootPage");
const homePage = document.querySelector("#homePage");
const soundscapePage = document.querySelector("#soundscapePage");
let menuOpen = true;
let animationGoing = false;

function closeHeader() {
  animationGoing = true;

  main.classList.remove("smallMainStats");
  main.classList.add("wideMain");

  header.classList.add("closeHeader");

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
}

function openHeader() {
  animationGoing = true;

  menuBtn.classList.remove("moveBtnZero");
  menuBtn.classList.add("moveBtnRight");

  header.style.display = "flex";
  header.classList.add("openHeader");

  main.classList.remove("whiteMainStats");
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

    menuBtn.classList.remove("moveBtnRight");
    menuBtn.classList.remove("moveBtnZero");
    menuBtn.classList.add("moveBtnStats");

    menuOpen = true;

    animationGoing = false;
  }, 580);
}

menuBtn.addEventListener("click", () => {
  if (menuOpen && !animationGoing) {
    closeHeader();
  } else if (!menuOpen && !animationGoing) {
    openHeader();
  }
});

closeHeader();
