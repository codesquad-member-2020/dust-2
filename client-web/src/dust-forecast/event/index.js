let barLength;
let imgs;
let oneStepUnit;
let currentIndex = 0;
let xPos = 0;
let rAFId;
let isMoving = false;

export const startEvent = () => {
  barLength = document.querySelector(".bar").offsetWidth;
  imgs = [...document.querySelectorAll("#dust-forecast img")];
  oneStepUnit = parseInt(barLength / imgs.length);
};

const initializeDisplayedMap = () => {
  currentIndex = 0;
  imgs
    .filter(img => img.style.display === "block")
    .forEach(img => (img.style.display = "none"));
  imgs[currentIndex].style.display = "block";
  const movingGauge = document.querySelector(".gauge button");
  movingGauge.style.transform = `translateX(${0 + "px"})`;
};

const changeDisplayedMap = () => {
  const index = parseInt(xPos / oneStepUnit);
  if (index === currentIndex) {
    return;
  }

  if (index >= imgs.length) {
    initializeDisplayedMap();
    return;
  }
  currentIndex = index;
  imgs
    .filter(img => img.style.display === "block")
    .forEach(img => (img.style.display = "none"));
  imgs[index].style.display = "block";
};

const runGageAnimation = () => {
  xPos += 2;
  const gripBtn = document.querySelector(".gauge button");
  if (xPos > barLength) {
    xPos = 0;
    gripBtn.style.transform = `translateX(${xPos + "px"})`;
    isMoving = false;
    return;
  }
  changeDisplayedMap();

  gripBtn.style.transform = `translateX(${xPos + "px"})`;

  rAFId = requestAnimationFrame(runGageAnimation);
};

export const playButtonHandler = e => {
  if (!isMoving) {
    isMoving = true;
    runGageAnimation();
    return;
  }
};

export const movingGaugeHandler = e => {
  const touch = e.touches[0];
  const bufferX = touch.clientX - e.target.clientWidth / 2;
  const x = bufferX > 0 ? (bufferX < barLength ? bufferX : barLength) : 0;
  e.target.style.transform = `translateX(${x + "px"})`;
  xPos = x;
  changeDisplayedMap();
};

export const barHandler = e => {
  const touch = e.changedTouches[0];
  const movingGauge = document.querySelector(".gauge button");
  const boxSize = movingGauge.clientWidth / 2;
  const bufferX = touch.clientX - boxSize;
  const x = bufferX > 0 ? (bufferX < barLength ? bufferX : barLength) : 0;
  movingGauge.style.transform = `translateX(${x + "px"})`;
  xPos = x;
  changeDisplayedMap();
};

export const pauseButtonHandler = e => {
  cancelAnimationFrame(rAFId);
  changeDisplayedMap();
  isMoving = false;
};

export const stopButtonHandler = e => {
  cancelAnimationFrame(rAFId);
  xPos = 0;
  initializeDisplayedMap();
  isMoving = false;
};
