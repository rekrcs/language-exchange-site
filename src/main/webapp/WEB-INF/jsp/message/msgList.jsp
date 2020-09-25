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
	<span> <span>Total article in ${boardCode} : </span> <span>${totalCount}</span>
		<span> / </span> <span>Current page in ${boardCode} : </span> <span>${param.page}</span>
	</span>

	<div>

		<script>
			function searchKeywordForm__submit(form) {
				form.searchType.value = form.searchType.value.trim();

				if (form.searchType.value.length == 0) {
					form.searchType.focus();
					alert('Please choose search Type.');

					return;
				}
				form.submit();
			}
		</script>
		<form action="" name="searchForm"
			onsubmit="searchKeywordForm__submit(this); return false;">
			<input type="hidden" name="boardCode" value="${boardCode}" /> <input
				type="hidden" name="page" value="1" /> <select name="searchType">
				<option value="">::Search Type::</option>
				<option value="title">Title</option>
				<option value="body">Body</option>
				<option value="titleAndBody">Title + Body</option>
			</select>
			<script>
				$('form[name="searchForm"] select[name="searchType"]').val(
						param.searchType);
			</script>
			<input type="text" name="searchKeyword" placeholder="For Search"
				value="${param.searchKeyword }" /> <input type="submit"
				value="search" />
		</form>
	</div>
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

<div class="page-menu text-align-center" style="margin-bottom: 50px;">
	<c:if test="${moveToFirstPage}">
		<a title="Move to list page" href="${queryString}?page=1"><i
			class="fas fa-angle-double-left"></i></i></a>
	</c:if>
	<c:if test="${beforeMorePages}">
		<a href="${queryString}?page=${param.page - pageBoundSize - 1}"><i
			class="fas fa-angle-left"></i></a>
	</c:if>
	<c:forEach begin="${pageStartsWith}" end="${pageEndsWith}"
		var="currentPage">
		<c:if test="${currentPage == param.page }">
			<a style="color: red; font-weight: bold;"
				href="${queryString}?page=${currentPage}">${currentPage}</a>
		</c:if>
		<c:if test="${currentPage != param.page }">
			<a style="color: blue" href="${queryString}?page=${currentPage}">${currentPage}</a>
		</c:if>
	</c:forEach>
	<c:if test="${afterMorePages}">
		<a href="${queryString}?page=${param.page + pageBoundSize + 1}"><i
			class="fas fa-angle-right"></i></a>
	</c:if>
	<c:if test="${moveToLastPage}">
		<a title="Move to list page" href="${queryString}?page=${totalPage}"><i
			class="fas fa-angle-double-right"></i></a>
	</c:if>
</div>


<%@ include file="../part/foot.jspf"%>