<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/processdetail/document" var="document"/>
	<form:form method="POST" modelAttribute="document" id="documentForm" action="${document}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<form:hidden path="assignTo.employeeId" id="assignTo" />
		<form:hidden path="documentReceiveBy.employeeId" id="documentReceiveBy" />
		<form:hidden path="tPosDocumentId" id="tPosDocumentId" />
		
		<div id="contentPosDocumentProcess" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-share"></i>
	      		<h3><fmt:message key="lbl.Process.header.Detail" bundle="${com}" /></h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  		
	  			<div class="left_menu_box">
	  				<c:import url="/jsp/pages/pos/posprocessmenulayout.jsp" />
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
								  				<label class="control-label" for="registrationDate">
								  					<fmt:message key="lbl.Process.form.RegistrationDate" bundle="${com}" />
								  				</label>
												<div class="controls">	
										        	<form:input path="transactionType.registrationDate" id="registrationDate" readonly="true" />	        	
										      	</div>
								  			</div>	  	
								  			
											<div class="control-group">
									  			<label class="control-label" for="endorsement">
									  				<fmt:message key="lbl.Process.form.Endorsement" bundle="${com}" />
									  			</label>
									  			<div class="controls">													        						        						        
										        	<form:select path="endorsement" id="endorsement" name="endorsement">
										        		<form:option value="No" label="No"/>
										        		<form:option value="Yes" label="Yes"/>
										        	</form:select>		        							        						        							        							        
										      	</div>
									  		</div>					
									  		
									  		<div class="control-group">
									  			<label class="control-label" for="processStartDate">
									  				<fmt:message key="lbl.Process.form.ProcessStartDate" bundle="${com}" />
									  			</label>
												<div class="controls">					        	
											        <form:input path="processStartDate" id="processStartDate" readonly="true" class="input-large" />					        	
											    </div>
									  		</div>			  			
									  		
									  		<div class="control-group">
									  			<label class="control-label" for="closeDate">
									  				<fmt:message key="lbl.Process.form.CloseDate" bundle="${com}" />
									  			</label>
												<div class="controls">					        	
											        <form:input path="closeDate" id="closeDate" readonly="true" class="input-large" />
											    </div>
									  		</div>		
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="note">
								  					<fmt:message key="lbl.Registration.form.Note" bundle="${com}" />
								  				</label>
												<div class="controls">													        						        						        					        	
										        	<form:textarea path="note" id="note" name="note" rows="4" cols="0" readonly="true" />		        							        						        							        							        
										      	</div>
								  			</div>
								  			
							  			</div><!-- span4 -->
							  			
							  			<div class="span6">
							  			
							  				<div class="control-group">
								  				<label class="control-label" for="note">
								  					<fmt:message key="lbl.Process.form.PosUser" bundle="${com}" />
								  				</label>
												<div class="controls">													        						        						        					        	
										        	<form:input path="assignTo.fullName" id="posUser" class="input-large" readonly="true" />		        							        						        							        							        
										      	</div>
								  			</div>					
								  			
											<div class="control-group">
									  			<label class="control-label" for="sendTo">
									  				<fmt:message key="lbl.Process.form.SendTo" bundle="${com}" />
									  			</label>
									  			<div class="controls">													        						        						        
										        	<form:select path="sendTo" id="sendTo" name="sendTo">
										        		<form:option value="branch" label="Branch"/>
										        		<form:option value="client" label="Client"/>
										        	</form:select>		        							        						        							        							        
										      	</div>
									  		</div>								  					  			
								  			
									  		<div class="control-group">
									  			<label class="control-label" for="approveDate">
									  				<fmt:message key="lbl.Process.form.ApproveDate" bundle="${com}" />
									  			</label>
												<div class="controls">					        	
											        <form:input path="approveDate" id="approveDate" readonly="true" class="input-large" />					        	
											    </div>
									  		</div>		
									  		
									  		<div class="control-group">
									  			<label class="control-label" for="rejectDate">
									  				<fmt:message key="lbl.Process.form.RejectDate" bundle="${com}" />
									  			</label>
												<div class="controls">					        	
											        <form:input path="rejectDate" id="rejectDate" readonly="true" class="input-large" />
											    </div>
									  		</div>	
									  		
									  		<div class="control-group">
									  			<label class="control-label" for="reasonOfRejection">
									  				<fmt:message key="lbl.Process.form.ReasonOfRejection" bundle="${com}" />
									  			</label>
												<div class="controls">
													<form:textarea path="reasonOfRejection" 
														id="reasonOfRejection" name="reasonOfRejection" rows="4" cols="0" />		
											    </div>
									  		</div>
									  		
							  			</div><!-- span4 -->	
							  			
						  			</div><!-- row-fluid -->												
									
								</div><!-- accordion-inner -->
	  					
	  						</div>
	  					
	  					</div>
	  					
	  				</div>
	  				
	  			</div>
	  			
	  			<div class="clearfix"></div>
	  			<div class="form-actions">  					
		    		<button type="button" class="btn btn-warning" id="btnProcess"><i class="icon-eject"></i>&nbsp;<fmt:message key="btn.process" bundle="${com}" /></button>
		    		<button type="button" class="btn btn-warning" id="btnApprove"><i class="icon-eject"></i>&nbsp;<fmt:message key="btn.approve" bundle="${com}" /></button>
		    		<button type="button" class="btn btn-warning" id="btnClose"><i class="icon-eject"></i>&nbsp;<fmt:message key="btn.close" bundle="${com}" /></button>
		    		<button type="button" class="btn btn-warning" id="btnReject"><i class="icon-remove"></i>&nbsp;<fmt:message key="btn.reject" bundle="${com}" /></button>
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
		    fn:function(){}
		});
	</script>
	
</body>