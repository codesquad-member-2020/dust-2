import { li } from "wonnie-template";
import { handleDisplayTabTouch, handleForecastTabTouch } from "../event/change";

export const displayTab = () =>
  li({
    class: "display-tab dust-tab selected",
    ontouchend: handleDisplayTabTouch
  })(["미세먼지"]);
export const forecastTab = () =>
  li({ class: "forecast-tab dust-tab", ontouchend: handleForecastTabTouch })([
    "예보"
  ]);
