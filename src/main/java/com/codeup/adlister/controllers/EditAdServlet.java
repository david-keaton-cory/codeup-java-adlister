package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "editAdServlet", urlPatterns = "/editAd")
public class EditAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("adId"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        try {
            System.out.println(DaoFactory.getAdsDao().updateAd(title, description, id));
            request.setAttribute("edited", true);
            request.getRequestDispatcher("/WEB-INF/ads/AdUpdated.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            try {
                long adId = Long.parseLong(request.getParameter("adId"));
                System.out.println(adId);
                Ad adObject = DaoFactory.getAdsDao().createAdObject(adId);
                System.out.println(adObject.getTitle());
                request.setAttribute("ad", adObject);
                request.getRequestDispatcher("/WEB-INF/UserAd.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            response.sendRedirect("/profile");
        }



    }
}
