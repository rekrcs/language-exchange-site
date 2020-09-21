<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../part/head.jspf"%>
<style>
.background-msg {
	background-color: #D6E6F0;
	padding: 0 !important;
}

.msg {
	padding: 10px;
	max-width: 70%;
	border-radius: 1rem;
}

.msg.myMsg {
	float: right;
	background-color: #A3CCA3;
	margin-right: 15px;
}

.msg.others {
	float: left;
	background-color: white;
	margin-left: 15px;
}

.msgHelpBox {
	height: 10px;
	clear: both;
}

.msgHelpBox:last-child {
	display: none;
}

.downScroll {
	margin: 10px 0;
	overflow: auto;
	max-height: 500px !important;
	height: 500px;
	max-width: 599px;
	word-break: break-all;
	overflow: auto;
}
</style>
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

	function Chat__drawMessage(chatMessage, fromMemberId) {
		
		if(fromMemberId == ${fromMemberId}) {
			var html = chatMessage.body;
			$('.chat-messages').append('<div class="msg myMsg">' + html + '</div>');
			$('.chat-messages').append('<div class="msgHelpBox"></div>');
		} else {
			var html = '${toMember}  : ' + chatMessage.body;
			$('.chat-messages').append('<div class="msg others">' + html + '</div>');
			$('.chat-messages').append('<div class="msgHelpBox"></div>');
			}
		
		$('.downScroll').scrollTop($('.downScroll')[0].scrollHeight);
	
	}
	
	var Chat__lastLoadedMessagId = 0;
	var Chat__iSent = null;

	function Chat__loadNewMessages() {
		$.get('./getMessagesFrom', {
			fromMemberId : ${fromMemberId},
			toMemberId : ${toMemberId},
			from : Chat__lastLoadedMessagId + 1
			}, function(data) {		
				for (var i = 0; i < data.messages.length; i++) {
					Chat__drawMessage(data.messages[i], data.messages[i].fromMemberId);

					Chat__lastLoadedMessagId = data.messages[i].id;
				}
			}, 'json'

			);
		}

	setInterval(Chat__loadNewMessages, 1000);
	
	function submitChatMessageForm(form) {
		if (form.body.value.length == 0) {
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
					<th colspan="2" style="background-color: #2d3540; color: white;"><h1>Message</h1></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="2" class="background-msg">
						<div class="form-control-box downScroll" style="">
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