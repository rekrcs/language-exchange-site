<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<h1>Confirm password</h1>
<form method="POST" action="doCheckPw">
	<table>
		<tbody>
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
						<button type="submit" class="btn btn-primary">Confirm</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>