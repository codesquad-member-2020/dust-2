import API from "../../constants/api";

export const getForecastData = async () => {
  const response = await fetch(API.FORECAST);
  const result = await response.json();
  return result;
};

export const getDisplayData = async () => {
  const response = await fetch(API.DUST);
  const result = await response.json();
  return result;
};
