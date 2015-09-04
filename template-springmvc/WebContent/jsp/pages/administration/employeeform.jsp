<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>
	
	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/administration/saveemployee" var="employeeform" />
	<form:form method="post" modelAttribute="user" id="employeeForm" action="${employeeform}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-edit"></i>
	      		<h3>Administration / Employee</h3>
	  		</div> <!-- /widget-header -->	 
	  		
	  		<div class="widget-content">
	  		
	  			<!-- ############################################################################################################################################# -->
	  			<!--  																																			   -->
	  			<!-- PANEL EMPLOYEE INFORMATION 																												   -->
	  			<!--  																																			   -->
	  			<!-- ############################################################################################################################################# -->
	  		
	  			 <div class="accordion">
	  				
  					<div class="accordion-group accordion-heading">
  					
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
								Employee Information	
							</a>
						</div>
  						
	                  	<div id="collapse1" class="accordion-body in collapse">
	                    
	                    	<div class="accordion-inner">
	                      		
								<div class="row-fluid">
					  			
					  				<div class="span6">
					  					
					  					<div class="control-group">
					  					
					  						<label class="control-label" for="fullName">
							  					<fmt:message key="lbl.Administration.Employee.form.EmployeeName" bundle="${com}" />&nbsp;
							  				</label>
							  				<div class="controls">					        	
									        	<form:input path="employee.fullName" id="fullName" class="input-large" disabled="true" />
									      	</div>
					  					
					  					</div><!-- control-group -->
					  					
					  					<div class="control-group">
					  					
					  						<label class="control-label" for="employeeCode">
							  					<fmt:message key="lbl.Administration.Employee.form.EmployeeCode" bundle="${com}" />
							  				</label>
							  				<div class="controls">					        	
									        	<form:input path="employee.employeeCode" id="employeeCode" class="input-large" disabled="true" />
									      	</div>
					  					
					  					</div><!-- control-group -->	  	
					  					
					  					<div class="control-group">
					  					
					  						<label class="control-label" for="employeeEmail">
							  					<fmt:message key="lbl.Administration.Employee.form.Email" bundle="${com}" />
							  				</label>
							  				<div class="controls">					        	
									        	<form:input path="employee.employeeEmail" id="employeeEmail" class="input-large" disabled="true" />
									      	</div>
					  					
					  					</div><!-- control-group -->						  											  					
					  				
					  				</div><!-- span3 -->
					  			
					  			</div><!-- row-fluid -->		                      		
	                      		
	                    	</div> <!-- accordion-inner -->
	                    
	                  	</div> <!-- collapse1 -->
  					
  					</div> <!-- accordion-group accordion-heading -->
	  				
	  			</div> <!-- accordion -->
	  				
	  				
	  			<!-- ############################################################################################################################################# -->
	  			<!--  																																			   -->
	  			<!-- ROLE EMPLOYEE INFORMATION 																												       -->
	  			<!--  																																			   -->
	  			<!-- ############################################################################################################################################# -->
	  			
				<div class="accordion">
  				
  					<div class="accordion-group accordion-heading">
  					
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" href="#collapse2">
								Role Information	
							</a>
						</div>
  						
	                  	<div id="collapse2" class="accordion-body in collapse">
	                    
	                    	<div class="accordion-inner">
	                      		
								<div class="row-fluid">
					  			
					  				<div class="span6">
					  					
					  					<div class="control-group">
					  					
					  						<label class="control-label" for="roleType">
							  					<fmt:message key="lbl.Administration.Employee.form.RoleType" bundle="${com}" />&nbsp;
							  				</label>
							  				<div class="controls">
							        			<select id="roleTypeCombo" name="validateSelect"></select>
							        			<input type="hidden" id="roleTypeFor">
									      	</div>
					  					
					  					</div><!-- control-group -->
					  					
					  					<div class="control-group">
					  					
					  						<label class="control-label" for="roleGroup">
							  					<fmt:message key="lbl.Administration.Employee.form.RoleGroup" bundle="${com}" />
							  				</label>
							  				<div class="controls">
							        			<select id="roleGroupCombo" name="validateSelect"></select>
							        			<input type="hidden" id="roleGroupFor">
									      	</div>
					  					
					  					</div><!-- control-group -->	  
					  					
					  					<div class="control-group">
					  						<button type="button" class="btn btn-primary" id="btnAddRole"><i class="icon-plus"></i></button>	
					  					</div>
					  				
					  				</div><!-- span6 -->
					  			
					  			</div><!-- row-fluid -->		                      		
	                      		
	                    	</div> <!-- accordion-inner -->
	                    
	                  	</div> <!-- collapse1 -->
  					
  					</div> <!-- accordion-group accordion-heading -->
  				
  				</div> <!-- accordion -->	  			
	  		
	  			<div class="form-actions">  					
			    	<button type="submit" class="btn btn-warning" id="btnSavePosAdministrationEmployee"><i class="icon-save"></i>&nbsp;<fmt:message key="btn.save" bundle="${com}" /></button>		    		
			      	<button type="button" class="btn btn-warning" id="btnBackPosAdministrationEmployee"><i class="icon-arrow-left"></i>&nbsp;<fmt:message key="btn.back" bundle="${com}" /></button>
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
	
		    	$("#btnBackPosAdministrationEmployee").click(function(){			    		
					window.location.href = 'employee';					
		    	});
	
		    	$("#roleTypeCombo").loadOptions(postrackingcontextpath+"/administration/getRoleType",{
					afterLoaded:function(){
						$("#roleTypeCombo").children("option[selected=selected]").attr("selected","");
						$("#roleTypeCombo").children("option[value="+$('#roleTypeFor').val()+"]").attr("selected","selected");
					}
				});

		    	$("#roleGroupCombo").loadOptions(postrackingcontextpath+"/administration/getRoleGroup",{
					afterLoaded:function(){
						$("#roleGroupCombo").children("option[selected=selected]").attr("selected","");
						$("#roleGroupCombo").children("option[value="+$('#roleGroupFor').val()+"]").attr("selected","selected");
					}
				});
				    
		    }
		});

	</script>
	
</body>