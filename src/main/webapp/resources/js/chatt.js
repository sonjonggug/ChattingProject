/**
 * web socket
 */

function getId(id){
	return document.getElementById(id);
}

var data = {};//전송 데이터(JSON)

var ws ;
var mid = getId('mid');
var btnLogin = getId('btnLogin');
var btnSend = getId('btnSend');
var talk = getId('talk');
var msg = getId('msg');


document.addEventListener("DOMContentLoaded", function(){
 ws = new WebSocket("ws://" + location.host + "/chatt");
	ws.onmessage = function(msg){
		var data = JSON.parse(msg.data);
		var css;
		
		if(data.mid == mid.value){
			css = 'class=me';
		}else{
			css = 'class=other';
		}
		
		var item = `<div ${css} >
		                <span><b>${data.mid}</b></span> [ ${data.date} ]<br/>
                      <span>${data.msg}</span>
						</div>`;
					
		talk.innerHTML += item;
		talk.scrollTop=talk.scrollHeight;//스크롤바 하단으로 이동
		}
	
});
/**
* window.onbeforeunload : 페이지 이동시 이벤트 
* 페이지 이동시 다른 client에게 퇴장 알림 
 */
window.onbeforeunload = function () {		
		data.mid = getId('exitAlram').value;
		data.msg = "";		
		data.date = new Date().toLocaleString();
		var text = JSON.stringify(data);
		ws.send(text);	
	return true ;
};
setTimeout(function() {
 sendo();
}, 2000);

msg.onkeyup = function(ev){
	if(ev.keyCode == 13){
		send();
	}
}

btnSend.onclick = function(){
	send();
}
function send(){
	if(msg.value.trim() != ''){
		talkBot();
		data.mid = getId('mid').value;
		data.msg = msg.value;
		data.date = new Date().toLocaleString();
		var temp = JSON.stringify(data);
		ws.send(temp);
		$("#msg").attr("readonly",true);
//		$("#msg").attr('placeholder', "");
	}
	msg.value ='';
	
}
function sendo(){		
		data.mid = getId('alram1').value;
		data.msg = "";		
		data.date = new Date().toLocaleString();
		var tom = JSON.stringify(data);
		ws.send(tom);	    
}