package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet(name = "CategoryServlet", urlPatterns = "/category")
public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("value");

        List<Ad> userAds = DaoFactory.getAdsDao().all(); // List all ads
        List<String> sortedAd = new ArrayList<>();
        for (Ad info: userAds) {
            if ("0".equalsIgnoreCase(category)) {
                request.setAttribute("catAd", DaoFactory.getAdsDao().all());
            }

            if ("1".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "sports");
                // System.out.println(info.getCatString());
                if(info.getCatString().toLowerCase().contains("sports")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 1));
                }
            }

            if ("2".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "camping");
                if(info.getCatString().toLowerCase().contains("camping")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 2));
                }
            }

            if ("3".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "computers");
                if(info.getCatString().toLowerCase().contains("computers")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 3));
                }
            }

            if ("4".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "phones");
                if(info.getCatString().toLowerCase().contains("phones")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 4));
                }
            }

            if ("5".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "jobs");
                if(info.getCatString().toLowerCase().contains("jobs")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 5));
                }
            }

            if ("6".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "clothing");
                if(info.getCatString().toLowerCase().contains("clothing")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 6));
                }
            }

            if ("7".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "cars");
                if(info.getCatString().toLowerCase().contains("cars")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 7));
                }
            }

            if ("8".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "furniture");
                if(info.getCatString().toLowerCase().contains("furniture")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 8));
                }
            }

            if ("9".equalsIgnoreCase(category)) {
                request.setAttribute("cat", "other");
                if(info.getCatString().toLowerCase().contains("other")){
                    sortedAd.add(info.getTitle());
                    request.setAttribute("catAd", DaoFactory.getAdsDao().selWhile((long) 9));
                }
            }
        }

        request.getRequestDispatcher("/WEB-INF/ads/category.jsp").forward(request, response);
    }
}