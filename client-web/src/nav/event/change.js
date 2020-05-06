export const handleDisplayTabTouch = e => {
  const displayTab = document.querySelector(".display-tab");
  const forecastTab = document.querySelector(".forecast-tab");
  const dustDisplay = document.querySelector("#dust-display");
  const dustForecast = document.querySelector("#dust-forecast");

  if (
    dustForecast.style.visibility === "hidden" &&
    dustDisplay.style.visibility === "visible"
  ) {
    return;
  }
  displayTab.classList.add("selected");
  forecastTab.classList.remove("selected");
  dustForecast.style.visibility = "hidden";
  dustDisplay.style.visibility = "visible";
};

export const handleForecastTabTouch = e => {
  const displayTab = document.querySelector(".display-tab");
  const forecastTab = document.querySelector(".forecast-tab");
  const dustDisplay = document.querySelector("#dust-display");
  const dustForecast = document.querySelector("#dust-forecast");

  if (
    dustForecast.style.visibility === "visible" &&
    dustDisplay.style.visibility === "hidden"
  ) {
    return;
  }
  displayTab.classList.remove("selected");
  forecastTab.classList.add("selected");
  dustDisplay.style.visibility = "hidden";
  dustForecast.style.visibility = "visible";
};
