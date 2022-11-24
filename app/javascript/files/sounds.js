import { Howl } from "howler";
const scapeSound = document.querySelector("#scapeAudio");
const volumeSlider = document.querySelector("#sliderRange");
let audioSrc;

if (scapeSound) {
  audioSrc = scapeSound.src;
  scapeSound.remove();
  const sound = new Howl({
    src: [audioSrc],
    autoUnlock: true,
    html5: true,
    loop: true,
  });
  sound.once("load", () => {
    sound.play();
  });
}
