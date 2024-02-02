function isValidLogIn() {
	var x = document.forms["sign-form"]["password"].value;
	var y = document.forms["sign-form"]["user"].value;
	if (!y) {
		alert("Username can not be empty");	
		return false;
	}
	if (!x) {
		alert("Password can not be empty");	
		return false;
	}
	else
	if (!(/^[0-9]+$/.test(y))) {
		alert("Username can contain only numbers");	       
        if ((x.indexOf(' ') >= 0)) {
    		alert("Password can not contain whitespaces");
        }		       
        return false;
    } 
	else
	if ((x.indexOf(' ') >= 0)) {
		alert("Password can not contain whitespaces");	
		return false;
	}
}
