import { Howl } from "howler";
const audioTag = document.querySelector("#scapeAudio");
let audioSrc;

if (audioTag) {
  audioSrc = audioTag.src;
  audioTag.remove();

  var sound = new Howl({
    src: audioSrc,
    html5: true,
    autoplay: true,
    loop: true,
  });
}
