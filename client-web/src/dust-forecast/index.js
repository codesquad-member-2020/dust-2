const barLength = document.querySelector(".bar").offsetWidth;
const imgs = [...document.querySelectorAll("#dust-forecast img")];

const oneStepUnit = parseInt(barLength / imgs.length);
let currentIndex = 0;
let xPos = 0;
let rAFId;
let isMoving = false;

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

const play = () => {
  const controllerBtn = document.querySelector(".play span");
  controllerBtn.addEventListener("touchend", e => {
    if (!isMoving) {
      isMoving = true;
      runGageAnimation();
      return;
    }
  });
};

const move = () => {
  const movingGauge = document.querySelector(".gauge button");
  movingGauge.addEventListener("touchmove", e => {
    const touch = e.touches[0];
    const bufferX = touch.clientX - e.target.clientWidth / 2;
    const x = bufferX > 0 ? (bufferX < barLength ? bufferX : barLength) : 0;
    e.target.style.transform = `translateX(${x + "px"})`;
    xPos = x;
    changeDisplayedMap();
  });
};

const barMove = () => {
  const bar = document.querySelector(".bar");
  bar.addEventListener("touchmove", e => {
    const touch = e.changedTouches[0];
    const movingGauge = document.querySelector(".gauge button");
    const boxSize = movingGauge.clientWidth / 2;
    const bufferX = touch.clientX - boxSize;
    const x = bufferX > 0 ? (bufferX < barLength ? bufferX : barLength) : 0;
    movingGauge.style.transform = `translateX(${x + "px"})`;
    xPos = x;
    changeDisplayedMap();
  });
};

const pause = () => {
  const pauseBtn = document.querySelector(".pause span");
  pauseBtn.addEventListener("touchend", e => {
    cancelAnimationFrame(rAFId);
    changeDisplayedMap();
    isMoving = false;
  });
};

const stop = () => {
  const stopBtn = document.querySelector(".stop span");
  stopBtn.addEventListener("touchend", e => {
    cancelAnimationFrame(rAFId);
    xPos = 0;
    initializeDisplayedMap();
    isMoving = false;
  });
};

play();
pause();
stop();
move();
barMove();
