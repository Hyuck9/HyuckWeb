<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <tiles:insertAttribute name="header" />
	<title>HyuckWeb - <tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<tiles:insertAttribute name="leftMenu" />
<%--		<div id="loading" class="custom-loading">--%>
<%--			<div class="text-center">--%>
<%--				<img src="${pageContext.request.contextPath}/resources/img/loading_gear.svg" alt="loading..." style="width:250px;margin-top:10%;"/>--%>
<%--				<br><span class="h2 text-white">Loading...</span>--%>
<%--			</div>--%>
<%--		</div>--%>
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

	<!-- Main Content -->
			<div id="content">
				<tiles:insertAttribute name="topMenu" />
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<tiles:insertAttribute name="content" />
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<%-- Scroll to Top Button--%>
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="material-icons mt-2">&#xe5d8;</i>
	</a>
	<tiles:insertAttribute name="footer" />
</body>
</html>
