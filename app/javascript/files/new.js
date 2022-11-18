const header = document.querySelector("#pageHeader");
const main = document.querySelector("#mainPage");
const menuBtn = document.querySelector("#menuButton");
let menuOpen = true;
let animationGoing = false;

menuBtn.addEventListener("click", () => {
  if (menuOpen && !animationGoing) {
    main.classList.remove("smallMainStats");

    header.classList.add("closeHeader");

    main.classList.add("wideMain");

    animationGoing = true;

    setTimeout(() => {
      header.style.display = "none";

      header.classList.remove("closeHeader");

      main.classList.remove("wideMain");
      main.classList.add("wideMainStats");

      menuOpen = false;

      animationGoing = false;
    }, 580);
  } else if (!menuOpen && !animationGoing) {
    header.style.display = "flex";
    main.classList.remove("whiteMainStats");

    header.classList.add("openHeader");

    main.classList.add("smallMain");

    animationGoing = true;

    setTimeout(() => {
      header.classList.remove("openHeader");

      main.classList.remove("smallMain");

      main.classList.add("smallMainStats");

      menuOpen = true;

      animationGoing = false;
    }, 580);
  }
});
