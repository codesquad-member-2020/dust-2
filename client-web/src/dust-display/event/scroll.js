import { chart, dustData } from "../index";
import { LABEL_UNIT } from "../../../constants/chart";
import { COLOR_FOR_BACKGROUND } from "../../../constants/colors";
import { GRADE_TO_ENG, GRADE } from "../../../constants/grade";
import emojis from "../../../constants/emojis";

const calculateDistanceFromTop = target => {
  return (target.scrollTop - target.clientTop - LABEL_UNIT) / LABEL_UNIT > 0
    ? (target.scrollTop - target.clientTop - LABEL_UNIT) / LABEL_UNIT
    : 0;
};

const applyResultToDisplay = (dustMeasure, label, index) => {
  const dustRank = dustData[index]["pm10Grade"];
  const engRank = GRADE_TO_ENG[`${dustRank}`];
  document.querySelector(".dust-status-display").style.background =
    COLOR_FOR_BACKGROUND[engRank];
  document.querySelector(".current-dust").innerHTML = dustMeasure;
  document.querySelector(".current-time").innerHTML = label;
  document.querySelector(".dust-status-text").innerHTML = GRADE[`${dustRank}`];
  document
    .querySelector(".dust-status-face img")
    .setAttribute("src", `./dist/${emojis[engRank]}`);
};

export const chartScrollHandler = e => {
  const index = parseInt(calculateDistanceFromTop(e.target));
  const meta = chart.getDatasetMeta(0);
  const dustMeasure = meta.controller._data[index];
  const label = meta.data[index]._model.label;

  applyResultToDisplay(dustMeasure, label, index);
};

export default chartScrollHandler;
