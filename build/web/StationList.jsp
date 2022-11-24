
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="AllLayout.*,com.connection.Stations,java.util.ArrayList,java.util.Iterator" %>
<%@ include file="header.jsp" %>

<% Stations sts = new Stations();
    if (request.getParameter("delete") != null) {
        String stsId = (String) request.getParameter("delete");
        sts.Delete(stsId);
    }
%>
<%
    if (request.getParameter("createStation") != null) {
        sts.name = (String) request.getParameter("name");
        sts.contact = (String) request.getParameter("contact");
        sts.address = (String) request.getParameter("address");
        sts.Save();
    }

    ArrayList<Station> stationList = sts.getAll();
    Iterator stationIterator = stationList.iterator();
%>



<div class="box successfully_purschase_ticket">

    <div class="box_title">
        <div class="row">
            <div class="col-xs-12 col-sm-4">
                Add New Station
            </div>
            <div class="col-xs-12 col-sm-8">
                All Stations
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-4">

            <form class="register_form" action="<%= Helper.baseUrl%>StationList.jsp" method="post">
                <div class="rs_form_box" style="margin:15px; padding:0; border:0;">
                    <div class="input-group">
                        <label>Name</label>
                        <input type="text" name="name" class="form-controller">
                    </div>
                    <div class="input-group">
                        <label>Contact</label>
                        <input type="text" name="contact" class="form-controller">
                    </div>
                    <div class="input-group">
                        <label>Address</label>
                        <input type="text" name="address" class="form-controller">
                    </div>
                    <div class="text-center">
                        <div class="rs_btn_group">
                            <button class="btn btn-default pull-left" name="createStation" value="submit" type="submit">Add </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-xs-12 col-sm-8">
            <br>
            <table class="table table-bordered">
                <tr>
                    <td>Name</td>
                    <td>Contact</td>
                    <td>Address</td>
                    <td>Action1</td>
                     <td>Action2</td>

                </tr>
                <%
                    while (stationIterator.hasNext()) {
                        Station st = (Station) stationIterator.next();
                %>
                <tr>
                    <td><%= st.name%></td>
                    <td><%= st.contact%></td>
                    <td><%= st.address%></td>
                    <td><a href="?delete=<%= st.id%>" class="btn btn-sm btn-danger">Delete</a></td>
                    <td><a href="UpdateStation.jsp?stationId=<%= st.id%>"class="btn btn-sm btn-primary">Update</a></td>
                </tr>
                <%
                    }

                %>

            </table>
        </div>


    </div>

</div>
<%@ include file="footer.jsp" %>