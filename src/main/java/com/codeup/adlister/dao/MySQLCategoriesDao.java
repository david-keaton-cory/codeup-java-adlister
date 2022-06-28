package com.codeup.adlister.dao;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

//technically a Dao for the join table which combines the Categories table and the Ads Table
public class MySQLCategoriesDao implements Categories{
    private Connection connection = null;

    public MySQLCategoriesDao(Config config){
        try{
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getURL(),
                    config.getUsername(),
                    config.getPassword()
            );

        }catch(SQLException e){
            throw new RuntimeException("Error connecting to Database.",e);
        }
    }

    @Override
    public void insert(long adId, long categoryId){
        try {
            String query = "INSERT INTO adCategories(ad_id, category_id) VALUES (?, ? )";
            PreparedStatement stat = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stat.setLong(1, adId);
            stat.setLong(2, categoryId);
            stat.executeUpdate();
        }catch(SQLException e){
            throw new RuntimeException("Error connecting to database.",e);
        }
    }

    public int[] getAdCategories(long adId) {
        int[] categories = {0, 0, 0, 0, 0, 0, 0};
        List<Long> catIds = new ArrayList<>();
        try {
            String query = "SELECT category_id FROM adCategories WHERE ad_id = ?";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                catIds.add(rs.getLong("category_id"));
            }
            if (catIds.contains(1L)) {
                categories[0] = 1;
            }
            if (catIds.contains(2L)) {
                categories[1] = 1;
            }
            if (catIds.contains(3L)) {
                categories[2] = 1;
            }
            if (catIds.contains(4L)) {
                categories[3] = 1;
            }
            if (catIds.contains(5L)) {
                categories[4] = 1;
            }
            if (catIds.contains(6L)) {
                categories[5] = 1;
            }
            if (catIds.contains(7L)) {
                categories[6] = 1;
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error getting ad categories", e);
        }
    }

    @Override
    public void delete(long adId) {
        String query = "DELETE FROM adCategories WHERE ad_id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, adId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting category to update", e);
        }
    }
}