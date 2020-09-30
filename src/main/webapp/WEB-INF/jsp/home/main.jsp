<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
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
	<table style="margin-bottom: 100px">
		<colgroup>
			<col width="80" />
			<col width="80" />
			<col width="80" />
			<col width="180" />
		</colgroup>
		<thead>
			<tr>
				<th colspan="5"><h1>New member speaking Korean</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Gender</th>
				<th>Nickname</th>
			</tr>
			<c:forEach items="${membersSpeakKr}" var="memberSpeakKr">
				<tr>
					<td>${memberSpeakKr.id}</td>
					<td>${memberSpeakKr.regDate}</td>
					<td>${memberSpeakKr.gender}</td>
					<td><c:if test="${loginedMemberId != memberSpeakKr.id}">
							<a href="" class="flex relative memberForMsg">
								${memberSpeakKr.nickname}</a>
						</c:if> <c:if test="${loginedMemberId == memberSpeakKr.id}">
							<a href="" class="flex relative">
								${memberSpeakKr.nickname}(You)</a>
						</c:if><span class="msg absolute"><c:if
								test="${loginedMemberId != memberSpeakKr.id}">
								<a href="../message/message?id=${memberSpeakKr.id}">message</a>
							</c:if></span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table>
		<colgroup>
			<col width="80" />
			<col width="80" />
			<col width="80" />
			<col width="180" />
		</colgroup>
		<thead>
			<tr>
				<th colspan="5"><h1>New member speaking English</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Gender</th>
				<th>Nickname</th>
			</tr>
			<c:forEach items="${membersSpeakEn}" var="memberSpeakEn">
				<tr>
					<td>${memberSpeakEn.id}</td>
					<td>${memberSpeakEn.regDate}</td>
					<td>${memberSpeakEn.gender}</td>
					<td><c:if test="${loginedMemberId != memberSpeakEn.id}">
							<a href="" class="flex relative memberForMsg">
								${memberSpeakEn.nickname}</a>
						</c:if> <c:if test="${loginedMemberId == memberSpeakEn.id}">
							<a href="" class="flex relative">
								${memberSpeakEn.nickname}(You)</a>
						</c:if><span class="msg absolute"><c:if
								test="${loginedMemberId != memberSpeakEn.id}">
								<a href="../message/message?id=${memberSpeakEn.id}">message</a>
							</c:if></span></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%@ include file="../part/foot.jspf"%>