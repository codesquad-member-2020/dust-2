import regeneratorRuntime from "regenerator-runtime";
import emojis from "../../../constants/emojis";
import { GRADE, GRADE_TO_ENG } from "../../../constants/grade";
import { COLOR_FOR_BACKGROUND } from "../../../constants/colors";
import chartScrollHandler from "../event/scroll";
import { div, img, canvas } from "wonnie-template";

const header = () => {
  return div({ class: "header" })(["미세먼지 앱"]);
};

const statusFace = ({ pm10Grade1h }) => {
  const src = emojis[GRADE_TO_ENG[`${pm10Grade1h}`]];
  return div({ class: "dust-status-face" })([
    img({
      src: `./dist/${src}`
    })([])
  ]);
};

const statusText = ({ pm10Grade1h }) => {
  return div({ class: "dust-status-text" })([GRADE[`${pm10Grade1h}`]]);
};

const todayStatus = ({ dataTime, pm10Value }) => {
  return div({ class: "dust-status-today" })([
    div({ class: "current-dust" })([pm10Value]),
    div({ class: "current-time" })([`${dataTime}`])
  ]);
};

const dustObservation = ({ stationName }) => {
  return div({ class: "dust-observation-station" })([`${stationName} 측정소`]);
};

export const dustStatusDisplay = (station, targetDust) => {
  const { pm10Grade1h } = targetDust;
  return div({
    class: "dust-status-display",
    style: `background: ${COLOR_FOR_BACKGROUND[GRADE_TO_ENG[pm10Grade1h]]}`
  })([
    header(),
    statusFace(targetDust),
    statusText(targetDust),
    todayStatus(targetDust),
    dustObservation(station)
  ]);
};

export const dustChart = () => {
  return div({
    class: "dust-chart",
    onScroll: chartScrollHandler
  })([canvas({ id: "dust-chart" })()]);
};
