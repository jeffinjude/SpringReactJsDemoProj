<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${param.userId == null}">
		<form method="post" name="userForm" id="userForm"
			action="${pageContext.request.contextPath}/SaveUserDetails">
			<table class="flatTable">
				<tr>
					<td>Name : <input type="text" id="userName" name="userName"
						value=""></td>
				</tr>
				<tr>
					<td>Phone Number : <input type="text" id="phoneNumber"
						name="phoneNumber" value=""></td>
				</tr>
				<tr>
					<td><input type="submit" id="saveUser" class="saveUser"
						value="Submit"></td>
				</tr>
			</table>
		</form>
	</c:when>
	<c:otherwise>
		<form method="post" name="userForm" id="userForm"
			action="${pageContext.request.contextPath}/UpdateUserDetails">
			<table class="flatTable">
				<tr>
					<td>Name : <input type="text" id="userName" name="userName"
						value="${userDetails.getUserName()}"></td>
				</tr>
				<tr>
					<td>Phone Number : <input type="text" id="phoneNumber"
						name="phoneNumber" value="${userDetails.getPhoneNumber()}"></td>
				</tr>
				<input type="hidden" id="userId" name="userId" value="${param.userId}">
				<tr>
					<td><input type="submit" id="updateUser" class="updateUser"
						value="Update"></td>
				</tr>
			</table>
		</form>
	</c:otherwise>
</c:choose>
<%@ include file="/footer.jsp"%>