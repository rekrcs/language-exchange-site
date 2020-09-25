<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var onBeforeUnloadSetted = false;
	var onBeforeUnload = function(e) {
		return 'Are you sure you want to leave your writing?';
	};

	function applyOnBeforeUnload() {
		if (onBeforeUnloadSetted)
			return;
		$(window).bind('beforeunload', onBeforeUnload);
		onBeforeUnloadSetted = true;
	}
	function removeOnBeforeUnload() {
		$(window).unbind('beforeunload', onBeforeUnload);
		onBeforeUnloadSetted = false;
	}

	var ArticleModifyForm__submitDone = false;

	function ArticleModifyForm__submit(form) {
		if (ArticleModifyForm__submitDone) {
			alert("It's being done right now.");
			return;
		}
		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			form.title.focus();
			alert('Please enter Title.');

			return;
		}

		form.body.value = form.body.value.trim();

		if (form.body.value.length == 0) {
			form.body.focus();
			alert('Please enter Body.');

			return;
		}

		removeOnBeforeUnload();
		form.submit();
		ArticleModifyForm__submitDone = true;
	}

	function ArticleModifyForm__init() {
		$('form.form1 input, form.form1 textarea').keyup(function() {
			applyOnBeforeUnload();
		});
	}

	$(function() {
		ArticleModifyForm__init();
	});
</script>
<form class="form1" method="POST" action="doModify"
	onsubmit="ArticleModifyForm__submit(this); return false;">
	<input type="hidden" name="id" value="${article.id}" />
	<input type="hidden" name="redirectUri" value="${param.redirectUri}" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Modify in ${boardCode} board</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Title</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="title" value="${article.title}" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Body</th>
					<td>
						<div class="form-control-box">
							<textarea name="body" maxlength="2000">${article.body}</textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button class="btn btn-primar" type="submit">modify</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>