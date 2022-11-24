
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,AllLayout.*,com.connection.*,AllLayout.*" %>
<%@ page import="com.connection.Helper,com.connection.*,java.sql.ResultSet.*" %>
  <%
            ArrayList<HashMap<String, String>> trains = new ArrayList<HashMap<String, String>>();
            String stationTo = (String) request.getParameter("to");
            String stationFrom = (String) request.getParameter("from");
            String sBus = (String) request.getParameter("bus");
            String journey_date = (String) request.getParameter("journey_date");
            Station stationFromObj = new Station();
            Station stationBusObj = new Station();
            Station stationObj = new Station();
            Station stationToObj = new Station();
            if (stationTo != null || stationFrom != null) {
                Stations tempStationsObj = new Stations();
                stationFromObj = tempStationsObj.getStation(stationFrom);
                stationToObj = tempStationsObj.getStation(stationTo);
            }

        %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Printing Ticket</title>
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Rye&display=swap");
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;900&display=swap");

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: "Poppins", sans-serif;
            }

            body,
            html {
                height: 100vh;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                min-height: 100vh;
                background: #F0F8FF;
            }
            h1,
            h2,
            h3 {
                font-family: italic small-caps bold 12px/30px Georgia, serif;
            }
            p {
                font-family: 15px Arial, sans-serif;
                font-size: 0.8rem;
            }
            h3 {
                font-size: 0.8rem;
            }
              h3 {
                font-size: 0.8rem;
            }
            .ticket {
                width: 700px;
                max-width: 700px;
                background: #fff;
                border-radius: 20px;
                overflow: hidden;
                position: relative;
            }
            .ticket::before {
                content: "";
                position: absolute;
                left: 470px;
                height: 100%;
                width: 10px;
                background: #73C2FB;
            }
            .ticket::after {
                content: "";
                position: absolute;
                bottom: 61px;
                height: 10px;
                width:100%;
                background: #73C2FB;
            }
            .block {
                width: 470px;
                height: 250px;
                padding: 1em;
                background: #004792;
                color: #fff;
                position: relative;
            }
            .boarding {
                display: flex;
                justify-content: space-between;
            }
            .boarding h1 {
                letter-spacing: 1px;
            }
            .till {
                margin-top: 5px;
            }
            .till p {
                font-size: 1rem;
                letter-spacing: 1px;
            }
            .till span {
                display: block;
                font-size: 0.7rem;
            }
            .content {
                width: 75%;
                padding-left: 1em;
                margin-top: 1em;
                line-height: 1.6;
            }
            .to {
                display: flex;
                justify-content: space-between;
            }
            .price {
                letter-spacing: 1px;
                font-weight: 500;
            }
            .scan {
                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                bottom: 70px;
                right: 30px;
            }
            .scan img {
                width: 100px;
                height: 100px;
            }
            .section-2 {
                display: flex;
                justify-content: space-evenly;
                align-items: center;
                width: 75%;
                padding: 1em 2em 1em 0;
                line-height: 1.6;
                text-align: center;
                color: #2e2c63;
            }

            .left-side {
                position: absolute;
                top: 10px;
                right: 30px;
                color: #2e2c63;
                text-align: center;
                line-height: 1.6;
            }
            .left-side div {
                margin-top: 0.7em;
            }
            .left-side h3 {
                font-size: 0.8em;
            }
            .left-side .section-2 {
                padding: 0.2em;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto;
            }

            .left-side .section-2 div {
                padding: 0.3em;
                background: #715fa4;
                color: #fff;
                font-family: verdana;
            }
            .left-side .time {
                position: absolute;
                bottom: -138px;
                right: 0;
                text-align:left;
                margin: 0 auto;
                font-size:15px;
             
            }
            
            
            .left-side .time p {
                font-weight: 600;
                letter-spacing: 2px;
            }
            .left-side .time span {
                font-family:  verdana;
            }

        </style>
    </head>

    <body>

        <%    String userId = null;
      
            if (session.getAttribute("user_id") != null) {
                userId = (String) session.getAttribute("user_id");
            }
            User user = new User(userId);
            
        %>
          <% 
            String stationsId=null;
            if (session.getAttribute("stations_id") != null) {
                stationsId = (String) session.getAttribute("stations_id");
            }
            Stations station = new Stations(stationsId);
            
        %>
    
        <div class="ticket">
            <div class="block">
                <div class="boarding">
                    <h1>GIA Ticket System</h1>
                  
                </div>
                <div class="content name">
                    <h3>Name Of Passenger</h3>
                    <p><%= user.name%></p>
                </div>
                <div class="content from">
                    <h3>From</h3>
                    <p><%= stationFromObj.name%></p>
                </div>
                <div class="content to">
                    <div class="to-m">
                        <h3>To</h3>
                        <p><%= stationToObj.name%></p>
                    </div>

                    <div class="price">
                        <h2>Price:2500Frw
                        </h2>
                    </div>
                </div>
                <div class="scan">
                    <img src="https://chart.googleapis.com/chart?cht=qr&chl=UA%201136%2098745-34538459&chs=180x180&choe=UTF-8&chld=L|2" alt="">
                </div>
            </div>

            <div class="section-2">
                <div class="gate">
                    <h2>Developed By GIA Company</h2>
              
            </div>

            <div class="left-side">
              
                <div class="name">
                    <h3>Name Of Bus</h3>
                    <p><%=sBus%></p>
             
                    <p><%= user.name%></p>
                </div>
                <div class="from">
                    <h3>From</h3>
                    <p><%= stationFromObj.name%></p>
                </div>
                <div class="from">
                    <div class="to-m">
                        <h3>To</h3>
                        <p><%= stationToObj.name%></p>
                    </div>
                </div>

                <div class="section-2">
<!--                    <div class="gate">
                        <h4>Price</h4>
                        <p>20000</p>
                    </div>-->
                </div>

                <div class="time">
                    <p>Date of journey</p>
                    <span><%= journey_date%></span>
                    <span class="thanks">Thank You For Booking Ticket </span>
                </div>
            </div>
        </div>
    </body>
</html>
