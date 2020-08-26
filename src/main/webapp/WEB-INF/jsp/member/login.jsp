<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<!-- 비번 암호화저장 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script>
	var MemberLoginForm__submitDone = false;
	function MemberLoginForm__submit(form) {
		if (MemberLoginForm__submitDone) {
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

		if (!idReg.test(form.loginId.value)) {
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

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
		MemberLoginForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doLogin"
	onsubmit="MemberLoginForm__submit(this); return false;">
	<input type="hidden" name="loginPwReal">
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
		<div class="option-btn small-con">
			<ul class="flex">
				<li style="margin-right: 20px;"><a href="forgotId">Forgot
						ID</a></li>
				<li><a href="forgotPw">Forgot Pw</a></li>
			</ul>
		</div>
	</div>
</form>

<%@ include file="../part/foot.jspf"%>