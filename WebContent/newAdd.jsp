<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>Sign Up</title>
<link rel="stylesheet" href="css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Engagement' rel='stylesheet' type='text/css'>
<!--[if IE]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/jquery.uniform.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" charset="utf-8">
      $(function(){
        $("input:checkbox, input:radio, input:file, select").uniform();
      });
    </script>
</head>
<body>
<article>
<h1>Post Free add of your product here.</h1>
<form>
	<ul>
        <li>
        	<label for="name">Your Name:</label>
            <input type="text" size="40" id="name" />
        </li>
        <li>
        	<label for="email">Your Email:</label>
            <input type="email" size="40" id="email" />
        </li>
        <li>
            <label for="car">What's my options:</label>
            <select id="car">
                <option>Television</option>
                <option>Printers</option>
                <option>Monitors</option>
                <option>Memory Card</option>
                <option>RAM</option>
            </select>
        </li>
        <li>
            <label><input type="radio" name="radio" /> Sell</label>
            <label><input type="radio" name="radio" /> Auction</label>
        </li>
        <li>
			<label><input type="checkbox" /> hello</label>
        </li>
        <li>
            <label>Upload a file:</label>
            <input type="file" />
        </li>
        <li>
        	<label for="message">Description:</label>
            <textarea cols="50" rows="5" id="message"></textarea>
		</li>
	</ul>
    <p>
        <button type="submit" class="action">Call to action</button>
        <button type="reset" class="right">Reset</button>
    </p>
</form>
</article>
<footer>
<p>panya.com </p>
</footer>