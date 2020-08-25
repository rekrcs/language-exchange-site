<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<div class="table-box small-con">
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Detail</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>Board</th>
				<td>${article.boardCode}</td>
			</tr>
			<tr>
				<th>No.</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>Title</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>Date</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>Update Date</th>
				<td>${article.updateDate}</td>
			</tr>
			<tr>
				<th>Body</th>
				<td>${article.body}</td>
			</tr>
		</tbody>
	</table>
</div>

<%@ include file="../part/foot.jspf"%>