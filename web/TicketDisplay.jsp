<%@page import="java.util.*,AllLayout.*,com.connection.*,AllLayout.*" %>
<%@ page import="com.connection.Helper,com.connection.*,java.sql.ResultSet.*" %>
<%
ArrayList<HashMap<String,String>> trains = new ArrayList<HashMap<String,String>>();
String stationTo = (String) request.getParameter("to");
String stationFrom = (String) request.getParameter("from");
String sBus = (String) request.getParameter("bus");
String journey_date = (String) request.getParameter("journey_date");
Station stationFromObj = new Station();
Station stationObj = new Station();
Station stationToObj = new Station();
if(stationTo != null || stationFrom != null){
	Stations tempStationsObj = new Stations();
	stationFromObj = tempStationsObj.getStation(stationFrom);
	stationToObj = tempStationsObj.getStation(stationTo);
}

%>


<%@ include file="header.jsp" %>
<%
String userId = null;
if(session.getAttribute("user_id") != null){
	userId = (String) session.getAttribute("user_id");
}
User user = new User(userId);
%>
<form class="ticket_selecting_form" action="<%= Helper.baseUrl %>FindTicket.jsp">
	<h2 class="title"><span>Bus Ticket Showing For ::</span> <%= stationFromObj.name %> to  <%= stationToObj.name %> <span>:: Journey Date -</span> <%= journey_date %> </h2>
</form>
<div id="rs_ticket_result">
<table class="table table-bordered">
			<tr>
				<td><strong>Full Name</strong></td>
				<td><%= user.name %></td>
			</tr>
			<tr>
				<td><strong>Email Address</strong></td>
				<td><%= user.email %></td>
			</tr>
			<tr>
				<td><strong>Cell Phone Number</strong></td>
				<td><%= user.phone %></td>
			</tr>
                        	<tr>
				<td><strong>Bus</strong></td>
				<td><%=sBus%></td>
			</tr>
			
		</table>
                        <a class="print-ticket" href="PrintTicket.jsp?from=<%=stationFrom%>&to=<%=stationTo%>&bus=<%=sBus%>&journey_date=<%=journey_date%>">Print Your Ticket Here</a>
</div>
<%@ include file='footer.jsp' %>