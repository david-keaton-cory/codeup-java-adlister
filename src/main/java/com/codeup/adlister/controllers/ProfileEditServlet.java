package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet(name = "ProfileEditServlet", urlPatterns = "/profile/edit")
public class ProfileEditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ================== vars for user profile ================== \\
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");


        User user = (User) request.getSession().getAttribute("user");
        long id = user.getId();
        String currentPassword = user.getPassword();
        String currentUsername = user.getUsername();

        System.out.println("old password is :" + password);
        System.out.println("newPassword password is :" + newPassword);
        System.out.println("confirmNewPassword password is :" + confirmNewPassword);


// ================== password update logic (moved this to the top, and was able to work correctly================== \\
        if (username == null && email == null) {
            if (Password.check(password, currentPassword)) {
                request.setAttribute("passwordsMatch", true);

                if (!newPassword.equals(confirmNewPassword)) {
                    request.setAttribute("newPasswordMatch", false);
                    request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
                    System.out.println("DOESNT MATCH");
                } else {

                    try {
                        System.out.println(" new password to before hash: " + newPassword);
                        request.setAttribute("passwordChangeSuccess", true);
                        String newPasswordHash = Password.hash(newPassword);
                        DaoFactory.getUsersDao().updatePassword(newPasswordHash, id);
                        request.getSession().removeAttribute("user");
                        User newUser = DaoFactory.getUsersDao().findByUsername(currentUsername);
                        request.getSession().setAttribute("user", newUser);
                        request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);

                    } catch (SQLIntegrityConstraintViolationException e) {
                        e.printStackTrace();
                    }
                }

            } else {
                request.setAttribute("passwordsMatch", false);
                request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
            }
        }


        // ================== username update logic ================== \\
        if (email == null) {
            try {
                boolean usernameNotValid = DaoFactory.getUsersDao().validateUsername(username);
                if (usernameNotValid) {
                    request.setAttribute("usernameTaken", true);
                    request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
                } else {
                    request.setAttribute("usernameTaken", false);
                    System.out.println(DaoFactory.getUsersDao().updateUsername(username, id));
                    request.getSession().removeAttribute("user");
                    User newUser = DaoFactory.getUsersDao().findByUsername(username);
                    request.getSession().setAttribute("user", newUser);
                    request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // ================== email update logic ================== \\
        if (username == null) {
            try {
                boolean userEmailNotValid = DaoFactory.getUsersDao().validateEmail(email);
                if (userEmailNotValid) {
                    request.setAttribute("emailTaken", true);
                    request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);

                } else {
                    request.setAttribute("emailTaken", false);
                    System.out.println(DaoFactory.getUsersDao().updateEmail(email, id));
                    User newUser = DaoFactory.getUsersDao().findByUsername(currentUsername);
                    request.getSession().removeAttribute("user");
                    request.getSession().setAttribute("user", newUser);
                    request.getRequestDispatcher("/WEB-INF/profileEdit.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}