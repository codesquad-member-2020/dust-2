import Chart from "chart.js";
import emojis from "../../constants/emojis";

const canvas = document.querySelector("#dust-chart");
const context = canvas.getContext("2d");
const img = document.querySelector(".dust-status-face img");
img.setAttribute("src", `./dist/${emojis.good}`);

const makeChart = () => {
  const chart = new Chart(context, {
    type: "horizontalBar",
    data: {
      labels: [
        "07:00",
        "08:00",
        "09:00",
        "10:00",
        "11:00",
        "12:00",
        "13:00",
        "14:00",
        "15:00",
        "16:00",
        "17:00",
        "18:00",
        "19:00",
        "20:00",
        "21:00",
        "22:00",
        "23:00",
        "00:00",
        "01:00",
        "02:00",
        "03:00",
        "04:00",
        "05:00",
        "06:00"
      ],
      datasets: [
        {
          backgroundColor: [
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E",
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E",
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E",
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E",
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E",
            "#3DACF7",
            "#00DA86",
            "#F3AF22",
            "#FA594E"
          ],
          borderColor: "rgb(255, 99, 132)",
          barThickness: 20,
          padding: 10,
          data: [
            9,
            100,
            50,
            20,
            200,
            30,
            28,
            65,
            99,
            21,
            88,
            100,
            23,
            37,
            59,
            11,
            100,
            176,
            200,
            198,
            138,
            122,
            134,
            190
          ]
        }
      ]
    },

    // Configuration options go here
    options: {
      animation: {
        duration: 2 // general animation time
      },
      responsive: false,
      scales: {
        yAxes: [
          {
            position: "right",
            ticks: {
              mirror: true
            },
            gridLines: {
              display: false
            }
          }
        ],
        xAxes: [
          {
            ticks: {
              mirror: true,
              stepSize: 25,
              suggestedMax: 200,
              suggestedMin: 0
            },
            gridLines: {
              display: false
            }
          }
        ]
      }
    }
  });
};

const redraw = () => {
  context.strokeRect(0, 0, window.innerWidth, window.innerHeight);
  makeChart();
};

const resizeCanvas = () => {
  canvas.width = window.innerWidth - 13;
  canvas.height = window.innerHeight;
  redraw();
};

const initialize = () => {
  window.addEventListener("resize", resizeCanvas);
  resizeCanvas();
};

initialize();
