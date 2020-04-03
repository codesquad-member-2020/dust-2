const options = {
  animation: {
    duration: 2
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
};

export default options;
