const xValues = ["Đã tích lũy", "Chưa tích lũy"];
const yValues = [86,121-86];
const barColors = [
  "#b91d47",
  "#00aba9"];
var mes =  String(yValues[0])+ "/" + String(yValues[0]+yValues[1]);
new Chart("myChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Tổng số tín chỉ: " + mes
    }
  }
});