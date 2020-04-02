import { displayTab, forecastTab } from "./view";
import css from "./style/nav.css";

const mount = target => {
  target.appendChild(displayTab());
  target.appendChild(forecastTab());
};

mount(document.querySelector(".dust-nav"));
