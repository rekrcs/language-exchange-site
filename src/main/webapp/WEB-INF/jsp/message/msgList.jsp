<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../part/head.jspf"%>
<style>
@media ( max-width : 799px) {
	.msg-body {
		width: 150px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		overflow: hidden;
	}
}

@media ( min-width : 800px) {
	.msg-body {
		width: 600px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		overflow: hidden;
	}
}
</style>
<div class="table-box small-con">

	<table>
		<colgroup>
			<col width="180" />
			<col />
			<col width="180" />
		</colgroup>
		<thead>
			<tr>
				<th colspan="3"><h1>Messages</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>From</th>
				<th>Message</th>
				<th>Date</th>
			</tr>
			<c:forEach items="${attrForMsgs}" var="attrForMsg">
				<tr>
					<td>${attrForMsg.extra.writer}</td>
					<td><div class="msg-body">
							<a
								href="../message/message?id=<c:if test="${loginedMemberId == attrForMsg.typeCode}">
								${attrForMsg.type2Code} </c:if><c:if test="${loginedMemberId != attrForMsg.typeCode}">
								${attrForMsg.typeCode} </c:if>">${attrForMsg.value}
							</a>
						</div></td>
					<td>${attrForMsg.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="../part/foot.jspf"%>