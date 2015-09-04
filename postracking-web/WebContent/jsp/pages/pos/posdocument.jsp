<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/registration/document" var="document"/>
	<form:form method="POST" modelAttribute="document" id="documentForm" action="${document}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<form:hidden path="documentReceiveBy.employeeId" id="documentReceiveBy" />
		
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-share"></i>
	      		<h3><fmt:message key="lbl.Registration.header.registration" bundle="${com}" /></h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  		
	  			<c:import url="/jsp/pages/pos/posprogresstracker.jsp" />
	  			
	  			<div class="left_menu_box">
	  				<c:import url="/jsp/pages/pos/posregistrationmenulayout.jsp" />
	  			</div>
	  			
	  			<div class="content_box">
	  			
	  				<!-- ############################################################################################################################################# -->
	  				<!--  																																			   -->
	  				<!-- PANEL POS DOCUMENT 																												   		       -->
	  				<!--  																																			   -->
	  				<!-- ############################################################################################################################################# -->
	  			
	  				<div class="accordion">
	  				
	  					<div class="accordion-group accordion-heading">
	  					
	  						<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
									<fmt:message key="lbl.Registration.header.posdocument" bundle="${com}" />
								</a>
							</div>
							
							<div id="collapse1" class="accordion-body in collapse">
							
								<div class="accordion-inner">
									
									<div class="row-fluid">	  		
			  				  			
										<div class="span6">
		  			
							  				<div class="control-group">
								  				<label class="control-label" for="documentReceiveBy">
								  					<fmt:message key="lbl.Registration.form.DocumentReceivedBy" bundle="${com}" />
								  				</label>
												<div class="controls">	
										        	<form:input path="documentReceiveBy.fullName" id="documentReceiveBy" readonly="true" />	        	
										      	</div>
								  			</div>	  	
								  			
							  				<div class="control-group">
								  				<label class="control-label" for="note">
								  					<fmt:message key="lbl.Registration.form.Note" bundle="${com}" />
								  				</label>
												<div class="controls">													        						        						        					        	
										        	<form:textarea path="note" id="note" name="note" rows="4" cols="0" />		        							        						        							        							        
										      	</div>
								  			</div>	  			  					  								  						  			
								  			
							  			</div><!-- span6 -->
							  			
							  			<div class="span6">
							  			
							  				<div class="control-group">
								  				<label class="control-label" for="deliveryToPos">
								  					<fmt:message key="lbl.Registration.form.ForwardToAnotherUser" bundle="${com}" />
								  				</label>
												<div class="controls">													        						        						        
										        	<select id="assignToCombo" name="validateSelect"></select>		
										        	<form:hidden path="assignTo.employeeId" id="assignTo" />	        							        						        							        							        
										      	</div>
								  			</div>	  			  					  								  						  			
							  			
							  			</div><!-- span6 -->			
							  			
						  			</div><!-- row-fluid -->												
									
								</div><!-- accordion-inner -->
	  					
	  						</div>
	  					
	  					</div>
	  					
	  				</div>
	  				
	  			</div>
	  			
	  			<div class="clearfix"></div>
	  			<div class="form-actions">  					
		    		<button type="submit" class="btn btn-warning" id="btnSavePosDocument"><i class="icon-save"></i>&nbsp;<fmt:message key="btn.save" bundle="${com}" /></button>
		      		<button type="button" class="btn btn-warning" id="btnSubmitPosRegistration" disabled="disabled"><i class="icon-ok-circle"></i>&nbsp;<fmt:message key="btn.submit" bundle="${com}" /></button>
		      		<button type="button" class="btn btn-warning" id="btnBacktoBranch" disabled="disabled"><i class="icon-arrow-left"></i>&nbsp;<fmt:message key="btn.backToBranch" bundle="${com}" /></button>
				</div>
	  			 
	  		</div><!-- widget-content -->
	  		
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
		    	$("#assignToCombo").loadOptions(postrackingcontextpath+"/registration/getEmployeePosDept",{
					afterLoaded:function(){												
						$("#assignToCombo").children("option[selected=selected]").attr("selected","");
						$("#assignToCombo").children("option[value="+ $('#assignTo').val() +"]").attr("selected","selected");
					}
		    	});

		    	$("#assignToCombo").change(function(){
					$('#assignTo').val($(this).val());
				});

		    	$("#btnSubmitPosRegistration").click(function() {
					$("#documentForm").attr("action",postrackingcontextpath+"/registration/submit?page=3");
					$("#documentForm").submit();	
				});

				$("#btnBacktoBranch").click(function() {
					$("#documentForm").attr("action",postrackingcontextpath+"/registration/backtobranch?page=3");
					$("#documentForm").submit();	
				});
		    }
		});
	</script>
	
</body>