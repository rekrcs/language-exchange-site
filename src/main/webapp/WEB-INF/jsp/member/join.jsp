<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<!-- 비번 암호화저장 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js"></script>
<script>
	var MemberJoinForm__submitDone = false;
	var JoinForm__validLoginId = '';
	function MemberJoinForm__submit(form) {
		if (MemberJoinForm__submitDone) {
			alert("It's being done right now.");
			return;
		}
		var idReg = /^[A-za-z0-9]/g;
		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('Please enter your ID.');
			form.loginId.focus();

			return;
		}

		var idval = idReg.test(form.loginId.value)
		if (!idval) {
			alert('Please enter only alphabets and numbers for your ID');
			form.loginId.focus();
			return;
		}

		if (form.loginId.value.length < 4) {
			form.loginId.focus();
			alert('Please enter at least 4 characters of ID.');

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

		form.gender.value = form.gender.value.trim();
		if (form.gender.value.length == 0) {
			form.gender.focus();
			alert('Please choose your Gender');

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

		if (form.nativeLang.value == form.practiceLang.value) {
			form.practiceLang.focus();
			alert("Native and Practice Languages cannot be same.");

			return;
		}

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberJoinForm__submitDone = true;
	}

	function JoinForm__checkLoginIdDup(input) {
		var form = input.form;
		var idReg = /^[A-za-z0-9]/gi;
		var onlyAlphabetAndNumInId = idReg.test(form.loginId.value);
		console.log(onlyAlphabetAndNumInId);
		form.loginId.value = form.loginId.value.trim();
		if (form.loginId.value.length == 0) {
			return;
		}
		$
				.ajax({
					url : 'getLoginIdDup',
					data : {
						loginId : form.loginId.value,
						onlyAlphabetAndNumInId : onlyAlphabetAndNumInId
					},
					dataType : "json",
					type : 'POST',
					success : function(data) {
						var $message = $('.message-msg');
						if (data.isJoinableLoginId == 'true') {
							$message.empty().append(
									'<div style="color:green;">' + data.msg
											+ '</div>');
							JoinForm__validLoginId = data.loginId;
						} else if (data.isJoinableLoginId == 'false') {
							$message.empty().append(
									'<div style="color:red;">' + data.msg
											+ '</div>');
							JoinForm__validLoginId = '';
						}
					}
				});
	}
</script>

<form class="form1" method="POST" action="doJoin"
	onsubmit="MemberJoinForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="/usr/member/login">
	<input type="hidden" name="loginPwReal">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Create account</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>ID</th>
					<td>
						<div class="form-control-box">
							<input type="text" onkeyup="JoinForm__checkLoginIdDup(this);"
								name="loginId" placeholder="Please enter your ID" />
							<div class="message-msg"></div>
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
					<th>Name</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="name"
								placeholder="Please enter your name" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Gender</th>
					<td><div class="form-control-box">
							<select name="gender" style="font-size: 15px;">
								<option value="">::choose::</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="nickname"
								placeholder="Please enter your nickname" />
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
					<th>Native language</th>
					<td><div class="form-control-box">
							<select name="nativeLang" style="font-size: 15px;">
								<option value="">::choose::</option>
								<option value="English">English</option>
								<option value="Korean">Korean</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<th>Practice language</th>
					<td>
						<div class="form-control-box">
							<select name="practiceLang" style="font-size: 15px;">
								<option value="">::choose::</option>
								<option value="English">English</option>
								<option value="Korean">Korean</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button type="submit" class="btn btn-primary">Create
							account</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>