<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<div class="table-box small-con">
	<span> <span>Total article in ${boardCode} : </span> <span>${totalCount}</span>
		<span> / </span> <span>Current page in ${boardCode} : </span> <span>${param.page}</span>
	</span>
	<table>
		<colgroup>
			<col width="80" />
			<col width="180" />
			<col width="180" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th colspan="4"><h1>Board : ${boardCode}</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Writer</th>
				<th>Title</th>
			</tr>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td>${article.id}</td>
					<td>${article.regDate}</td>
					<td>${article.extra.writer}</td>
					<td><a href="${boardCode}-detail?id=${article.id}">${article.title}</a></td>
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
	<c:forEach begin="1" end="${totalPage}" var="currentPage">
		<c:if test="${currentPage == param.page }">
			<a style="color: red; font-weight: bold;" ${queryString}?page=${currentPage}">${currentPage}</a>
		</c:if>
		<c:if test="${currentPage != param.page }">
			<a href="${queryString}?page=${currentPage}">${currentPage}</a>
		</c:if>
	</c:forEach>

</div>


<%@ include file="../part/foot.jspf"%>