const sleepscapeMenu = document.querySelector("#sleepscapeMenu");
const bottomMenu = document.querySelector("#bottomMenu");
const infoBtn = document.querySelector("#infoBtn");
const commentsBtn = document.querySelector("#commentsBtn");
const infoContainer = document.querySelector("#infoContainer");
const commentsContainer = document.querySelector("#commentsContainer");
let menuIsOpen = false;

function displayFlex(object) {
  object.style.display = "flex";
}

function displayNone(object) {
  object.style.display = "none";
}

let whichMenu = undefined;

if (sleepscapeMenu) {
  displayNone(bottomMenu);
  displayNone(infoContainer);
  displayNone(commentsContainer);

  infoBtn.addEventListener("click", () => {
    if (!menuIsOpen && whichMenu === undefined) {
      menuIsOpen = true;
      whichMenu = "info";

      displayFlex(bottomMenu);
      displayFlex(infoContainer);
    } else if (menuIsOpen && whichMenu === "info") {
      menuIsOpen = false;
      whichMenu = undefined;

      displayNone(bottomMenu);
      displayNone(infoContainer);
    } else if (menuIsOpen && whichMenu === "comments") {
      menuIsOpen = true;
      whichMenu = "info";

      displayNone(commentsContainer);

      displayFlex(infoContainer);
    }
  });

  commentsBtn.addEventListener("click", () => {
    if (!menuIsOpen && whichMenu === undefined) {
      menuIsOpen = true;
      whichMenu = "comments";

      displayFlex(bottomMenu);
      displayFlex(commentsContainer);
    } else if (menuIsOpen && whichMenu === "comments") {
      menuIsOpen = false;
      whichMenu = undefined;

      displayNone(bottomMenu);
      displayNone(commentsContainer);
    } else if (menuIsOpen && whichMenu === "info") {
      menuIsOpen = true;
      whichMenu = "comments";

      displayNone(infoContainer);

      displayFlex(commentsContainer);
    }
  });
}
