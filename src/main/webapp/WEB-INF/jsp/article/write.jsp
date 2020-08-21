<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<h1>this page is for writing article in ${boardCoade}</h1>
<form method="POST" action="doWrite">
	<input type="hidden" name="code" value="${boardCoade}" />
	<table>
		<tbody>
			<tr>
				<th>Title</th>
				<td>
					<div class="form-control-box">
						<input type="text" name="title" placeholder="Please enter title" />
					</div>
				</td>
			</tr>
			<tr>
				<th>Body</th>
				<td>
					<div class="form-control-box">
						<textarea name="body" placeholder="Please enter body"></textarea>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit">write</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>