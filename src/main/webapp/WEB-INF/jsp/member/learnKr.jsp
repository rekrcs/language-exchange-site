<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<style>
.msg>a {
	display: none;
}

td:hover>.msg>a {
	background-color:black;
	color: white;
	display: inline-block;
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
				<option value="ID">ID</option>
				<option value="Introduce">Introduce</option>
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
			<col width="80" />
			<col width="180" />
			<col width="80" />
			<col width="180" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th colspan="5"><h1>Learn Korean</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Gender</th>
				<th>Nickname</th>
				<th>Introduce</th>
			</tr>
			<c:forEach items="${members}" var="member">
				<tr>
					<td>${member.id}</td>
					<td>${member.regDate}</td>
					<td>${member.gender}</td>
					<td><a href="" style="color: blue"
						class="flex relative">${member.nickname}</a><span
						class="msg absolute"><a href="">message</a></span></td>
					<td>${member.introduce}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="option-btn">
		<ul>
			<li><a href="${boardCode}-write">write</a></li>
		</ul>
	</div>
</div>

<div class="page-menu text-align-center" style="margin-bottom: 50px;">
	<c:if test="${moveToFirstPage}">
		<a title="Move to list page" href="${queryString}?page=1"><i
			class="fas fa-angle-double-left"></i></a>
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