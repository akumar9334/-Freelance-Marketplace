<%-- 
    Document   : comment
    Created on : Dec 17, 2024, 6:47:10 PM
    Author     : kumar
--%>

<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.Db.DbConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="../css.jsp" %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("../img/bghostpit.png");
                height: 20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %> 

        <c:if test="${empty doctObj}">
            <c:redirect url="../Doctor_login.jsp" />
        </c:if>
        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">

                <div class="col-md-6 offset-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-4">Patient Comment</p>
                            <% int id = Integer.parseInt(request.getParameter("id"));
                                AppointmentDao dao = new AppointmentDao(DbConnect.getConn());
                                Appointment ap = dao.getAppointmentById(id);
                            %>

                            <form class="row" action="../updateStatus" method="post">
                                <div class="col-md-6">
                                    <label>Patient Name</label> <input type="text" readonly
                                                                       value="<%=ap.getFullName()%>" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <label>Age</label> <input type="text" value="<%=ap.getAge()%>"
                                                              readonly class="form-control">
                                </div>


                                <div class="col-md-6">
                                    <br> <label>Mob No</label> <input type="text" readonly
                                                                      value="<%=ap.getPhNo()%>" class="form-control">
                                </div>

                                <div class="col-md-6">
                                    <br> <label>Diseases</label> <input type="text" readonly
                                                                        value="<%=ap.getDiseases()%>" class="form-control">
                                </div>

                                <div class="col-md-12">
                                    <br> <label>Comment</label>
                                    <textarea required name="Comm" class="form-control" row="3"
                                              cols=""></textarea>
                                </div>
                                <input type="hidden" name="id" value="<%=ap.getId()%>"> <input
                                    type="hidden" name="did" value="<%=ap.getDoctorId()%>">

                                <button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>