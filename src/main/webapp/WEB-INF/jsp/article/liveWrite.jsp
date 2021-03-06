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

	var ArticleLiveWriteForm__submitDone = false;

	function ArticleLiveWriteForm__submit(form) {
		if (ArticleLiveWriteForm__submitDone) {
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
		ArticleLiveWriteForm__submitDone = true;
	}

	function ArticleLiveWriteForm__init() {
		$('form.form1 input, form.form1 .toast-editor.input-body').keyup(
				function() {
					applyOnBeforeUnload();
				});
	}

	$(function() {
		ArticleLiveWriteForm__init();
	});
</script>
<form class="form1" method="POST" action="doWrite"
	onsubmit="ArticleLiveWriteForm__submit(this); return false;">
	<input type="hidden" name="code" value="${boardCode}" /> <input
		type="hidden" name="body" /> <input type="hidden" name="redirectUri"
		value="${redirectUri}" /><input type="hidden" name="title"
		value="N/AinLiveBoard" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Write in Live</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Body</th>
					<td>
						<div class="form-control-box">
							<script type="text/x-template">
# Picture
you can upload pictures with picture's Link

# YouTube upload
you can upload YouTube in the way below.

```youtube
https://youtu.be/pzgNzT-9WPU
```</script>
							<div data-relTypeCode="article" data-relId="0"
								class="toast-editor input-body"></div>
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