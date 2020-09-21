<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script>
	var UploadMyProfileForm__submitDone = false;
	function UploadMyProfileForm__submit(form) {
		if (UploadMyProfileForm__submitDone) {
			alert("It's being done right now.");
			return;
		}

		form.introduce.value = form.introduce.value.trim();

		if (form.introduce.value.length == 0) {
			form.introduce.focus();
			alert('Please enter introduce.');

			return;
		}

		form.submit();
		UploadMyProfileForm__submitDone = true;
	}
</script>
<form class="form1" method="POST" action="doUploadProfile"
	onsubmit="UploadMyProfileForm__submit(this); return false;">
	<input type="hidden" name="redirectUri" value="${beforeRequestUri}">
	<input type="hidden" name="id" value="${loginedMember.id}">
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Meet friends</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>ID</th>
					<td><div class="form-control-box">${loginedMember.loginId}</div></td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td><div class="form-control-box">${loginedMember.nickname}</div></td>
				</tr>
				<tr>
					<th>Email</th>
					<td><div class="form-control-box">${loginedMember.email}</div></td>
				</tr>
				<tr>
					<th>Introduce</th>
					<td><div class="form-control-box">
							<textarea name="introduce" placeholder="Please write about you"
								maxlength="2000"></textarea>
						</div></td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button type="submit" class="btn btn-primary">upload</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>

<%@ include file="../part/foot.jspf"%>