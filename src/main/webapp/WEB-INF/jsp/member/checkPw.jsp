<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<form class="form1" method="POST" action="doCheckPw">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Confirm password</h1></th>
				</tr>
			</thead>
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
					<th></th>
					<td>
						<div>
							<button type="submit" class="btn btn-primary">Confirm</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>