<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<h1>My page</h1>
<table>
	<tbody>
		<tr>
			<th>ID :</th>
			<td>${member.loginId}</td>
		</tr>
		<tr>
			<th>Name :</th>
			<td>${member.name}</td>
		</tr>
		<tr>
			<th>Nickname :</th>
			<td>${member.nickname}</td>
		</tr>
		<tr>
			<th>Email :</th>
			<td>${member.email}</td>
		</tr>
		<tr>
			<th>Joined :</th>
			<td>${member.regDate}</td>
		</tr>
		<tr>
			<th>Update :</th>
			<td>${member.updateDate}</td>
		</tr>
		<tr>
			<th>Native :</th>
			<td>${member.nativeLang}</td>
		</tr>
		<tr>
			<th>Practice :</th>
			<td>${member.practiceLang}</td>
		</tr>
	</tbody>
</table>
<ul>
	<!-- 	<li><a href="modifyProfile">Edit profile</a></li> -->
	<li><a href="checkPw">Edit profile</a></li>
</ul>
<%@ include file="../part/foot.jspf"%>