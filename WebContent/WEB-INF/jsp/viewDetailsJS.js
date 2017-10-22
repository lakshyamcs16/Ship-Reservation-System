var req;

function deleteShip(){
	req = new XMLHttpRequest();
	var shipid = document.getElementById('delete').title;
	alert(shipid);
	/*var url = "ShipServlet?shipid="+shipid;
	
	req.onreadystatechange = getResponse;
	req.open("GET",url,true);
	req.send(null);*/
	
}
/*
function getResponse(){
	
				
				if (req.readyState==4){
					if(req.responseText=="<font color=red>Login details are incorrect</font>"){
					
						document.getElementById("result").innerHTML = req.responseText;
					}else{
					
							var output = req.responseText;
							var OpenWindow = window.open("homepage.html", "_self", '','true');
					        OpenWindow.dataFromParent = output; // dataFromParent is a variable in child.html
					        document.write(OpenWindow.dataFromParent);
					        
					}
				}
		
}*/