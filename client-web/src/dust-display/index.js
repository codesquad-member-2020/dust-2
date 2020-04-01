import emojis from "../../constants/emojis";

const canvas = document.querySelector("#dust-chart");
const context = canvas.getContext("2d");
const img = document.querySelector(".dust-status-face img");
img.setAttribute("src", `./dist/${emojis.good}`);

const redraw = () => {
  context.strokeRect(0, 0, window.innerWidth, window.innerHeight);
};

const resizeCanvas = () => {
  canvas.width = window.innerWidth - 13;
  canvas.height = window.innerHeight;
  redraw();
};

const initialize = () => {
  window.addEventListener("resize", resizeCanvas);
  resizeCanvas();
};

initialize();
