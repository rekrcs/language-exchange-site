<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../part/head.jspf"%>
<form method="POST" action="doLogin">
	<table>
		<tbody>
			<tr>
				<th>ID</th>
				<td>
					<div class="form-control-box">
						<input type="text" name="loginId"
							placeholder="Please enter your ID" />
					</div>
				</td>
			</tr>
			<tr>
				<th>Password</th>
				<td>
					<div class="form-control-box">
						<input type="password" name="loginPw"
							placeholder="Plesase enter your password" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div>
						<button type="submit" class="btn btn-primary">Log in</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>