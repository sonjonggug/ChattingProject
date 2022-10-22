/**
 * API 통신
 */

 	function English(){
 		var text= $("#msg").val();
	   $.ajax({
	        type : 'GET',
	        url :'/SearchEng',
	        data :{
	    		lang : text,	    		
	    	},
	        dataType : "json",
	        success : function(data) {        
	            $("#msg").val(data.message.result.translatedText);
	        },
	        error : function(error) {
	            alert("실패하였습니다.");
           
	        }
	    }); 
 	}
	function China(){
 		var text= $("#msg").val();
	   $.ajax({
	        type : 'GET',
	        url :'/SearchChi',
	        data :{
	    		lang : text,	    		
	    	},
	        dataType : "json",
	        success : function(data) {        	
	            $("#msg").val(data.message.result.translatedText);
	        },
	        error : function(error) {
	            alert("실패하였습니다.");
           
	        }
	    }); 
 	}
	function SearchCnt(){
      
	var text = $("#channel").val();	
		$.ajax({
	 		 type : 'GET',
	 	    url :'/SearchCnt',
	 	   	data :{
	 	   	channel : text,	    		
	    	},
	 	    dataType : "json",
//	 	   	contentType : 'application/json',
	 	    success : function(data) {       
	 	    	  $("#user_cnt").text("현재 "+data+"명 접속중입니다."); 	 	    	 
	 	    },
	 	    error : function(error) {
	 	        alert("실패하였습니다.");    	 	        
	 	    }
	 		}); 
			
	}
	function talkBot(){
	      
		var text = $("#msg").val(); // 메시지 정보
		var userid = $("#mid").val(); // 메시지 정보
		var channel_name = $("#channel").val(); // 메시지 정보
		
		var msg = " 정보:거주지 서울, 나이 20대, 성별 여자, 말투 반말 정보를 바탕으로 질문에 답하세요. Q : "+text+ "A :";	
		
					
		
			$.ajax({
		 		 type : 'GET',
		 	    url :'/talkBot',
		 	   	data :{
		 	   	talk : text ,
		 	   	userid : userid ,
		 	   	channel_name : channel_name , 
		 	   	QA : msg
		    	},
		 	    dataType : "json",

		 	    success : function(data) {
		 	    	var prompt_tokens = data.usage.prompt_tokens;
		 	    	var generated_tokens = data.usage.generated_tokens;
		 	    	
		 	    	var str = data.generations[0].text;
		 	    	var words = str.indexOf(':'); // 첫번째로 Q가 있는 위치 index 리턴 		  	    	
		 	    	var result = str.slice(0, words-2); //0부터 첫번째 Q가 있는위치까지 짜름
		 	    	$('input[name=alram1]').attr('value',result);
		 	    	botsend();
		 	    	talkBotSave(result,prompt_tokens,generated_tokens);		
		 	       $("#msg").removeAttr("readonly");       // readonly 삭제
		 	      $("#msg").removeAttr('placeholder');
		 	    },
		 	    error : function(error) {
		 	        alert(error);    	 	        
		 	    }
		 		}); 
	}
		function talkBotSave(result,prompt_tokens,generated_tokens){
			var userid = $("#mid").val(); // 메시지 정보
			 console.log(result,prompt_tokens,generated_tokens);							
					$.ajax({
				 		 type : 'GET',
				 	    url :'/talkBotSave',
				 	   	data :{
				 	   		userid : userid ,
				 	   		result : result ,
				 	   		prompt_tokens : prompt_tokens ,
				 	  		generated_tokens : generated_tokens  				 	   
				    	},
				 	    dataType : "json"
				 		}); 		
				
		}