<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<h1>Forgot ID</h1>
<form method="POST" action="doForgotId">
	<table>
		<tbody>
			<tr>
				<th>Name</th>
				<td>
					<div class="form-control-box">
						<input type="text" name="name"
							placeholder="Please enter your name" />
					</div>
				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<div class="form-control-box">
						<input type="email" name="email"
							placeholder="Please enter your email" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" class="btn btn-primary">Send ID
						email</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>