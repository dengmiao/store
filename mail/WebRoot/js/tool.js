function getcurDate() {
	var today = new Date();  
	var year = today.getFullYear();
	var month = today.getMonth() + 1;
	var date = today.getDate();
	var curDate = year+"-"+month+"-"+date;
	return curDate;
}

function getcurTime() {
	var Digital=new Date();  
	var hours=Digital.getHours();  
	var minutes=Digital.getMinutes();  
	var seconds=Digital.getSeconds();  
	if(minutes<=9){  
	    minutes="0"+minutes;  
	}if(seconds<=9){  
	    seconds="0"+seconds;
	}
	myclock = hours+":"+minutes+":"+seconds;  
	return myclock;
}

function hoursToCN() {
	var Digital=new Date();  
	var hours=Digital.getHours();
	return hours < 2 ? 
			"深夜" : hours < 5 ? 
					"凌晨" : hours < 8 ? 
							"早晨" : hours < 12 ?
									"上午" : hours < 14 ?
											"中午" : hours < 19 ?
													"下午" : hours < 23 ?
															"晚上" : "深夜";
}