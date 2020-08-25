<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
	<form method="POST" action="doJoin">
		<table>
			<tbody>
				<tr>
					<th>ID</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="loginId"
								placeholder="Please enter your ID" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Password</th>
					<td>
						<div class="form-control-box">
							<input type="password" name="loginPw"
								placeholder="Please enter your password" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Confirm</th>
					<td>
						<div class="form-control-box">
							<input type="password" name="loginPwConfirm"
								placeholder="Please enter your password again" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Name</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="name"
								placeholder="Please enter your name" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Nickname</th>
					<td>
						<div class="form-control-box">
							<input type="text" name="nickname"
								placeholder="Please enter your nickname" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>
						<div class="form-control-box">
							<input type="email" name="email"
								placeholder="Please enter your email" />
						</div>
					</td>
				</tr>
				<tr>
					<th>Native language</th>
					<td><div>
							<select name="nativeLang">
								<option value="">::choose::</option>
								<option value="english">English</option>
								<option value="korean">Korean</option>
							</select>
						</div></td>
				</tr>
				<tr>
					<th>Practice language</th>
					<td>
						<div>
							<select name="practiceLang">
								<option value="">::choose::</option>
								<option value="english">English</option>
								<option value="korean">Korean</option>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<button type="submit" class="btn btn-primary">Create
							account</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
<%@ include file="../part/foot.jspf"%>