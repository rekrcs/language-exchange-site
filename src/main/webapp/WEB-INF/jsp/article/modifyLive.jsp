<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<%@ include file="../part/toastuiEditor.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.20/lodash.min.js"></script>
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

	var ArticleLiveModifyForm__submitDone = false;

	function ArticleLiveModifyForm__submit(form) {
		if (ArticleLiveModifyForm__submitDone) {
			alert("It's being done right now.");
			return;
		}

		form.title.value = form.title.value.trim();

		if (form.title.value.length == 0) {
			form.title.focus();
			alert('Please enter Title.');

			return;
		}

		var bodyEditor = $(form).find('.toast-editor.input-body').data(
				'data-toast-editor');

		var body = bodyEditor.getMarkdown().trim();

		if (body.length == 0) {
			bodyEditor.focus();
			alert('Please enter Body.');

			return;
		}

		form.body.value = body;

		removeOnBeforeUnload();
		form.submit();
		ArticleLiveModifyForm__submitDone = true;
	}

	function ArticleLiveModifyForm__init() {
		$('form.form1 input, form.form1 .toast-editor.input-body').keyup(
				function() {
					applyOnBeforeUnload();
				});
	}

	$(function() {
		ArticleLiveModifyForm__init();
	});
</script>
<form class="form1" method="POST" action="doModifyLive"
	onsubmit="ArticleLiveModifyForm__submit(this); return false;">
	<input type="hidden" name="body" /> <input type="hidden" name="id"
		value="${param.id}" /><input type="hidden" name="title"
		value="N/AinLiveBoard" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Modify Live</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Body</th>
					<td>
						<div class="form-control-box">
							<script type="text/x-template">
${article.body}
```</script>
							<div data-relTypeCode="article" data-relId="0"
								class="toast-editor input-body"></div>
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