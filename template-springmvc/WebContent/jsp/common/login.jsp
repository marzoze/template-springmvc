<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ include file="/jsp/common/taglibs.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>	

	<title>POS Tracking - Login</title>
		
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />   		
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/signin.css'/>" />	
	
	<c:import url="/jsp/common/links.jsp"></c:import>		
	
</head>

<body>

	<c:url value="/login" var="login"/>
	<form:form method="post" modelAttribute="user" action="${login}">	
		
	<div class="navbar navbar-inverse navbar-fixed-top">
	
		<div class="navbar-inner">
		
			<div class="container">
			
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<i class="icon-cog"></i>
				</a>
				
				<a class="brand" href="./index.html">
					<b>POS Tracking <sup>2.2</sup></b>
				</a>
				
				<div class="nav-collapse">
				
					<ul class="nav pull-right">
					
						<li class="">
						
							<a href="./signup.html" class="">
								Create an Account
							</a>
						
						</li>
						
						<li class="">
						
							<a href="./" class="">
								<i class="icon-chevron-left"></i>
								Back to Homepage
							</a>
						
						</li>
					
					</ul>
				
				</div><!--/.nav-collapse -->
			
			</div><!-- /container -->
		
		</div><!-- /navbar-inner -->
		
	<c:import url="/jsp/common/globalerrormessage.jsp" />		
	
	</div><!-- /navbar -->

   <div class="account-container stacked">
   		
   		<div class="content clearfix">   		   		
   			
   				<h1>Sign In</h1>
   				
   				<div class="login-fields">
   				
   					<p>Sign in using your registered account:</p>
   					
   					<div class="field">
   					
   						<label for="username">Username:</label>   						   							
   						<form:input path="userName" id="userName" placeholder="Username" cssClass="login username-field" />	
   					
   					</div>
   					
   					<div class="field">
   					
   						<label for="password">Password:</label>   							
   						<form:password path="password" id="password" placeholder="Password" cssClass="login password-field" />	
   					
   					</div>
   				
   				</div><!-- /login-fields -->
   				
   				<div class="login-actions">
   				
   					<span class="login-checkbox">
   					
   						<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
   						<label class="choice" for="Field">Keep me signed in</label>
   					
   					</span>
   					<br />
   					<button class="btn btn-warning pull-right">Sign In</button>
   					
   				</div><!-- .actions -->		   		
   			
   		</div><!-- /content -->
   
   </div><!-- /account-container -->     
   
   <div class="login-extra">
		Don't have an account? <a href="./signup.html">Sign Up</a><br />
		Remind <a href="#">Password</a>
   </div> <!-- /login-extra -->
   
   </form:form>
	
</body>
</html>
