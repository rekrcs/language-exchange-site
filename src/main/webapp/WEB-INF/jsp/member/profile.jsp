<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<div class="table-box small-con">
	<table>
		<thead>
			<tr>
				<th colspan="3"><h1>Profile</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th>ID</th>
				<td>${member.loginId}</td>
			</tr>
			<tr>
				<th>Name</th>
				<td>${member.name}</td>
			</tr>
			<tr>
				<th>Nickname</th>
				<td>${member.nickname}</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>${member.email}</td>
			</tr>
			<tr>
				<th>Joined</th>
				<td>${member.regDate}</td>
			</tr>
			<tr>
				<th>Update</th>
				<td>${member.updateDate}</td>
			</tr>
			<tr>
				<th>Native</th>
				<td>${member.nativeLang}</td>
			</tr>
			<tr>
				<th>Practice</th>
				<td>${member.practiceLang}</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="option-btn small-con">
	<ul>
		<li><a href="checkPw">Edit profile</a></li>
	</ul>
</div>
<%@ include file="../part/foot.jspf"%>