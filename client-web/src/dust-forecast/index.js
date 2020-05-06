import regeneratorRuntime from "regenerator-runtime";
import {
  header,
  controller,
  gauge,
  informCauseDOM,
  informGradeDOM,
  imgSet
} from "./view/";
import { getForecastData } from "../fetch/";
import { startEvent } from "./event";
import css from "./style/forecast.css";

const mount = async target => {
  const { informOverall, informGrade, images } = await getForecastData();
  const children = [
    header(),
    imgSet(images),
    informCauseDOM(informOverall),
    informGradeDOM(informGrade),
    controller(),
    gauge()
  ];
  children.forEach(child => target.appendChild(child));
  startEvent();
};
mount(document.querySelector("#dust-forecast"));
