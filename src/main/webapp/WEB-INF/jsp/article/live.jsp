<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<%@ include file="../part/toastuiEditor.jspf"%>
<div class="table-box small-con">
	<div class="option-btn">
		<ul>
			<li><a href="liveWrite">write</a></li>
		</ul>
	</div>
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Live</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>Update Date</th>
				<td>${article.updateDate}</td>
			</tr>
			<tr>
				<th>Writer</th>
				<td>${article.extra.writer}</td>
			</tr>
			<tr>
				<th></th>
				<td><script type="text/x-template">${article.body}</script>
					<div class="toast-editor toast-editor-viewer"></div></td>
			</tr>
		</tbody>
	</table>
	<div class="option-btn small-con">
		<ul class="flex">
			<li style="margin-right: 20px;"><a
				onclick="if ( confirm('are you going to delete it?') == false ) return false;"
				href="${boardCode}-deleteArticle?id=${article.id}">Delete</a></li>
			<li><a href="modifyarticle">Modify</a></li>
		</ul>
	</div>
</div>


<%@ include file="../part/foot.jspf"%>