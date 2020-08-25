<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script>
	var MemberForgotIdForm__submitDone = false;
	function MemberForgotIdForm__submit(form) {
		if (MemberForgotIdForm__submitDone) {
			alert("It's being done right now.");
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
		MemberForgotIdForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doForgotId"
	onsubmit="MemberForgotIdForm__submit(this); return false;">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Forgot ID</h1></th>
				</tr>
			</thead>
			<tbody>
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
						<button type="submit" class="btn btn-primary">Send ID
							email</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>