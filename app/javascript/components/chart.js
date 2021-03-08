const chartPlot = () => {
  const chartContainer = document.getElementById("chart-container");
  if (chartContainer) {
    var Highcharts = require('highcharts');
    require('highcharts/modules/exporting')(Highcharts);

    Highcharts.chart('chart-container', {
      chart: {
        type: 'spline'
      },
      title: {
        text: 'Monthly Average Temperature'
      },
      subtitle: {
        text: 'Source: WorldClimate.com'
      },
      xAxis: {
        categories: [1, 2, 3, 4, 5]
      },
      yAxis: {
        title: {
          text: 'Temperature'
        },
        labels: {
          formatter: function () {
            return this.value + '°';
          }
        }
      },
      tooltip: {
        crosshairs: true,
        shared: true
      },
      plotOptions: {
        spline: {
          marker: {
            radius: 4,
            lineColor: '#666666',
            lineWidth: 1
          }
        }
      },
      series: [{
        name: 'Tokyo',
        marker: {
          symbol: 'square'
        },
        data: [0, 0, 0, {
          y: 0,
          marker: {
            symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
          }
        }, 0]

      }, {
        name: 'London',
        marker: {
          symbol: 'diamond'
        },
        data: [{
          y: 1.2,
          marker: {
            symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
          }
        }, 2.1, 2.5, 2.7, 2.8]
      }]
    });
  }
}

export { chartPlot };
