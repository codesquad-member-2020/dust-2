import regeneratorRuntime from "regenerator-runtime";
import { div, img, span, button } from "wonnie-template";
import {
  stopButtonHandler,
  pauseButtonHandler,
  barHandler,
  movingGaugeHandler,
  playButtonHandler
} from "../event";

export const header = () =>
  div({ class: "forecast-header" })(["미세먼지 예보"]);

const playButton = () =>
  div({ class: "play" })([
    span({ class: "material-icons", ontouchend: playButtonHandler })([
      "play_arrow"
    ])
  ]);

const pauseButton = () =>
  div({ class: "pause" })([
    span({ class: "material-icons", ontouchend: pauseButtonHandler })(["pause"])
  ]);

const stopButton = () =>
  div({ class: "stop" })([
    span({ class: "material-icons", ontouchend: stopButtonHandler })(["stop"])
  ]);

export const controller = () =>
  div({ class: "controller" })([playButton(), pauseButton(), stopButton()]);

export const gauge = () =>
  div({ class: "gauge" })([
    div({ class: "bar", ontouchmove: barHandler })(),
    button({ class: "blue-dot", ontouchmove: movingGaugeHandler })()
  ]);

export const informCauseDOM = informCause =>
  div({ class: "inform-cause" })([informCause]);

export const informGradeDOM = informGrade =>
  div({ class: "inform-grade" })([informGrade]);

export const imgSet = images => {
  const imageDOMS = images.map((src, index) => {
    if (index === 0) {
      return img({ src, style: "display: block;", class: "_image" })();
    }
    return img({ src, style: "display: none;", class: "_image" })();
  });
  return div({ class: "img-set" })(imageDOMS);
};
