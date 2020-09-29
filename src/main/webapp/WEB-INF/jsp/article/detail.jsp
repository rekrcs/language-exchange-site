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

.note-box {
	text-decoration: underline;
	color: #0275d8;
}

.note-box>a:hover {
	color: #ed6942;
}

.note-box>span {
	padding-left: 10px;
}

@media ( max-width : 799px) {
	.note-box>a {
		display: block;
	}
	.note-box>span {
		display: none;
	}
}

.reply-list-box tr[data-modify-mode="Y"] .modify-mode-none {
	display: none;
}

.reply-list-box tr .modify-mode-inline {
	display: none;
}

.reply-list-box tr .modify-mode-block {
	display: none;
}

.reply-list-box tr[data-modify-mode="Y"] .modify-mode-block {
	display: block;
}

.reply-list-box tr[data-modify-mode="Y"] .modify-mode-inline {
	display: inline;
}

.modify-mode-block>form>textarea {
	width: 100%;
	height: 50px;
	resize: none;
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
			if(${!isLogined}) {
				alert('you can write reply after login');
				form.body.focus();
				return;
				}
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
					memberId : ${loginedMemberId}
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
			from : ArticleReply__lastLoadedArticleReplyId + 1,
			ajax : 'Y'
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
		html += '<td><div class="reply-body-text modify-mode-none">' + articleReply.body 
		+ '</div><div class="modify-mode-block">'+ '<form onsubmit="ArticleReply__submitModifyReplyForm(this); return false;">' 
		+ '<textarea name="body">' 
		+ articleReply.body + '</textarea><br /> <input class="loading-none" type="submit" value="modify" />' 
		+'</form></div></td>';
		html += '<td class="note-box">';
		if(${loginedMemberId} == articleReply.memberId) {
		html += '<a href="#" onclick="if ( confirm(\'are you going to delete this reply?\') ) { ArticleReply__delete(this); } return false;">delete</a>';		
		html += '<span></span>';
		html += '<a href="#" class="modify-mode-none" onclick="ArticleReply__enableModifyMode(this); return false;">modify</a>';
		html += '<a href="#" class="modify-mode-inline" onclick="ArticleReply__disableModifyMode(this); return false;">cencle</a>';
		}
		html += '</td>';
		html += '</tr>';

		ArticleReply__$listTbody.prepend(html);
	}

	$(function() {
		ArticleReply__$listTbody = $('.reply-list-box > table tbody');

		setInterval(ArticleReply__loadList, 1000);
	});


	function ArticleReply__delete(obj) {
		var $clickedBtn = $(obj);
		var $tr = $clickedBtn.closest('tr');

		var replyId = parseInt($tr.attr('data-article-reply-id'));
		$.post(
		'../reply/doDeleteReplyAjax',
		{
			id: replyId
		},
		function(data) {
			$tr.remove();
		}, 'json');
		}

	function ArticleReply__enableModifyMode(obj) {
		var $clickedBtn = $(obj);
		var $tr = $clickedBtn.closest('tr');

		var $replyBodyText = $tr.find('.reply-body-text');
		var $textarea = $tr.find('form textarea');

		$textarea.val($replyBodyText.text().trim());

		$tr.attr('data-modify-mode', 'Y');
	}

	function ArticleReply__disableModifyMode(obj) {
		var $clickedBtn = $(obj);
		var $tr = $clickedBtn.closest('tr');

		$tr.attr('data-modify-mode', 'N');
	}

	function ArticleReply__submitModifyReplyForm(form) {
		var $tr = $(form).closest('tr');
		form.body.value = form.body.value.trim();
		
		if (form.body.value.length == 0) {
			alert('Please enter your reply');
			form.body.focus();

			return false;
		}
		
		var replyId = parseInt($tr.attr('data-article-reply-id'));
		var body = form.body.value;

		$.post('../reply/doModifyReplyAjax', {
			id : replyId,
			body : body
		}, function(data) {
			
			ArticleReply__disableModifyMode(form);

			var $replyBodyText = $tr.find('.reply-body-text');
			var $textarea = $tr.find('form textarea');

			$replyBodyText.text($textarea.val());
			
			});
		}
	
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