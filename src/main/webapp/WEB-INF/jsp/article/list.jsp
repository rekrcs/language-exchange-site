<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<div class="table-box small-con">
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Board : ${boardCoade}</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Title</th>
			</tr>
			<c:forEach items="${articles}" var="article">
				<tr>
					<td>${article.id}</td>
					<td>${article.regDate}</td>
					<td><a href="${boardCoade}-detail?id=${article.id}">${article.title}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="option-btn">
		<ul>
			<li><a href="${boardCoade}-write">write</a></li>
		</ul>
	</div>
</div>


<%@ include file="../part/foot.jspf"%>