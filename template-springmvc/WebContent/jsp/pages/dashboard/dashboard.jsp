<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>
<form:form method="POST" modelAttribute="dashboard" action="dashboard">

	<div id="content" class="widget stacked">

		<div class="widget-header">
      		<i class="icon-th"></i>
      		<h3>Dashboard</h3>
  		</div> <!-- /widget-header -->
  		
  		<div class="widget-content">
  			Welcome to POS Tracking System  			
  		</div>
  		
	</div><!-- widget stacked -->
	
</form:form>	

<script type="text/javascript">

postracking.form.init({
	isAjax:false,
	ajaxOptions:{
           dataType:'',
           success:function(a){				
				hideLoading();						
           }
    },
    fn:function(){

    }	
});

</script>

</body>