<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<div class="table-box small-con">
	<table style="margin-bottom: 100px">
		<colgroup>
			<col width="80" />
			<col width="180" />
			<col width="80" />
			<col width="180" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th colspan="5"><h1>Learning Korean</h1></th>
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
				<th colspan="5"><h1>Learning English</h1></th>
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
</div>

<%@ include file="../part/foot.jspf"%>