import regeneratorRuntime from "regenerator-runtime";
import { getDisplayData } from "../fetch/";
import makeChart from "./chart/chart";
import options from "./chart/chartOption";
import { dustStatusDisplay, dustChart } from "./view/";
import display from "./style/display.css";
import reset from "./style/reset.css";

export let chart;
export let dustData;

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
  const { station, airQualityInfos } = await getDisplayData();
  dustData = airQualityInfos;
  const targetDust = airQualityInfos[0];
  target.appendChild(dustStatusDisplay(station, targetDust));
  target.appendChild(dustChart());
  initialize();
};

mount(document.querySelector("#dust-display"));
