// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// 사용자 수 추이 Area Chart


const userincrease = new Array();
const Jan = document.getElementById('Jan').value;
const Feb = document.getElementById('Feb').value;
const Mar = document.getElementById('Mar').value;
const Apr = document.getElementById('Apr').value;
const May = document.getElementById('May').value;
const Jun = document.getElementById('Jun').value;
const Jul = document.getElementById('Jul').value;
const Aug = document.getElementById('Aug').value;
const Sep = document.getElementById('Sep').value;
const Oct = document.getElementById('Oct').value;
const nov = document.getElementById('nov').value;
const Dece = document.getElementById('Dece').value;
userincrease.push(Jan);
userincrease.push(Feb);
userincrease.push(Mar);
userincrease.push(Apr);
userincrease.push(May);
userincrease.push(Jun);
userincrease.push(Jul);
userincrease.push(Aug);
userincrease.push(Sep);
userincrease.push(Oct);
userincrease.push(nov);
userincrease.push(Dece);

var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    datasets: [{
      label: "사용자 수 ",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: [userincrease[0], userincrease[1], userincrease[2],userincrease[3],userincrease[4],userincrease[5],userincrease[6],userincrease[7],userincrease[8],
      userincrease[9],userincrease[10],userincrease[11],userincrease[12]],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
      }],
      yAxes: [{
        ticks: {
                min: 0,
				stepSize : 1
				
        
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
  }
});
