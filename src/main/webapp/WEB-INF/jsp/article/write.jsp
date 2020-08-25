<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>

<form class="form1" method="POST" action="doWrite">
	<input type="hidden" name="code" value="${boardCoade}" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Write in ${boardCoade} board</h1></th>
				</tr>
			</thead>
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
							<textarea name="body" placeholder="Please enter body" maxlength="2000"></textarea>
						</div>
					</td>
				</tr>
				<tr>
				<th></th>
					<td>
						<button class="btn btn-primar" type="submit">write</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>