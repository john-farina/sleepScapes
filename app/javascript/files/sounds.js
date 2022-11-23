const soundScapeParent = document.querySelector("#soundscapeParent");
const scapeSound = document.querySelector("#scapeAudio");
const volumeSlider = document.querySelector("#sliderRange");
// import Howl from "howler";
let audioSrc;

if (scapeSound) {
  audioSrc = scapeSound.src;
  scapeSound.remove();
  const audio = new Audio(audioSrc);

  audio.play();
  audio.volume = 0.5;
  audio.loop = true;

  console.log(volumeSlider.value);
  console.log("removed sound but this is source");

  console.log(audioSrc);
  let interval;
  volumeSlider.addEventListener("mousedown", () => {
    interval = setInterval(() => {
      let volume;

      if (volumeSlider.value <= 9) {
        volume = Number(".0" + volumeSlider.value.toString());
      } else if (volumeSlider.value == 10) {
        volume = 0.1;
      } else if (volumeSlider.value > 10 && volumeSlider.value < 100) {
        volume = Number("." + volumeSlider.value.toString());
      }

      audio.volume = volume;

      console.log(volume);
    }, 100);
  });
  volumeSlider.addEventListener("mouseup", () => {
    clearInterval(interval);
    console.log("done");
  });
}
