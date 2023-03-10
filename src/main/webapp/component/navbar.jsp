<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fas fa-clinic-medical"></i> MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="adminLogin.jsp"><i
							class="fas fa-sign-in-alt"></i> Admin</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctorLogin.jsp">Doctor</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="userAppointment.jsp">Appointment</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="userLogin.jsp">User</a></li>
				</c:if>

				<c:if test="${not empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="userAppointment.jsp">Appointment</a></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="viewAppointment.jsp">View Appointment</a></li>

					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle active" href="#" id="navbardropdown"
						role="button" data-toggle="dropdown" aria-expanded="false"><i
							class="fa-solid fa-circle-user active"></i> ${userObj.fullname}</a>
						<ul class="dropdown-menu dropdown-menu-left" aria-labelledby="navbardropdown">
							<li><a class="dropdown-item" href="changePassword.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
						</ul></li>
				</c:if>

			</ul>
		</div>
	</div>
</nav>