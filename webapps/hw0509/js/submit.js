function logout(){
	window.open('index.html', '_self');
}

function dbcheckpasswd(String passwd){
	String firstpasswd = document.getElementById('dbpasswd');
	if(firstpasswd.equals(passwd)){
	return;
	}else{
		return;
	}
}

function checkEnter(){
	if(document.getElementsByName('account')[0].value==null){

	}
}
