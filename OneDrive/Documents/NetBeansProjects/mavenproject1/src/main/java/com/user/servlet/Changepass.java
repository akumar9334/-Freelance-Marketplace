/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.Db.DbConnect;
import com.dao.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kumar
 */
@WebServlet("/userChangePassword")
public class Changepass extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int uid = Integer.parseInt(req.getParameter("uid"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        UserDao dao = new UserDao(DbConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.checkOldPassword(uid, oldPassword)) {

			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Password Change Sucessfully");
				resp.sendRedirect("changepassword.jsp");

			} else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("changepassword.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			resp.sendRedirect("changepassword.jsp");
		}

        }

    }


