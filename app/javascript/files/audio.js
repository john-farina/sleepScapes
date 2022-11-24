import { Howl, Howler } from "howler";
const audioTag = document.querySelector("#soundscapeAudio");
const playBtn = document.querySelector("#scapePlayBtn");
const pauseBtn = document.querySelector("#scapePauseBtn");
const volumeSlider = document.querySelector("#audioVolume");

if (audioTag) {
  let volumeInterval;
  audioTag.remove();
  Howler.volume(0.37);

  function zeroToHundredDecimal(value) {
    if (value <= 9) {
      return Number(".0" + value);
    } else if (value == 10) {
      return Number("0.1");
    } else if (value > 10 && value < 100) {
      return Number("." + value);
    } else if (value == 100) {
      return Number("1");
    }
  }

  let soundScape = new Howl({
    src: audioTag.src,
    autoplay: true,
    loop: true,
    onplay: () => {
      playBtn.style.display = "none";
      pauseBtn.style.display = "flex";
    },
    onpause: () => {
      playBtn.style.display = "flex";
      pauseBtn.style.display = "none";
    },
  });

  volumeSlider.addEventListener("mousedown", () => {
    console.log("click");
    volumeInterval = setInterval(() => {
      Howler.volume(zeroToHundredDecimal(volumeSlider.value));
    }, 50);
  });

  volumeSlider.addEventListener("mouseup", () => {
    console.log("unclick");
    clearInterval(volumeInterval);
  });

  playBtn.addEventListener("click", () => {
    soundScape.play();
  });

  pauseBtn.addEventListener("click", () => {
    soundScape.pause();
  });
}
