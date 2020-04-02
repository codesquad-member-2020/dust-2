const displayTab = document.querySelector(".display-tab");
const forecastTab = document.querySelector(".forecast-tab");
const dustDisplay = document.querySelector("#dust-display");
const dustForecast = document.querySelector("#dust-forecast");

displayTab.addEventListener("touchend", e => {
  if (
    dustForecast.style.visibility === "hidden" &&
    dustDisplay.style.visibility === "visible"
  ) {
    return;
  }
  dustForecast.style.visibility = "hidden";
  dustDisplay.style.visibility = "visible";
});

forecastTab.addEventListener("touchend", e => {
  if (
    dustForecast.style.visibility === "visible" &&
    dustDisplay.style.visibility === "hidden"
  ) {
    return;
  }
  dustDisplay.style.visibility = "hidden";
  dustForecast.style.visibility = "visible";
});
