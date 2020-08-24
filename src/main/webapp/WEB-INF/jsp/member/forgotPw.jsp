<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<h1>Forgot Pw</h1>
<form method="POST" action="doForgotPw">
	<table>
		<tbody>
			<tr>
				<th>ID</th>
				<td>
					<div class="form-control-box">
						<input type="text" name="loginId"
							placeholder="Please enter your Id" />
					</div>
				</td>
			</tr>
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
					<button type="submit" class="btn btn-primary">Send code
						email</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>