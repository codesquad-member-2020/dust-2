import Chart from "chart.js";
import { COLOR_FOR_LABEL } from "../../../constants/colors";
import { GRADE_TO_ENG } from "../../../constants/grade";

const makeChart = (context, dusts, options) => {
  const yLabels = dusts.map(dust => dust.dataTime);
  const data = dusts.map(dust => dust.pm10Value);
  const backgroundColor = dusts.map(
    dust => COLOR_FOR_LABEL[GRADE_TO_ENG[`${dust.pm10Grade1h}`]]
  );
  const chart = new Chart(context, {
    type: "horizontalBar",
    data: {
      labels: yLabels,
      datasets: [
        {
          label: "미세먼지 수치",
          backgroundColor,
          borderColor: "rgb(255, 99, 132)",
          barThickness: 20,
          padding: 10,
          data
        }
      ]
    },
    options
  });
  return chart;
};

export default makeChart;
