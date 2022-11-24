<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,com.connection.*,AllLayout.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    Stations stations = new Stations();
    ArrayList<Station> allStations = stations.getAll();
    String stationId = request.getParameter("stationId");
    Station station = stations.getStation(stationId);
    out.println(stationId);
%>
<% Stations sts = new Stations();
    if (request.getParameter("update") != null) {
        sts.name = (String) request.getParameter("name");
        sts.contact = (String) request.getParameter("contact");
        sts.address = (String) request.getParameter("address");
        out.println(sts.name + sts.contact + sts.address);
        try {
            sts.Update(stationId);
        } catch (Exception e) {
            out.println(e.toString());
        }

        response.sendRedirect("StationList.jsp");
    }
%>
<%@ include file="header.jsp" %>
<div class="signpage">
    <form class="register_form" method="post">
        <div class="rs_form_box" style="margin:15px; padding:0; border:0;">
            <div class="input-group">
                <label>Name</label>
                <input type="text" name="name" class="form-controller" value="<%=station.name%>">
            </div>
            <div class="input-group">
                <label>Contact</label>
                <input type="text" name="contact" class="form-controller" value="<%=station.contact%>">
            </div>
            <div class="input-group">
                <label>Address</label>
                <input type="text" name="address" class="form-controller" value="<%=station.address%>">
            </div>
            <div class="text-center">
                <div class="rs_btn_group">
                    <button class="btn btn-default pull-left" name="update" value="submit" type="submit">update </button>
                </div>
            </div>
        </div>
    </form>
</div>
<%@ include file='footer.jsp' %>