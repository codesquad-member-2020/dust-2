import regeneratorRuntime from "regenerator-runtime";
import { getDisplayData } from "../fetch/";
import makeChart from "./chart/chart";
import options from "./chart/chartOption";
import { dustStatusDisplay, dustChart } from "./view/";
import display from "./style/display.css";
import reset from "./style/reset.css";

export let chart;
let dustData;

const redraw = () => {
  const context = document.querySelector("canvas").getContext("2d");
  chart = makeChart(context, dustData, options);
  context.strokeRect(0, 0, window.innerWidth, window.innerHeight);
};

const resizeCanvas = () => {
  const canvas = document.querySelector("canvas");
  canvas.width = window.innerWidth - 13;
  canvas.height = window.innerHeight;
  redraw();
};

const initialize = () => {
  window.addEventListener("resize", resizeCanvas);
  resizeCanvas();
};

const mount = async target => {
  const { location, dusts } = await getDisplayData();
  dustData = dusts;
  const targetDust = dusts[0];
  target.appendChild(dustStatusDisplay(location, targetDust));
  target.appendChild(dustChart());
  initialize(dusts);
};

mount(document.querySelector("#dust-display"));
