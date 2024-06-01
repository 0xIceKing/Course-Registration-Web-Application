    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Học kỳ", "Điểm"],
        ["Học kỳ 1", 8.94],
        ["Học kỳ 2", 6.49],
        ["Học kỳ 3", 6.30],
        ["Học kỳ 4", 7.45]
      ]);

      var view = new google.visualization.DataView(data);
		view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" }]);
      const options = {
		title:'Điểm thi theo học kì',
      	bars: 'vertical',
        bar: {groupWidth: "65%"},
        legend: { position: "none" },
          vAxis: {
            minValue: 0,
            maxValue: 10,
            title: 'Điểm của bạn'
            }    
           };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }