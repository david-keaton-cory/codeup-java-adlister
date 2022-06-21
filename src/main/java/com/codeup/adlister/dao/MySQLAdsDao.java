package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static com.codeup.adlister.dao.DaoFactory.config;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getURL(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ads";
        try {
            stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> selWhile(Long catId) {
        return null;
    }

    @Override
    public Long insert(Ad ad) {
        String sql = "INSERT INTO ads(user_id, title, description) VALUES (?,?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public List<Ad> getUserAds(Long id) throws SQLException {
        DriverManager.registerDriver(new Driver());
        connection = DriverManager.getConnection(
                config.getURL(),
                config.getUsername(),
                config.getPassword()
        );
        String query = "SELECT * FROM ads WHERE user_id = ?";
        PreparedStatement ps = connection.prepareStatement(query);
        ps.setLong(1, id);

        ResultSet rs = ps.executeQuery();
        List<Ad> userAds = new ArrayList<>();
        while (rs.next()) {
            Ad ad = extractAd(rs);
            userAds.add(ad); // inserts each add created the user made to List

        }
        return userAds;
    }


    @Override
    public int insertIntoAds(long user_id, String title, String description, String date, String categories) throws SQLException {
        return 0;
    }

    @Override
    public String getCurrentDate() throws SQLException {
        return null;
    }

    @Override
    public int insertAdCategories(long ad_id, long cat_id) throws SQLException {
        return 0;
    }

    @Override
    public Ad createAdObject(long ad_id) throws SQLException {
        return null;
    }

    @Override
    public int updateAd(String title, String description, long ad_id) throws SQLException {
        return 0;
    }

    @Override
    public int deleteAdFromAdTable(long ad_id) throws SQLException {
        return 0;
    }

    @Override
    public int deleteAdFromAdCategories(long ad_id) throws SQLException {
        return 0;
    }

    @Override
    public List<Ad> findAdByKeyword(String keyword) throws SQLException {
        return null;
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getString("title"),
            rs.getString("description")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}
