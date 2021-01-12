<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart1);
    function drawChart1() 
    {
        var data1 = google.visualization.arrayToDataTable(
            [["여행지"],["강원도",${m1}],["경기도",${m2}],["경상남도",${m3}],["경상북도",${m4}],["전라남도",${m5}],["전라북도",${m6}],["충청남도",${m7}],["충청북도",${m8}]]);
        var options1 = {
            title: "ㅎ_ㅇ"
        };
        var chart1 = new google.visualization.PieChart(document.getElementById("areacount"));
        chart1.draw(data1, options1);
    };
</script>
 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>    
<script type="text/javascript">
   
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart1);
    google.charts.setOnLoadCallback(drawChart2);    
    google.charts.setOnLoadCallback(drawChart3);    

       
    function drawChart1() {
    
        // Create the data table.
        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Topping');
        data1.addColumn('number', 'Slices');
        data1.addRows([
        ["강원도",${m1}],["경기도",${m2}],["경상남도",${m3}],["경상북도",${m4}],["전라남도",${m5}],["전라북도",${m6}],["충청남도",${m7}],["충청북도",${m8}],
        ]);
        
        // Set chart options
        var options1 = {'title':'지역',
                       'width':400,
                       'height':300};
        
        // Instantiate and draw our chart, passing in some options.
        
        var chart1 = new google.visualization.PieChart(document.getElementById('areacount'));
        chart1.draw(data1, options1);
    } 
                
    function drawChart2() {
    
        // Create the data table.
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Topping');
        data2.addColumn('number', 'Slices');
        data2.addRows([
        ["호캉스",${t1}],["청춘",${t2}],["자연",${t3}],["유적지",${t4}],["액티비티",${t5}],
        ]);
        // Set chart options
        var options2 = {'title':'여행성향',
                       'width':400,
                       'height':300,
                       'pieHole': 0.4,};
        // Instantiate and draw our chart, passing in some options.
        var chart2 = new google.visualization.PieChart(document.getElementById('tendencycount'));
        chart2.draw(data2, options2);
    }          
    
    function drawChart3() {
    
        // Create the data table.
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'Topping');
        data3.addColumn('number', 'Slices');
        data3.addRows([
        ["4명이내",${p1}],["5~8명",${p2}],["9명이상",${p3}],
        ]);
        // Set chart options
        var options3 = {'title':'인원수',
                       'width':400,
                       'height':300,
                       'pieHole': 0.4,};
        // Instantiate and draw our chart, passing in some options.
        var chart3 = new google.visualization.PieChart(document.getElementById('peoplecount'));
        chart3.draw(data3, options3);
    }                          
</script>
<!-- <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart2);
    function drawChart2() 
    {
        var data2 = google.visualization.arrayToDataTable(
            [["인원수"],["4명이내",${p1}],["5~8명",${p2}],["9명이상",${p3}]]
        );
        var options2 = {
            title: "ㅎ_ㅇd"
        };
        var chart2 = new google.visualization.PieChart(document.getElementById("peoplecount"));
        chart2.draw(data, options);
    }
</script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart3);

    function drawChart3() 
    {
        var data3 = google.visualization.arrayToDataTable(
            [["여행성향"],["호캉스",${t1}],["청춘",${t2}],["자연",${t3}],["유적지",${t4}],["액티비티",5]]
        );
        var options3 = {
            title: "ㅎ_ㅇd"
        };
        var chart3 = new google.visualization.PieChart(document.getElementById("tendencycount"));
        chart3.draw(data, options);
    }
</script>
 -->

</head>
<body>
 <div id="areacount"></div>

 <div id="peoplecount"></div>

 <div id="tendencycount"></div>

</body>
</html>