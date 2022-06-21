package com.codeup.adlister.dao;


import java.sql.SQLException;

public interface Categories {

    void insert(long adId, long categoryId);
    public int[] getAdCategories(long adId);
    public void delete(long adId);
}
