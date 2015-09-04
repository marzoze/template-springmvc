<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>
	
	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/administration/savegroup" var="groupform" />
	<form:form method="post" modelAttribute="group" id="groupForm" action="${groupform}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<form:hidden path="secGroupId" />

		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-edit"></i>
	      		<h3>Administration / Group Form</h3>
	  		</div> <!-- /widget-header -->	 
	  		
	  		<div class="widget-content">
	  			
	  			<div class="row-fluid">
	  			
	  				<div class="span6">
	  					
	  					<div class="control-group">
	  					
	  						<label class="control-label" for="roleName">
			  					<fmt:message key="lbl.Administration.Group.form.GroupName" bundle="${com}" />&nbsp;<span class="red">*</span>
			  				</label>
			  				<div class="controls">					        	
					        	<form:input path="shortdescription" id="shortdescription" class="input-large" />
					      	</div>
	  					
	  					</div><!-- control-group -->
	  					
	  					<div class="control-group">
	  					
	  						<label class="control-label" for="roleName">
			  					<fmt:message key="lbl.Administration.Group.form.GroupDesc" bundle="${com}" />
			  				</label>
			  				<div class="controls">					        	
					        	<form:input path="longdescription" id="longdescription" class="input-large" />
					      	</div>
	  					
	  					</div><!-- control-group -->	  					
	  				
	  				</div><!-- span3 -->
	  			
	  			</div><!-- row-fluid -->
	  			
	  			<div class="form-actions">  					
			    	<button type="submit" class="btn btn-warning" id="btnSavePosAdministrationGroup"><fmt:message key="btn.save" bundle="${com}" /></button>		    		
			      	<button type="button" class="btn btn-warning" id="btnBackPosAdministrationGroup"><fmt:message key="btn.back" bundle="${com}" /></button>
				</div>
	  			
	  		</div><!-- widget-content -->
	  		
		</div><!-- widget-stacked -->
		
		
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

	    	$("#btnBackPosAdministrationGroup").click(function(){			    		
				window.location.href = 'administration/group';					
	    	});
			    
	    }
	});

	</script>
	
</body>