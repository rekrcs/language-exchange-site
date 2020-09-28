<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.reply-write {
	padding-bottom: 60px;
}

.reply-write>form>table {
	width: 100%;
	border-collapse: collapse;
}

.reply-write>form>table th, .reply-write>form>table td {
	border: 1px solid black;
	padding: 10px;
}

.reply-write>form>table textarea {
	width: 100%;
	display: block;
	box-sizing: border-box;
	height: 100px;
	resize: none;
}
</style>

<!-- 리스트 css -->
<style>
.table-box2 {
	padding-bottom: 50px;
}

/* 타이틀 가운데 정렬 */
.table-box2>table thead>tr>th {
	text-align: center;
}

.table-box2>table {
	width: 100%;
	border-collapse: collapse;
}

.table-box2>table th, .table-box2>table td {
	border: 1px solid black;
	padding: 10px;
	text-align: left;
}
</style>
<script>
	
</script>
<div class="table-box small-con">
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Detail</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>Board</th>
				<td>${board.name}</td>
			</tr>
			<tr>
				<th>No.</th>
				<td>${article.id}</td>
			</tr>
			<tr>
				<th>Date</th>
				<td>${article.regDate}</td>
			</tr>
			<tr>
				<th>Update Date</th>
				<td>${article.updateDate}</td>
			</tr>
			<tr>
				<th>Writer</th>
				<td>${article.extra.writer}</td>
			</tr>
			<tr>
				<th>Title</th>
				<td>${article.title}</td>
			</tr>
			<tr>
				<th>Body</th>
				<td>${article.body}</td>
			</tr>
		</tbody>
	</table>

	<div class="option-btn small-con">
		<c:if test="${loginedMemberId == article.memberId}">
			<ul class="flex">
				<li style="margin-right: 20px;"><a
					onclick="if ( confirm('are you going to delete it?') == false ) return false;"
					href="${boardCode}-deleteArticle?id=${article.id}">Delete</a></li>
				<li><a
					href="${boardCode}-modifyArticle?id=${article.id}&redirectUri=${encodedRequestUri}">Modify</a></li>
			</ul>
		</c:if>
	</div>


	<script>
		var ArticleWriteReplyForm__submitDone = false;
		function ArticleWriteReplyForm__submit(form) {
			if (ArticleWriteReplyForm__submitDone) {
				alert('working on it.');
			}
			form.body.value = form.body.value.trim();
			if (form.body.value.length == 0) {
				alert('Please enter your reply');
				form.body.focus();
				return;
			}
			ArticleWriteReplyForm__submitDone = true;


			$.ajax({
				url : '../reply/doWriteReplyAjax',
				data : {
					body : form.body.value,
					articleId : ${article.id},
					memberId : ${article.memberId}
				},

				dataType : "json",
				type : 'POST',
				success : function(data) {
				}
			});
			
			form.body.value = '';
			var ArticleWriteReplyForm__submitDone = false;	
		}
	</script>

	<h1 class="reply-write-title">Write reply</h1>

	<div class="reply-write">
		<form action=""
			onsubmit="ArticleWriteReplyForm__submit(this); return false;">
			<table>
				<colgroup>
					<col width="100">
				</colgroup>
				<tbody>
					<tr>
						<th>Body</th>
						<td>
							<div>
								<textarea placeholder="Please enter your reply." name="body"
									maxlength="300"></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><input type="submit" value="Write"> <input
							type="reset" value="Cancel"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<h1>Reply list</h1>

	<script>
	var ArticleReply__lastLoadedArticleReplyId = 0;
	function ArticleReply__loadList() {
		$.get('../reply/getForPrintArticleRepliesRs', {
			articleId : param.id,
			from : ArticleReply__lastLoadedArticleReplyId + 1
		}, function(data) {
			data.articleReplies = data.articleReplies.reverse();
			
			for (var i = 0; i < data.articleReplies.length; i++) {
				var articleReply = data.articleReplies[i];
				ArticleReply__drawReply(articleReply);

				ArticleReply__lastLoadedArticleReplyId = articleReply.id;
			}
		}, 'json');
	}

	var ArticleReply__$listTbody;

	function ArticleReply__drawReply(articleReply) {
		var html = '';

		html = '<tr data-article-reply-id="' + articleReply.id + '">';
		html += '<td>' + articleReply.id + '</td>';
		html += '<td>' + articleReply.regDate + '</td>';
		html += '<td>' + articleReply.extra.writer + '</td>';
		html += '<td>' + articleReply.body + '</td>';
		html += '<td>';
		html += '<a href="#">삭제</a>';
		html += '<a href="#">수정</a>';
		html += '</td>';
		html += '</tr>';

		ArticleReply__$listTbody.prepend(html);
	}

	$(function() {
		ArticleReply__$listTbody = $('.reply-list-box > table tbody');

		setInterval(ArticleReply__loadList, 1000);
	});
</script>
	<div class="reply-list-box table-box2">
		<table>
			<colgroup>
				<col width="80">
				<col width="180">
				<col width="180">
				<col>
				<col width="200">
			</colgroup>
			<thead>
				<tr>
					<th>No.</th>
					<th>Date</th>
					<th>Writer</th>
					<th>Body</th>
					<th>Note</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</div>


<%@ include file="../part/foot.jspf"%>