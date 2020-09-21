<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script>
	if(${loginPw == null}) {
		alert('Please check your Password');
		history.back();
		}

	var MemberModifyForm__submitDone = false;
	function MemberModifyForm__submit(form) {
		if (MemberModifyForm__submitDone) {
			alert("It's being done right now.");
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();

		if (form.loginPw.value.length == 0) {
			form.loginPw.focus();
			alert('Please enter your Password.');

			return;
		}

		if (form.loginPw.value.length < 5) {
			form.loginPw.focus();
			alert('Please enter at least 5 characters of Password.');

			return;
		}

		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value.length == 0) {
			form.loginPwConfirm.focus();
			alert('Please enter your Confirm Password.');

			return;
		}

		if (form.loginPw.value != form.loginPwConfirm.value) {
			form.loginPwConfirm.focus();
			alert("Your password and Cnfirm password don't match.");

			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			form.name.focus();
			alert('Please enter your name.');

			return;
		}

		if (form.name.value.length < 2) {
			form.name.focus();
			alert('Sorry your name is too short.');

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			form.nickname.focus();
			alert('Please enter your nickname.');

			return;
		}

		if (form.nickname.value.length < 2) {
			form.nickname.focus();
			alert('Sorry your nickname is too short.');

			return;
		}

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('Please enter your email');

			return;
		}

		form.nativeLang.value = form.nativeLang.value.trim();
		if (form.nativeLang.value.length == 0) {
			form.nativeLang.focus();
			alert('Please choose your Native Language');

			return;
		}

		form.practiceLang.value = form.practiceLang.value.trim();
		if (form.practiceLang.value.length == 0) {
			form.practiceLang.focus();
			alert('Please choose your Practice Language');

			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberModifyForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doModifyProfile"
	onsubmit="MemberModifyForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/home/main">
	<input type="hidden" name="loginPwReal">
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
					<td><div>${member.loginId}</div></td>
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