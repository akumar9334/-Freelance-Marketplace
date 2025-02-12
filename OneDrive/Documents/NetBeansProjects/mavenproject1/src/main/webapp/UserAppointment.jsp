<%-- 
    Document   : view_appointment
    Created on : Dec 16, 2024, 9:52:35 PM
    Author     : kumar
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.Db.DbConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="css.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }

            .backImg {
                background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
                    url("img/hospit1.jpg");
                height: 20vh;
                width: 100%;
                background-size: cover;
                background-repeat: no-repeat;
            }
        </style>

    </head>
    <body>
        <%@include file="navbar.jsp"%>

        <div class="container-fulid backImg p-5">
            <p class="text-center fs-2 text-white"></p>
        </div>
        <div class="container p-3">
            <div class="row">
                <div cl<div class="col-md-6 p-5" style="position: relative; width: 50%; height: auto; overflow: hidden;">
                    <img alt="Doctor Image" src="img/doct6.png" class="img-fluid" style="max-width: 100%; height: 98%;">
                </div>



                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="text-center fs-3">User Appointment</p>

                            <c:if test="${not empty succMsg}">
                                <p class="fs-4 text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session" />
                            </c:if>

                            <c:if test="${not empty errorMsg}">
                                <p class="fs-4 text-center text-danger">${errorMsg}</p>
                                <c:remove var="errorMsg" scope="session" />
                            </c:if>

                            <form class="row g-3" action="appAppointment" method="post">

                                <input type="hidden" name="userid" value="${userObj.id }">

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Full Name</label> <input
                                        required type="text" class="form-control" name="fullname">
                                </div>

                                <div class="col-md-6">
                                    <label>Gender</label> <select class="form-control" name="gender"
                                                                  required>
                                        <option value="male">Male</option>
                                        <option value="female">Female</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Age</label> <input
                                        required type="number" class="form-control" name="age">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Appointment
                                        Date</label> <input type="date" class="form-control" required
                                                        name="appoint_date">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label> <input
                                        required type="email" class="form-control" name="email">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Phone No</label> <input
                                        maxlength="10" required type="number" class="form-control"
                                        name="phno">
                                </div>


                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Diseases</label> <input
                                        required type="text" class="form-control" name="diseases">
                                </div>

                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Doctor</label> <select
                                        required class="form-control" name="doct">
                                        <option value="">--select--</option>

                                        <%
                                            DoctorDao dao = new DoctorDao(DbConnect.getConn());
                                            List<Doctor> list = dao.getAllListDoctor();
                                            for (Doctor d : list) {
                                        %>
                                        <option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
                                        </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="col-md-12">
                                    <label>Full Address</label>
                                    <textarea required name="address" class="form-control" rows="3"
                                              cols=""></textarea>
                                </div>

                                <c:if test="${empty userObj }">
                                    <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                                </c:if>

                                <c:if test="${not empty userObj }">
                                    <button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
