<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
   Object error = session.getValue("error");
   session.removeAttribute("error");
   String errorStr = "";
	if (error != null) {
		errorStr = error.toString();
	}
%>

<jsp:useBean id="weights" class="com.tillg.WellnessMeter.UserWeights"
	scope="request" />

<html>
<head>
<title>Wellness-O-Meter</title>

    <script src="libraries/RGraph.common.adjusting.js" ></script>
    <script src="libraries/RGraph.common.core.js" ></script>
    <script src="libraries/RGraph.common.context.js" ></script>
    <script src="libraries/RGraph.common.tooltips.js" ></script>
    <script src="libraries/RGraph.common.zoom.js" ></script>
    <script src="libraries/RGraph.modaldialog.js" ></script>

    <script src="libraries/RGraph.line.js" ></script>
    <script src="libraries/RGraph.bar.js" ></script>
    <script src="libraries/RGraph.rose.js" ></script>

</head>
<body>
<h1>Weights</h1>

<c:if test="${errorStr!=''}">
	<p><%= errorStr %></p>
</c:if>

<form ACTION="AddWeight" METHOD="post">Date: <input NAME="date"
	TYPE="text" SIZE="40" /> Weight: <input NAME="weightvalue" TYPE="text"
	SIZE="40" /> <input TYPE="submit" VALUE="Add" /></form>

<table BORDER="1">
	<c:forEach items="${weights.weightsForDisplay}" var="m">
		<tr>
			<td>${m.dateStr4Display}</td>
			<td>${m.weightValue}</td>
		</tr>
	</c:forEach>
</table>

    <div style="width: 475px; float: right">

<script>
    function drawIt()
    {
        var data = [10,4,17,50,25,19,20,25,30,29,30,29];
    
        var line = new RGraph.Line("myLine", data);
        line.Set('chart.background.barcolor1', 'rgba(255,255,255,1)');
        line.Set('chart.background.barcolor2', 'rgba(255,255,255,1)');
        line.Set('chart.background.grid.color', 'rgba(238,238,238,1)');
        line.Set('chart.colors', ['rgba(255,0,0,1)']);
        line.Set('chart.linewidth', 2);
        line.Set('chart.filled', true);
        line.Set('chart.hmargin', 5);
        line.Set('chart.labels', ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']);
        line.Set('chart.gutter', 40);
        line.Draw();
    }
    
    
</script>
</div>
</body>
</html>