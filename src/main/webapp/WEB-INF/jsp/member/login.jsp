<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../part/head.jspf"%>
<form class="form1" method="POST" action="doLogin">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Log in</h1></th>
				</tr>
			</thead>
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
					<th></th>
					<td>
						<div>
							<button type="submit" class="btn btn-primary">Log in</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<div class="option-btn small-con">
	<ul class="flex">
		<li style="margin-right: 20px;"><a href="forgotId">Forgot ID</a></li>
		<li><a href="forgotPw">Forgot Pw</a></li>
	</ul>
</div>
<%@ include file="../part/foot.jspf"%>