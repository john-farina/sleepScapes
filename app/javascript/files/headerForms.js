const signInForm = document.querySelector("#signInHeader");
const signInBtn = document.querySelector("#signInButton");
const pageHeader = document.querySelector("#pageHeader");
let signInOpen = false;
if (signInBtn) {
  signInForm.style.display = "none";

  signInBtn.addEventListener("click", () => {
    if (!signInOpen) {
      signInOpen = true;
      signInForm.style.display = "flex";
      pageHeader.style.width = "350px";
    } else {
      signInOpen = false;
      signInForm.style.display = "none";
      pageHeader.style.width = "";
    }
  });
}
