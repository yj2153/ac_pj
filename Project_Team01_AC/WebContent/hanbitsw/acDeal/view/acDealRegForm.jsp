<%@page import="org.springframework.web.context.request.RequestScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value ="/hanbitsw/acDeal/jquery/jquery-ui.css"/>">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- 자바스크립트 호출 -->
<script
	src="<c:url value="/hanbitsw/acDeal/script/acDealRegForm_script.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/hanbitsw/acDeal/css/acDealRegForm.css"/>" />
</head>
<body>
	<h1>거래내역 보고서</h1>
	<div align="left">
		<form id="acDeal_form" onkeydown="if(event.keyCode==13) return false;">
			<table border="1" class="acDealRegForm_Box">
				<tr>
					<td class="Box_th">날짜</td>
					<td><input type="text" id="datepicker1" name="dealDate"
						style="text-align: right;"
						value="<fmt:formatDate value="${toDay}" pattern="yyyy/MM/dd" />">
					</td>
				</tr>
			</table>
			<table border="1" class="acDealRegForm_Box">
				<thead>
					<tr>
						<th class="Box_th">구분</th>
						<th class="Box_th">계정코드</th>
						<th class="Box_th">상세내역</th>
						<th class="Box_th">금액</th>
						<th class="Box_th">비고</th>
					</tr>
				</thead>
				<tbody id="Dealbody">
					<!-- for문으로 총 10개 생성 -->
					<c:forEach items="0,1,2,3,4,5,6,7,8,9" var="item">
						<tr>
							<%-- 구분이 바꼈을때 총합 계산 함수 호출 --%>
							<td><select id="dealType" name="dealvoList[${item}].typeId"
								onchange="getAllNum()">
									<option value="0">--</option>
									<c:forEach items="${typeDTO}" var="type">
										<option value="${type.getTypeId() }">${type.getTypeName()}</option>
									</c:forEach>
							</select></td>
							<%-- 카테고리 --%>
							<td><select name="dealvoList[${item}].categoryId">
									<option value="0">--</option>
									<c:forEach items="${categoryDTO}" var="category">
										<option value="${category.getCategoryId() }">${category.getCategoryName()}</option>
									</c:forEach>
							</select></td>
							<%-- 상세내역 --%>
							<td><input type="text" name="dealvoList[${item}].dealNote"
								style="text-align: center;" /></td>
							<%-- 금액 --%>
							<td><input type="text" class="dealSum${item}"
								style="text-align: right; ime-mode: disabled;"
								onkeyup="formatnumber(event)" /> <input type="hidden"
								class="dealSum${item}" name="dealvoList[${item}].dealSum"
								value="0" /></td>
							<%-- 날짜 --%>
							<td><input type="hidden" readonly="readonly"
								id="dealDate${item}" name="dealvoList[${item}].dealDate"
								value="<fmt:formatDate value="${toDay}" pattern="yyyy/MM/dd" />" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 총금액 정산 -->
			<table border="1" class="acDealRegForm_Box">
				<tr>
					<th class="Box_th">입금 총 금액</th>
					<td>&nbsp; <input type="text" readonly="readonly"
						id="depositSum" style="text-align: right;" value="0" /> &nbsp;원
					</td>
				</tr>
				<tr>
					<th class="Box_th">출금 총 금액</th>
					<td>&nbsp; <input type="text" readonly="readonly"
						id="withdrawSum" style="text-align: right;" value="0" /> &nbsp;원
					</td>
				</tr>
			</table>
			<input type="submit" id="subButton" value="저장" />
		</form>
	</div>
	<div id="dialog" title="error message"></div>
</body>
</html>
