<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<form class="form1" method="POST" action="doWrite"
	onsubmit="ArticleWriteForm__submit(this); return false;">
	<input type="hidden" name="code" value="${boardCode}" />
	<div class="table-box small-con" style="max-width:600px!important;">
		<table>
			<thead>
				<tr>
					<th colspan="2" style="background-color: #2d3540; color: white"><h1>Message</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<div class="form-control-box" style="height: 450px"></div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-control-box">
							<textarea style="min-height: 100px!important;" name="message"
								placeholder="Please enter your message" maxlength="2000"></textarea>
						</div>
					</td>
					<td style="width: 1%">
						<button class="btn btn-primar" type="submit">send</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</form>

<%@ include file="../part/foot.jspf"%>