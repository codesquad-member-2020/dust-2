const dustDisplay = document.querySelector("#dust-display");
const dustForecast = document.querySelector("#dust-forecast");

let startingX;

const displayTouchStart = e => {
  startingX = e.touches[0].clientX;
};

const forecastTouchStart = e => {
  startingX = e.touches[0].clientX;
  dustDisplay.style.transition = "";
  dustForecast.style.transition = "";
  dustDisplay.style.display = "block";
};

const displayTouchMove = e => {
  const touch = e.touches[0];
  const change = startingX - touch.clientX;

  if (change < 0) {
    return;
  }

  dustDisplay.style.left = `-${change}px`;
  dustForecast.style.display = "block";
  dustForecast.style.left = `${screen.width - change}px`;
  e.preventDefault();
};

const forecastTouchMove = e => {
  const touch = e.touches[0];
  const change = touch.clientX - startingX;
  if (change < 0) {
    return;
  }
  dustDisplay.style.display = "block";
  dustDisplay.style.left = `${change - screen.width}px`;
  dustForecast.style.left = `${change}px`;
  e.preventDefault();
};

const displayTouchEnd = e => {
  const change = startingX - e.changedTouches[0].clientX;
  const threshold = screen.width / 3;
  if (change < threshold) {
    dustDisplay.style.left = 0;
    dustForecast.style.left = "100%";
    dustForecast.style.display = "none";
    return;
  }
  dustDisplay.style.transition = "all .3s";
  dustForecast.style.transition = "all .3s";
  dustDisplay.style.left = "-100%";
  dustForecast.style.left = 0;
  dustForecast.style.display = "block";
};

const forecastTouchEnd = e => {
  const change = e.changedTouches[0].clientX - startingX;
  const half = screen.width / 4;
  if (change < half) {
    dustDisplay.style.left = "-100%";
    dustDisplay.style.display = "none";
    dustForecast.style.left = "0";
    return;
  }
  dustDisplay.style.transition = "all .3s";
  dustForecast.style.transition = "all .3s";
  dustDisplay.style.left = "0";
  dustForecast.style.left = "100%";
};

dustDisplay.addEventListener("touchstart", displayTouchStart);
dustDisplay.addEventListener("touchmove", displayTouchMove);
dustDisplay.addEventListener("touchend", displayTouchEnd);
dustForecast.addEventListener("touchstart", forecastTouchStart);
dustForecast.addEventListener("touchmove", forecastTouchMove);
dustForecast.addEventListener("touchend", forecastTouchEnd);
