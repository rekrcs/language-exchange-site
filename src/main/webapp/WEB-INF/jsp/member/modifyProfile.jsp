<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<h1>Edit profile</h1>
<form method="POST" action="doModifyProfile">
	<table>
		<tbody>
			<tr>
				<th>ID :</th>
				<td>${member.loginId}</td>
			</tr>
			<tr>
				<th>Name :</th>
				<td><input type="text" name="name" value="${member.name}" /></td>
			</tr>
			<tr>
				<th>Nickname :</th>
				<td><input type="text" name="nickname"
					value="${member.nickname}" /></td>
			</tr>
			<tr>
				<th>Email :</th>
				<td><input type="text" name="email" value="${member.email}" /></td>
			</tr>
			<tr>
				<th>Native :</th>
				<td>
					<div>
						<select name="nativeLang" id="">
							<option value="${member.nativeLang}">${member.nativeLang}</option>
							<option value="${member.practiceLang}">${member.practiceLang}</option>

						</select>
					</div>
				</td>
			</tr>
			<tr>
				<th>Practice :</th>
				<td>
					<div>
						<select name="practiceLang">
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
				<td>
					<button type="submit" class="btn btn-primary">Edit profile</button>
				</td>
			</tr>
		</tbody>
	</table>
</form>
<%@ include file="../part/foot.jspf"%>