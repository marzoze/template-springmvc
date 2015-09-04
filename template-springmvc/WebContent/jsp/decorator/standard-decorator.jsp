<%@ include file="/jsp/common/taglibs.jsp"%>


	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html>
	<head>
	<title><fmt:message key="lbl.title.login" bundle="${com}" /></title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta http-equiv="imagetoolbar" content="false" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<script type="text/javascript">	
		var contextRoot='<c:url value="/"/>';
		var postrackingcontextpath = "${pageContext.request.contextPath}";		
		var _postrackingloginPage = contextRoot + "jsp/common/login.jsp";
		var globalDateFormat ="d/m/yy";		
		var sessionTimeout = '<c:out value="${actionBean.sessionTimeout}"/>';
		if(sessionTimeout == "true"){
			location.href = _postrackingloginPage;
		}
    </script>
    
    <c:import url="/jsp/common/links.jsp"></c:import>       
	
	</head>
	
	<body onload="showLoadingPage()" onunload="showLoadingPage()">	
	 
	 <div id="postracking-loading"></div>
	 <div id="postracking-loading2"></div>
	 
	 <script>
		 var $dialog = $('#postracking-loading')
			.html('<div align="center" style="vertical-align: middle;"><img src="<c:url value="/images/loading.gif"/>" width="50px" height="50px"/></div>')
		    .dialog({
					autoOpen: false,
					bgiframe: true,
					modal: true,
					minHeight: 54,
					width: 'auto',	
			        resizable: false,
			        closable:false,											
					title: 'Loading, Please wait... ',
					open: function(event, ui) { 						
						$(this).parent().children().children('.ui-dialog-titlebar-close').hide();
					}	
			});
			
			function showLoading() {
				$("#postracking-loading").dialog('open');
			}

			function showLoadingPage() {
				$("#postracking-loading").dialog('open');				
				setTimeout("hideLoading()",0);
			}
				
			function hideLoading() {
				$("#postracking-loading").dialog("close");
			}
	 </script>	
	 
	 <!----------------------------------------------------------------------------------------------------------------------
	 	 
	 				Header layout begin here
	 				 	 
	 ----------------------------------------------------------------------------------------------------------------------->	 
	 
	 <c:import url="/jsp/layout/header.jsp" />	 	 
	 
	 <!----------------------------------------------------------------------------------------------------------------------
	 	 
	 				Content/Body begin here
	 				 	 
	 ----------------------------------------------------------------------------------------------------------------------->	 
	
	<div class="main">
	
		<div class="container">
			
			<div class="row">
			
				<div class="span12">
																														
					<sitemesh:write property='body'/>															
				
				</div><!-- /span12 -->
				
			</div><!-- /row -->
				
		</div><!-- /container -->
		
	</div><!-- /main -->
	
	 <!----------------------------------------------------------------------------------------------------------------------
	 	 
	 				Footer Layout begin here
	 				 	 
	 ----------------------------------------------------------------------------------------------------------------------->	
	
	<c:import url="/jsp/layout/footer.jsp" />
				
	</body>
	</html>
