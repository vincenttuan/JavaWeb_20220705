<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="https://unpkg.com/purecss@2.1.0/build/pure-min.css">
		<meta charset="UTF-8">
		<title>WebSocket Client</title>
		<script type="text/javascript">
			// 當html頁面元件載入完畢之後要做的程序
			window.onload = function() {
				var webSocket = null;
				// 獲取 DOM 元件
				var username = document.getElementById("username");
				var message = document.getElementById("message");
				var loginBtn = document.getElementById("loginBtn");
				var submitBtn = document.getElementById("submitBtn");
				
				// 按下 loginBtn 要做的事
				loginBtn.addEventListener("click", function(){
					//alert('按下 登入');
					setWebSocket();
				});
				
				// 按下 submitBtn 要做的事
				submitBtn.addEventListener("click", function(){
					alert('按下 傳送');
				});
			};
			
			// 設置 WebSocket
			function setWebSocket() {
				var url = 'ws://' + window.location.hostname + ':8080${pageContext.request.contextPath}/websocket_endpoint';
				console.log(url);
				// 建立 WebSocket 連線
				webSocket = new WebSocket(url);
				// 以下就可以開始偵測 websocket 的各種事件
				webSocket.onopen = function(event) { // 連線成功
					console.log('連線成功');
				};
				webSocket.onmessage = function(event) { // 接收訊息
					var msg = event.data;
					console.log(msg);
				};
				webSocket.onerror = function(event) { // 連線失敗
					
				};
				webSocket.onclose = function(event) { // 連線關閉
					
				};
			}
			
		</script>
	</head>
	<body style="padding: 15px">
		
		<form class="pure-form" id="chatRoomForm" onsubmit="return false;">
			<fieldset>
				<legend>WebSocket Client</legend>
				姓名: <input type="text" id="username" placeholder="請輸入名稱" required="required" />
				<button type="button" class="pure-button pure-button-primary" id="loginBtn">登入</button>
				<p />
				訊息: <input type="text" id="message" placeholder="請輸入訊息" required="required" />
				<button type="submit" class="pure-button pure-button-primary" id="submitBtn">傳送</button>
				<p />
			</fieldset>
		</form>
		
		<div id="messageDisplay"></div>
		
	</body>
</html>