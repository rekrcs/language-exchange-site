<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<table>
		<colgroup>
			<col width="80" />
			<col width="180" />
			<col width="80" />
			<col width="180" />
			<col />
		</colgroup>
		<thead>
			<tr>
				<th colspan="5"><h1>Learn Korean</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>No.</th>
				<th>Date</th>
				<th>Gender</th>
				<th>Nickname</th>
				<th>Introduce</th>
			</tr>
			<c:forEach items="${members}" var="member">
				<tr>
					<td>${member.id}</td>
					<td>${member.regDate}</td>
					<td>${member.gender}</td>
					<td><c:if test="${loginedMemberId != member.id}">
							<a href="" class="flex relative memberForMsg">
								${member.nickname}</a>
						</c:if> <c:if test="${loginedMemberId == member.id}">
							<a href="" class="flex relative"> ${member.nickname}(You)</a>
						</c:if><span class="msg absolute"><c:if
								test="${loginedMemberId != member.id}">
								<a href="../message/message?id=${member.id}">message</a>
							</c:if></span></td>
					<td>${member.introduce}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
	var rightLearnLang = 'N';
	if(${loginedMember.practiceLang.equals('Korean')}) {
		rightLearnLang = 'Y'
		}
	var a = document.getElementById(rightLearnLang);	
	</script>
	<div class="option-btn">
		<ul>
			<li><a href="#"
				onclick="location.href='upload?requestUri=${encodedRequestUri}&rightLearnLang=' + rightLearnLang; return flase;">upload</a></li>
		</ul>
	</div>
</div>
<%@ include file="../part/foot.jspf"%>