package com.connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import AllLayout.Station;
//import AllLayout.Train;
import TicketSystemInterface.DatabaseModel;
import javax.servlet.http.HttpSession;

public class Stations implements DatabaseModel {

    String tableName;
    public String id, name, contact, address;
    Database db;
    private String table;

    public Stations() {
        id = name = contact = address = "";
        db = new Database();
        this.tableName = "stations";
    }

    public Stations(String id) {
        this.id = id;
    }
    

    public void Delete(String stId) throws SQLException {
        String sql = "DELETE FROM stations WHERE id = '" + stId + "'";

        this.db.statement.executeUpdate(sql);
        System.out.println(sql);

    }
  public void Update(String stId) throws SQLException, Exception {
        String sql = "update stations set name='"+this.name+"', address='"+this.address+"', contact='"+this.contact+"' where id="+stId;
        this.db.statement.executeUpdate(sql);
        System.out.println(sql);

    }
  public void SetStationsSession(HttpSession sessionArg) {
		sessionArg.setAttribute("stations_id", this.id);
	}
    public Station getStation(String staionId) {
        Station station = new Station();
        String sqlQuery = "SELECT * FROM " + this.GetTableName() + " WHERE id='" + staionId + "'";
        ResultSet result;
        try {
            result = this.db.statement.executeQuery(sqlQuery);
            while (result.next()) {
                station.name = result.getString("name").toString();
                station.id = result.getString("id").toString();
                station.address = result.getString("address").toString();
                station.contact = result.getString("contact").toString();
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return station;
    }

    public ArrayList<Station> getAll() {
        ArrayList<Station> stations = new ArrayList<Station>();
        String sqlQuery = "SELECT * FROM " + this.GetTableName() + " ORDER BY name ASC";
        try {
            ResultSet result = db.statement.executeQuery(sqlQuery);
            while (result.next()) {
                Station temp = new Station();
                temp.id = result.getString("id");
                temp.name = result.getString("name");
                temp.contact = result.getString("contact");
                temp.address = result.getString("address");
                stations.add(temp);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return stations;
    }

    @Override
    public int Save() {
        int newId = this.InsertNew();
        return newId;
    }

    @Override
    public int Update() {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public void Delete() {
        // TODO Auto-generated method stub

    }

    @Override
    public String GetTableName() {
        // TODO Auto-generated method stub
        return this.tableName;
    }

    private int InsertNew() {
        String query = "INSERT INTO " + this.GetTableName() + "(name, contact,address) "
                + " VALUES('" + this.name + "','" + this.contact + "','" + this.address + "')";
        try {
            return this.db.statement.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }

}
