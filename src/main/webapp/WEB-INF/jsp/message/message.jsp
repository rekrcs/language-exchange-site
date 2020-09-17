<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function Chat__addMessage(body) {
		$.post('./doAddMessage', {
			fromMemberId : ${fromMemberId},
			toMemberId : ${toMemberId},
			body : body
		}, function(data) {

		}, 'json');
	}

	function Chat__drawMessage(chatMessage) {
		var html = chatMessage.fromMemberId + ' : ' + chatMessage.body;

		$('.chat-messages').prepend('<div>' + html + '</div>');
	}

	var Chat__lastLoadedMessagId = 0;

	function Chat__loadNewMessages() {
		$.get('./getMessagesFrom', {
			fromMemberId : ${fromMemberId},
			toMemberId : ${toMemberId},
			from : Chat__lastLoadedMessagId + 1
			}, function(data) {
				for (var i = 0; i < data.messages.length; i++) {
					var message = data.messages[i];
					console.log(message);
					Chat__drawMessage(message);

					Chat__lastLoadedMessagId = message.id;
				}
			}, 'json'

			);
		}

	setInterval(Chat__loadNewMessages, 1000);
	
	function submitChatMessageForm(form) {
		if (form.body.value.length == 0) {
			alert('Please enter your message');
			form.body.focus();

			return false;
		}

		var body = form.body.value;

		form.body.value = '';
		form.body.focus();

		Chat__addMessage(body);
	}
</script>
<form class="form1"
	onsubmit="submitChatMessageForm(this); return false;">
	<input type="hidden" name="id" value="${param.id}" />
	<div class="table-box small-con" style="max-width: 600px !important;">
		<table>
			<thead>
				<tr>
					<th colspan="2" style="background-color: #2d3540; color: white"><h1>Message</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2">
						<div class="form-control-box"
							style="overflow: scroll; max-height: 450px !important; height: 450px;">
							<div class="chat-messages"></div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-control-box">
							<textarea style="min-height: 100px !important;" name="body"
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