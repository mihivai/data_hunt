import highchartsMore from 'highcharts/highcharts-more';

const chartPlot = () => {
  const chartContainer = document.getElementById("chart-container");
  if (chartContainer) {
    var Highcharts = require('highcharts');
    highchartsMore(Highcharts);
    require('highcharts/modules/exporting')(Highcharts);
    require('highcharts/modules/export-data')(Highcharts);
    require('highcharts/modules/accessibility')(Highcharts);

    // Highcharts.chart('chart-container', {
    //   chart: {
    //     type: 'spline'
    //   },
    //   title: {
    //     text: 'Trajectoire du boulet'
    //   },
    //   subtitle: {
    //     text: '28 avril 2019'
    //   },
    //   xAxis: {
    //     categories: [0.01, 50, 100, 300, 1000, 2000, 3000, 3010, 3020, 3030]
    //   },
    //   yAxis: {
    //     title: {
    //       text: 'Altitude'
    //     },
    //     labels: {
    //       formatter: function () {
    //         return this.value + 'm';
    //       }
    //     }
    //   },
    //   tooltip: {
    //     crosshairs: true,
    //     shared: true
    //   },
    //   plotOptions: {
    //     spline: {
    //       marker: {
    //         radius: 4,
    //         lineColor: '#666666',
    //         lineWidth: 1
    //       }
    //     }
    //   },
    //   series: [{
    //     name: '',
    //     marker: {
    //       symbol: 'square'
    //     },
    //     data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    //   }, {
    //     name: 'London',
    //     marker: {
    //       symbol: 'circle'
    //     },
    //     data: [{
    //       y: 0.03,
    //       marker: {
    //         symbol: 'url(https://res.cloudinary.com/dpilgpat0/image/upload/c_scale,w_50/v1615819805/Mihivai/data-hunt/cannon.png)'
    //       }
    //     }, 161, 281, 807, 2007, 1993]
    //   }]
    // });

    var averages = [
      [0.01, 0.03],
      [50, 161],
      [100, 281],
      [300, 807],
      [1000, 2007],
      [2000, 1993]
    ];

    var seaLevel = [{
        x: 0,
        y: 0,
        marker: {
          symbol: 'url(https://res.cloudinary.com/dpilgpat0/image/upload/c_scale,w_50/v1615819805/Mihivai/data-hunt/cannon.png)',
          enabled: true
        }
      },
      [50, 0],
      [100, 0],
      [300, 0],
      [1000, 0],
      [2000, 0],
      {x: 2900,
       y: 0,
       name: "2900 - Le comptoir des requins"
      },
      {x: 3010,
       y: 0,
       name: "3010 - L'aquarium aux tortues"
      },
      {x: 3120,
       y: 0,
       name: "3120 - Le carrefour des dauphins"
      },
      {x: 3230,
       y: 0,
       name: "3230 - La vallée des mantas"
      }
    ];

    // [
    //   [0.01, 0],
    //   [50, 0],
    //   [100, 0],
    //   [300, 0],
    //   [1000, 0],
    //   [2000, 0],
    //   [2900, 0],
    //   [3010, 0],
    //   [3120, 0],
    //   [3230, 0]
    // ];

    let chart = Highcharts.chart('chart-container', {

      chart: {
        type: 'spline'
      },

      title: {
        text: 'Trajectoire du boulet'
      },

      xAxis: {
        type: 'number',
        accessibility: {
          rangeDescription: '28 avril 2019'
        }
      },

      yAxis: {
        title: {
          text: null
        }
      },

      tooltip: {
        crosshairs: true,
        shared: true,
        valueSuffix: 'M'
      },
      plotOptions: {
        spline: {
          marker: {
            radius: 4,
            lineColor: 'black',
            lineWidth: 1
          }
        }
      },

      series: [
      {
        zIndex: 100,
        name: 'Spots',
        data: seaLevel,
        fillOpacity: 1,
        marker: {
          enabled: true
        }
      },

      {
        name: 'Altitude',
        data: averages,
        zIndex: 1,
        marker: {
          symbol: 'circle',
          fillColor: 'gray',
          lineWidth: 2,
          // lineColor: Highcharts.getOptions().colors[0]
        }
      }]

    });

    chart.reflow();

  }
}

export { chartPlot };
