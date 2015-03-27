<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/popupstyle.css" />
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript" src="js/popupjs.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login Modal Dialog Window with CSS and jQuery</title>



<!-- <link rel="canonical" href="http://www.alessioatzeni.com/wp-content/tutorials/jquery/login-box-modal-dialog-window/index.html" /> -->
</head>
<body>
<h1>Login Modal Dialog Window with CSS and jQuery<small>Tutorial by Alessio Atzeni | <a href="http://www.alessioatzeni.com/blog/login-box-modal-dialog-window-with-css-and-jquery/">View Tutorial</a></small></h1>
<div>
	<div id="content">
    
	
    
        	
				<a href="#login-box" class="login-window">Login / Sign In</a>
        	
		
        
        <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <form method="post" class="signin" action="#">
                <fieldset class="textbox">
            	<label class="username">
                <span>Username or email</span>
                <input id="username" name="username" value="" type="text" autocomplete="on" placeholder="Username">
                </label>
                
                <label class="password">
                <span>Password</span>
                <input id="password" name="password" value="" type="password" placeholder="Password">
                </label>
                
                <button class="submit button" type="button">Sign in</button>
                
                <p>
                <a class="forgot" href="#">Forgot your password?</a>
                </p>
                
                </fieldset>
          </form>
		</div>
    
    </div>
</div>

</body>
</html>