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

		removeOnBeforeUnload();
		form.submit();
		ArticleLiveWriteForm__submitDone = true;
	}


	function ArticleLiveWriteForm__init() {
		$('form.form1 input, form.form1 .toast-editor.input-body').keyup(function() {
			applyOnBeforeUnload();
		});
	}

	$(function() {
		ArticleLiveWriteForm__init();
	});
</script>
<form class="form1" method="POST" action="doWrite"
	onsubmit="ArticleLiveWriteForm__submit(this); return false;">
	<input type="hidden" name="code" value="${boardCode}" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Write in Live</h1></th>
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
					<th>내용</th>
					<td>
						<div class="form-control-box">
							<script type="text/x-template">
# 제목
![img](https://placekitten.com/200/287)
이미지는 이렇게 씁니다.

# 유투브 동영상 첨부

아래와 같이 첨부할 수 있습니다.

```youtube
https://www.youtube.com/watch?v=LmgWxezH7cc
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