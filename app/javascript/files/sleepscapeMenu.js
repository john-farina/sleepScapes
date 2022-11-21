const sleepscapeMenu = document.querySelector("#sleepscapeMenu");
const bottomMenu = document.querySelector("#bottomMenu");
const infoBtn = document.querySelector("#infoBtn");
const commentsBtn = document.querySelector("#commentsBtn");
const infoContainer = document.querySelector("#infoContainer");
const commentsContainer = document.querySelector("#commentsContainer");
let menuIsOpen = false;
let whichMenu = undefined;

if (sleepscapeMenu) {
  bottomMenu.style.display = "none";
  infoContainer.style.display = "none";
  commentsContainer.style.display = "none";

  infoBtn.addEventListener("click", () => {
    if (!menuIsOpen && whichMenu === undefined) {
      menuIsOpen = true;

      bottomMenu.style.display = "flex";

      infoContainer.style.display = "flex";

      whichMenu = "info";
      //OPEN WHATEVER MENU IS CLICKED
      //menuIsOpen = true
      //log which menu
    } else if (menuIsOpen && whichMenu === "info") {
      menuIsOpen = false;

      bottomMenu.style.display = "none";

      infoContainer.style.display = "none";

      whichMenu = undefined;

      //CLOSE THE MENU
      //menuIsOpen = false
      //log which menu back to undefined
    } else if (menuIsOpen && whichMenu === "comments") {
      menuIsOpen = true;

      commentsContainer.style.display = "none";

      infoContainer.style.display = "flex";

      whichMenu = "info";

      //KEEP MENU OPEN BUT CHANGE SCREEN TO THIS ONE
      //menyIsOpen = true
      //log which menu
    }
  });

  commentsBtn.addEventListener("click", () => {
    if (!menuIsOpen && whichMenu === undefined) {
      menuIsOpen = true;

      bottomMenu.style.display = "flex";

      commentsContainer.style.display = "flex";

      whichMenu = "comments";
    } else if (menuIsOpen && whichMenu === "comments") {
      menuIsOpen = false;

      bottomMenu.style.display = "none";

      commentsContainer.style.display = "none";

      whichMenu = undefined;
    } else if (menuIsOpen && whichMenu === "info") {
      menuIsOpen = true;

      infoContainer.style.display = "none";

      commentsContainer.style.display = "flex";

      whichMenu = "comments";
    }
  });
}
