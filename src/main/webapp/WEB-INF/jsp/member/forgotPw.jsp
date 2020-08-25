<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script>
	var MemberForgotPwForm__submitDone = false;
	function MemberForgotPwForm__submit(form) {
		if (MemberForgotPwForm__submitDone) {
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

		if (form.email.value.length == 0) {
			form.email.focus();
			alert('Please enter your email');

			return;
		}
		form.submit();
		MemberForgotPwForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doForgotPw"
	onsubmit="MemberForgotPwForm__submit(this); return false;">

	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Forgot Pw</h1></th>
				</tr>
			</thead>
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
					<th></th>
					<td>
						<button type="submit" class="btn btn-primary">Send code
							email</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>