<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script>
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart); 
google.charts.setOnLoadCallback(drawChart2); 

function drawChart() {
	var data = google.visualization.arrayToDataTable([
        ['회원 종류', '회원 수', { role: 'style' }],
        ['사업자회원', 8, 'gray'],            // RGB value
        ['일반회원', 10, '#76A7FA'],            // English color name
		]);
	var options = { title: '회원 통계' }; 
	var chart1 = new google.visualization.BarChart(document.getElementById('myBarChart')); 
	chart1.draw(data, options); 
	}
	
function drawChart2() {
    var data = google.visualization.arrayToDataTable([
        ['Task', 'Hours per Day'],
        ['Work',     11],
        ['Eat',      2],
        ['Commute',  2],
        ['Watch TV', 2],
        ['Sleep',    7]
      ]);

      var options = {
        is3D: true,
      };
    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data, options);
  }
google.charts.setOnLoadCallback(drawCurveTypes);

function drawCurveTypes() {
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Dogs');
      data.addColumn('number', 'Cats');

      data.addRows([
        [0, 0, 0],    [1, 10, 5],   [2, 23, 15],  [3, 17, 9],   [4, 18, 10],  [5, 9, 5],
        [6, 11, 3],   [7, 17, 19],  [8, 11, 25],  [9, 30, 32],  [10, 5, 24], [11, 30, 27],
        [12, 30, 50], [13, 40, 42], [14, 42, 21], [15, 47, 15], [16, 44, 36], [17, 48, 40],
      ]);

      var options = {
        hAxis: {
          title: 'Time'
        },
        vAxis: {
          title: 'Popularity'
        },
       curveType:'function'
      };

      var chart = new google.visualization.LineChart(document.getElementById('myAreaChart'));
      chart.draw(data, options);
    }
    
google.charts.load('current', {'packages':['table']});   
google.charts.setOnLoadCallback(drawTable2);

function drawTable2() {
  var data = new google.visualization.DataTable();
  data.addColumn('string', '이름');
  data.addColumn('string', '이메일');
  data.addColumn('string', '전화번호');
  data.addColumn('string', '회원종류');
  data.addColumn('boolean', '탈퇴여부');
  data.addRows([
    ['김선효', 'sunhyo67@gmail.com',  '01012345678','일반', true],
    ['Jim',  'sunhyo67@gmail.com', '01012345678', '일반', false],
    ['Alice','sunhyo67@gmail.com','01012345678','일반', true],
    ['Bob', 'sunhyo67@gmail.com', '01012345678', '일반', true]
  ]);

  var table = new google.visualization.Table(document.getElementById('tableChart'));

  table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
}
    
    
</script>

<style>
.container_field {
	width: 1200px;
	margin: 0 auto;
}

#pageTitle{

	margin-bottom: 60px;
	margin-top: 100px !important;
	font-size: 42px;
	font-family: 'Roboto', 'sans-serif';
	font-weight: bold;
}
</style>

</head>

<body>
	<%@ include file="../common/menubar.jsp"%>

    <div class="container_field">
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 id="pageTitle" class="mt-4">관리자 페이지</h1>
                    <ol class="breadcrumb mb-4"> </ol>

                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            	회원 비율
                        </div>
                        <div class="card-body"><div id="myAreaChart" width="100%" height="30"></div></div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar me-1"></i>
                                    Bar Chart Example
                                </div>
                                <div class="card-body"><div id="myBarChart" width="100%" height="50"></div></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    Pie Chart Example
                                </div>
                                <div class="card-body"><div id="donutchart" width="100%" height="50"> </div></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>

                    </div>
                      <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            	전체 회원 조회
                        </div>
                        <div class="card-body"><div id="tableChart" width="100%" height="30"></div></div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>
                    
                    
                </div>
            </main>
        </div>


    </div>
    
</body>


</html>