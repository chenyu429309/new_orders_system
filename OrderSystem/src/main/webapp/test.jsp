<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.ba-hashchange.min.js"></script>
<script type="text/javascript">
	$(function(){
		 $(function(){  
		        var saveDataAry=[];  
		        var data1={"userName":"test","address":"gz"};  
		        var data2={"userName":"ququ","address":"gr"};  
		        saveDataAry.push(data1);  
		        saveDataAry.push(data2);         
		        $.ajax({ 
		            type:"POST", 
		            url:"user/saveUser", 
		            dataType:"json",      
		            contentType:"application/json",               
		            data:JSON.stringify(saveDataAry), 
		            success:function(data){ 
		                                       
		            } 
		         }); 
		    });  
// 		 $(window).hashchange(function(e){
// 			 var i=array.length;
// 			 if(i>=2){
// 			 $("#home").html(array[i-2]);
// 				array.pop();
// 				window.history.pushState(null, null, "");
// 			 }
// 		 } ) 
// 		 array=[];
// 		 array.push($("#home").html());
// 		 window.history.pushState( "#"+"t1.jsp", null, "#"+"test.jsp");
// 		 $('#home').load('user/test');
	})
	
</script>
</head>
<body>
		<div id="home">
			1232
		
		</div>
</body>
</html>