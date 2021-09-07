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
google.charts.setOnLoadCallback(drawChart); function drawChart() {
	var data = google.visualization.arrayToDataTable([
        ['회원 종류', '회원 수', { role: 'style' }],
        ['사업자회원', 8, 'gray'],            // RGB value
        ['일반회원', 10, '#76A7FA'],            // English color name
		]);
	var options = { title: '회원 통계' }; 
	var chart = new google.visualization.BarChart(document.getElementById('myAreaChart')); 
	chart.draw(data, options); 
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
                                <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    Pie Chart Example
                                </div>
                                <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>


    </div>
    
</body>


</html>