<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var onBeforeUnloadSetted = false;
	var onBeforeUnload = function(e) {
		return '떠나시겠습니까?'; // 요새 브라우저는 이 메시지가 아닌 자체의 메세지가 나옵니다.
	};

	function applyOnBeforeUnload() {
		if (onBeforeUnloadSetted)
		return;
		$(window).bind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 등록
		onBeforeUnloadSetted = true;
	}
	function removeOnBeforeUnload() {
		$(window).unbind('beforeunload', onBeforeUnload); // 떠날 때 실행되는 함수를 해제
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

	function ArticleWriteForm__submit() {
		// 폼의 특정 요소를 건드리(?)면, 그 이후 부터 외부로 이동하는 것에 참견하는 녀석을 작동시킨다.
		$('form.form1 input, form.form1 textarea').keyup(function() {
			applyOnBeforeUnload();
		});
	}

	ArticleWriteForm__submit();
</script>
<form class="form1" method="POST" action="doWrite"
	onsubmit="ArticleWriteForm__submit(this); return false;">
	<input type="hidden" name="code" value="${boardCoade}" />
	<div class="table-box small-con">
		<table>
			<thead>
				<tr>
					<th colspan="3"><h1>Write in ${boardCoade} board</h1></th>
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