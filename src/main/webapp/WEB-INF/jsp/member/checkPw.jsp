<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script>
	var MemberCheckPwForm__submitDone = false;
	function MemberCheckPwForm__submit(form) {
		if (MemberCheckPwForm__submitDone) {
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

		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = '';

		form.submit();
		MemberCheckPwForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doCheckPw"
	onsubmit="MemberCheckPwForm__submit(this); return false;">
	<input type="hidden" name="loginPwReal">
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