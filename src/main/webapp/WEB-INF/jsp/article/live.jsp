<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<%@ include file="../part/toastuiEditor.jspf"%>
<style>
.msg>a {
	display: none;
}

td:hover>.msg>a {
	background-color: #aa88dd;
	color: white;
	padding: 2px 5px;
	border-radius: 0.2rem;
	display: inline-block;
}

.memberForMsg {
	text-decoration: underline;
	color: #0275d8;
}
</style>
<div class="table-box small-con">
	<div class="option-btn">

		<ul>
			<li><a
				href="${boardCode}-liveWrite?redirectUri=${encodedRequestUri}">write</a></li>
		</ul>
	</div>
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Live</h1></th>
			</tr>
		</thead>
		<c:forEach items="${articles}" var="article">
			<tbody>
				<tr>
					<th>Update Date</th>
					<td>${article.updateDate}</td>
				</tr>
				<tr>
					<th>Writer</th>
					<%-- 					<td>${article.extra.writer}</td> --%>
					<td><c:if test="${loginedMemberId != article.memberId}">
							<a href="#" class="flex relative memberForMsg">
								${article.extra.writer}</a>
						</c:if> <c:if test="${loginedMemberId == article.memberId}">
							<a href="#" class="flex relative">
								${article.extra.writer}(You)</a>
						</c:if><span class="msg absolute"><c:if
								test="${loginedMemberId != article.memberId}">
								<a href="../message/message?id=${article.memberId}">message</a>
							</c:if></span></td>
				</tr>
				<tr>
					<th>Title</th>
					<td>${article.title}</td>
				</tr>
				<tr>
					<th>Body</th>
					<td><script type="text/x-template">${article.body}</script>
						<div class="toast-editor toast-editor-viewer"></div></td>
				</tr>
				<tr style="margin-bottom: 100px;">
					<th></th>

					<td><div class="option-btn-live" style="min-height: 29px">
							<c:if test="${loginedMemberId == article.memberId}">
								<ul class="flex">
									<li><a style="margin-right: 20px;"
										onclick="if ( confirm('are you going to delete it?') == false ) return false;"
										href="${boardCode}-deleteArticle?id=${article.id}">Delete</a></li>
									<li><a href="modifyarticle">Modify</a></li>
								</ul>
							</c:if>
						</div></td>
				</tr>
				<tr>
					<td colspan="3"
						style="border-left-style: none; border-right-style: none; border-bottom-style: none">
						&nbsp &nbsp</td>
				</tr>
				<tr>
					<td colspan="3"
						style="border-left-style: none; border-right-style: none; border-top-style: none">
						&nbsp &nbsp</td>
				</tr>
			</tbody>
		</c:forEach>

	</table>
	<!-- 	<div class="option-btn small-con"> -->
	<!-- 		<ul class="flex"> -->
	<!-- 			<li style="margin-right: 20px;"><a -->
	<!-- 				onclick="if ( confirm('are you going to delete it?') == false ) return false;" -->
	<%-- 				href="${boardCode}-deleteArticle?id=${article.id}">Delete</a></li> --%>
	<!-- 			<li><a href="modifyarticle">Modify</a></li> -->
	<!-- 		</ul> -->
	<!-- 	</div> -->
</div>


<%@ include file="../part/foot.jspf"%>