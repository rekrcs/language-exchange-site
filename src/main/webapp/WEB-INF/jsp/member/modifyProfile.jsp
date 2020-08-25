<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<form class="form1" method="POST" action="doModifyProfile">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Edit profile</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>ID</th>
					<td>${member.loginId}</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="name" value="${member.name}" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><div class="form-control-box">
							<input type="text" name="nickname" value="${member.nickname}" />
						</div></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><div class="form-control-box">
							<input type="text" name="email" value="${member.email}" />
						</div></td>
				</tr>
				<tr>
					<th>Native</th>
					<td>
						<div class="form-control-box">
							<select name="nativeLang" id="" style="font-size: 15px;">
								<option value="${member.nativeLang}">${member.nativeLang}</option>
								<option value="${member.practiceLang}">${member.practiceLang}</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>Practice</th>
					<td>
						<div class="form-control-box">
							<select name="practiceLang" style="font-size: 15px;">
								<option value="${member.practiceLang}">${member.practiceLang}</option>
								<option value="${member.nativeLang}">${member.nativeLang}</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<div class="form-control-box">
							<input type="password" name="loginPw"
								placeholder="Please enter your password" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Confirm</th>
					<td>
						<div class="form-control-box">
							<input type="password" name="loginPwConfirm"
								placeholder="Please enter your password again" />
						</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button type="submit" class="btn btn-primary">Edit
							profile</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>

<%@ include file="../part/foot.jspf"%>