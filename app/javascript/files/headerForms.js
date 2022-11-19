const signInForm = document.querySelector("#signInHeader");
const signInBtn = document.querySelector("#signInButton");
let signInOpen = false;

signInForm.style.display = "none";

signInBtn.addEventListener("click", () => {
  if (!signInOpen) {
    signInOpen = true;
    signInForm.style.display = "flex";
  } else {
    signInOpen = false;
    signInForm.style.display = "none";
  }
});
