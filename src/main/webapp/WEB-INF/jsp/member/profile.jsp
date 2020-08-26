<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<style>
.option-btn2-container {
	text-align: right;
}

.option-btn2 {
	padding: 30px 0;
	display: inline-block;
	font-weight: bold;
	font-size: 1.5rem;
	background-color: red;
	color: white;
	padding: 15px 20px;
}

.option-btn2>ul>li:hover>a {
	color: #84a6cb;
}
</style>
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
	<div class="option-btn">
		<ul>
			<li><a href="checkPw?work=editProfile">Edit profile</a></li>
		</ul>
	</div>
	<div class="option-btn2-container">
		<div class="option-btn2">
			<ul>
				<li><a href="checkPw?work=deleteAccount">Delete account</a></li>
			</ul>
		</div>
	</div>
</div>



<%@ include file="../part/foot.jspf"%>