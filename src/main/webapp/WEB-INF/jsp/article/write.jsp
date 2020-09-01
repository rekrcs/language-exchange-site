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

	var ArticleWriteForm__submitDone = false;

	function ArticleWriteForm__submit(form) {
		if (ArticleWriteForm__submitDone) {
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
		ArticleWriteForm__submitDone = true;
	}

	function ArticleWriteForm__init() {
		$('form.form1 input, form.form1 textarea').keyup(function() {
			applyOnBeforeUnload();
		});
	}

	$(function() {
		ArticleWriteForm__init();
	});
</script>
<form class="form1" method="POST" action="doWrite"
	onsubmit="ArticleWriteForm__submit(this); return false;">
	<input type="hidden" name="code" value="${boardCode}" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Write in ${boardCode} board</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Title</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="title" placeholder="Please enter title" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Body</th>
					<td>
						<div class="form-control-box">
							<textarea name="body" placeholder="Please enter body"
								maxlength="2000"></textarea>
						</div>
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<button class="btn btn-primar" type="submit">write</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>
<%@ include file="../part/foot.jspf"%>