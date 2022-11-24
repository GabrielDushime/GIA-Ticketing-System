package com.connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;


public class Booking {
	private String tableName = "booking";
	public String id, station_id, booking_date, journey_date, passenger_id;
	Database db;
	public Booking() {
		db = new Database();
	}
	public Booking(int argId) {
		
	}
	
	public ResultSet FindByUser(String userId){
		ResultSet result = null;
		String sql = "SELECT * FROM "+this.tableName+ " WHERE passenger_id='"+userId+"' ORDER BY id DESC";
		try {
			result = this.db.statement.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public HashMap<String,String> Find(String station,String date,String totalSeat){
		HashMap<String,String> result = new HashMap<String,String>();
		result.put("message", "Seat Is Not Available!");
		result.put("is_avaiable","no");
		result.put("j_date", date);
		String query = null;
		query = "SELECT stations.*,stations.name as stationName,stations.contact as stationsContact, stations.address as stationAddress from stations"
				+ " INNER JOIN trains ON"
				+ " stations.station_id = stations.id"
				+ " WHERE stations.id = '"+station+"'";
		try {
			ResultSet resultset = this.db.statement.executeQuery(query);
			while(resultset.next()) {
				result.put("stations_id",resultset.getString("id"));
				result.put("station_name",resultset.getString("stationName"));
				result.put("from",resultset.getString("station_from"));
				result.put("to",resultset.getString("station_to"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public void SetById(int argId) {
		
	}

	public int Save() {
		// TODO Auto-generated method stub
		return 0;
	}
	


	public int Update() {
		// TODO Auto-generated method stub
		return 0;
	}


	public void Delete() {
		// TODO Auto-generated method stub
	}


	public String GetTableName() {
		// TODO Auto-generated method stub
		return this.tableName;
	}
	
	
	
}
