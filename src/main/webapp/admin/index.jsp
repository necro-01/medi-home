<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${ empty adminObj }">
		<c:redirect url="../adminLogin.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<p class="text-center fs-2">Admin Dashboard</p>

		<c:if test="${not empty errorMsg}">
			<p class="fs-5 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<c:if test="${not empty successMsg}">
			<div class="fs-5 text-center text-success mb-2" role="alert">${successMsg}</div>
			<c:remove var="successMsg" scope="session" />
		</c:if>

		<%
		DoctorDao dao = new DoctorDao(DBConnect.getConn());
		%>

		<div class="row">
			<div class="col-md-4" style="cursor: pointer">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<a href="viewDoctor.jsp" style="text-decoration: none;"> <i
							class="fas fa-user-md fa-3x text-success"></i><br>
							<p class="fs-4 text-center text-success">
								Doctor <br><%=dao.countDoctor()%>
							</p></a>
					</div>
				</div>
			</div>



			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%=dao.countUser()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%=dao.countAppointment()%>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 mt-2" style="cursor: pointer">

				<div class="card paint-card " data-toggle="modal"
					data-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%=dao.countSpecialist()%>
						</p>
					</div>
				</div>

			</div>

		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Sepcialist</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label class="mb-3">Enter Specialist Name</label> <input
								type="text" required name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>






</body>
</html>