<%--
  Created by IntelliJ IDEA.
  User: Hyuck
  Date: 2019-08-26
  Time: 오전 1:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<tiles:insertAttribute name="header" />
		<title>HyuckWeb - <tiles:insertAttribute name="title" ignore="true" /></title>
	</head>
	<body class="bg-gradient-light">
<%--		<div id="loading" class="custom-loading">--%>
<%--			<div class="text-center">--%>
<%--				<img src="/img/loading_gear.svg" alt="loading..." style="width:250px;margin-top:10%;"/>--%>
<%--				<br><span class="h2 text-white">Loading...</span>--%>
<%--			</div>--%>
<%--		</div>--%>
		<h1 class="custom-logo">
			<img src="${pageContext.request.contextPath}/resources/img/sb_logo.png" alt="STAY BEAUTY"/>
		</h1>
		<div class="container">
			<tiles:insertAttribute name="content" />
		</div>

		<tiles:insertAttribute name="footer" />

	</body>
</html>