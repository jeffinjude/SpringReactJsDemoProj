<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<spring:url value="/Resources/Css/Theme.css" var="themeCss" />
		<spring:url value="/Resources/Css/TemplateStyles.css" var="templateCss" />
		<spring:url value="/Resources/Js/jquery.min.js" var="jqueryJs" />
		<spring:url value="/Resources/Js/Template.js" var="templateJs" />
		<spring:url value="/Resources/Js/App.js" var="appJs" />
		<spring:url value="/Resources/Js/react.min.js" var="reactMinJs" />
		<spring:url value="/Resources/Js/react-dom.min.js" var="reactDomMinJs" />
		<spring:url value="/Resources/Js/browser.min.js" var="browserMinJs" />

		<link href="${themeCss}" rel="stylesheet" />
		<link href="${templateCss}" rel="stylesheet" />
    	<script src="${jqueryJs}"></script>
    	<script src="${templateJs}"></script>
    	<script src="${appJs}"></script>
    	<script src="${reactMinJs}"></script>
    	<script src="${reactDomMinJs}"></script>
    	<script src="${browserMinJs}" charset="utf-8"></script>
		<title>Spring Web Application</title>
	</head>
	<body>
		<table class="flatTable">
			<tr class="headerTr">
				<td class="titleTd">Spring Web Application</td>
			</tr>
			<tr class="headerTr">
				<td><a href="${pageContext.request.contextPath}/index.jsp" >Home</a> &nbsp; &nbsp; <a href="${pageContext.request.contextPath}/UserList" >List Users</a> &nbsp; &nbsp; <a href="${pageContext.request.contextPath}/UserAdd" >Add User</a></td>
			</tr>
		</table>
		<div class="page-wrap">