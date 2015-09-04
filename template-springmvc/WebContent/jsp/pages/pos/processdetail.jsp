<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<div id="message">
		<c:if test="${not empty message}">	
			<div class="alignclear ui-widget">
				<div class="alignclear ui-state-message">
					<ul>
						<span  style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span><strong>${message}</strong>
					</ul>
				</div>
			</div>
		</c:if>
	</div>
	
	<c:url value="/processdetail" var="processdetail"/>
	<form:form method="POST" modelAttribute="posTransaction" id="processDetailForm" action="${processdetail}" enctype="multipart/form-data">
		<form:errors path="*" cssClass="ui-state-error" element="div" />
		<input type="hidden" id="posTranId" name="posTranId" value="${posTranId}" />
		<input type="hidden" id="attachId" name="attachId" value="${attachId}" />		
		<input type="hidden" id="totalAttachment" name="totalAttachment" value="${totalAttachment}" />
		<input type="hidden" id="attachIdToDelete" name="attachIdToDelete" />	
		<input type="hidden" id="postrantypeid" name="postrantypeid" value="${postrantypeid}" />
		<input type="hidden" id="status" name="status" value="${posTranTypes.status}" />	
		<form:hidden path="posNumberId" id="posNumberId" />				
		<form:hidden path="posNumber" id="posNumber" />					
	
		<!-- All Contents Start Here  ///////////////////////////////////////////////////////////////////////////////// -->
		
	
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-edit"></i>
	      		<h3>POS / Process Detail Page</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  			
	  			<h4>Info Policy</h4>	  			
	  			<hr />
	  				  			
	  			<div class="row-fluid">	  		
	  				  			
	  				<div class="span3">
	  				  					
			  			<div class="control-group">
			  				<label class="control-label" for="policyNumber">
			  					<fmt:message key="lbl.Register.form.PolicyNumber" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="policyCode" id="policyNumber" class="input-large" />					        	
					      	</div>
			  			</div>  	
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="policyStatus">
			  					<fmt:message key="lbl.Register.form.PolicyStatus" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="policyStatus" id="policyStatus" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="policyHolder">
			  					<fmt:message key="lbl.Register.form.PolicyHolder" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="policyHolder" id="policyHolder" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>	  					  			
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="insured">
			  					<fmt:message key="lbl.Register.form.Insured" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="insured" id="insured" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>			  				  					  						  								  				
	  				
	  				</div><!-- span3 -->
	  				
	  				<div class="span3">
	  					
			  			<div class="control-group">
			  				<label class="control-label" for="policyYear">
			  					<fmt:message key="lbl.Register.form.PolicyYear" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="policyYear" id="policyYear" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>	  				
	  					
			  			<div class="control-group">
			  				<label class="control-label" for="commencementDate">
			  					<fmt:message key="lbl.Register.form.CommencementDate" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="commencementDate" id="commencementDate" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="issueDate">
			  					<fmt:message key="lbl.Register.form.IssueDate" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="issueDate" id="issueDate" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>			  				  			  			
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="coverageEndDate">
			  					<fmt:message key="lbl.Register.form.CoverageEndDate" bundle="${com}" />
			  				</label>
							<div class="controls">
								<form:input path="coverageEndDate" id="coverageEndDate" readonly="readonly" class="input-large" />					        	
					      	</div>
			  			</div>				  				  		
		  						  					  	
		  			</div><!-- span3 -->
		  			
		  			<div class="span3">
		  			
			  			<div class="control-group">
			  				<label class="control-label" for="branch">
			  					<fmt:message key="lbl.Register.form.Branch" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="branch.physicalLocation" id="branch" readonly="readonly" />
					        	<!--<form:errors path="branch.locationId" cssClass="ui-state-error" element="div" />-->
					      	</div>
			  			</div>
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="dueDate">
			  					<fmt:message key="lbl.Register.form.DueDate" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="dueDate" id="dueDate" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>			  				
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="installmentPremium">
			  					<fmt:message key="lbl.Register.form.InstallmentPremium" bundle="${com}" />
			  				</label>
							<div class="controls">
					        	<form:input path="installmentPremium" cssStyle="text-align:right" class="input-large" name="installmentPremium" id="installmentPremium" />
					      	</div>
			  			</div>			  					  					 			  									  		
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="paymentFreq">
			  					<fmt:message key="lbl.Register.form.PaymentFreq" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="paymentFreq" id="paymentFreq" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>			  			
			  			
		  			</div><!-- span3 -->	
		  			
		  			<div class="span3">
		  			
			  			<div class="control-group">
			  				<label class="control-label3" for="agentName">
			  					<fmt:message key="lbl.Register.form.AgentName" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="agentName" id="agentName" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>		  			
		  			
				  		<div class="control-group">
			  				<label class="control-label" for="agentStatus">
			  					<fmt:message key="lbl.Register.form.AgentStatus" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="agentStatus" id="agentStatus" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>		  			
		  			
			  			<div class="control-group">
			  				<label class="control-label" for="ram">
			  					<fmt:message key="lbl.Register.form.Ram" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="ram" id="ram" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>		  					  					  		
			  			
			  			<div class="control-group">
			  				<label class="control-label" for="partner">
			  					<fmt:message key="lbl.Register.form.Partner" bundle="${com}" />
			  				</label>
							<div class="controls">					        	
					        	<form:input path="partner" id="partner" readonly="readonly" class="input-large" />
					      	</div>
			  			</div>		  			
		  			
		  			</div><!-- span3 -->
		  			
		  			<p></p>
		  			
		  			<h4><fmt:message key="lbl.Register.form.BenefitInfo" bundle="${com}" /></h4>	  			
	  				<hr />
	  				<div class="controls pull-left">
	  					<table id="gridBenefitInfo"></table>
						<div id="pGridBenefitInfo"></div>
	  				</div>
			  		
	  			</div><!-- row-fluid --> 
	  			  				
  				 
	  		</div><!-- widget-content -->
	  		
	  		
	  		<!-------------------------------------------------------------                              ---------------------------------------------------------->
	  		<!-------------------------------------------------------------  POS TRANSACTION BEGIN HERE  ---------------------------------------------------------->
	  		<!-------------------------------------------------------------                              ---------------------------------------------------------->
	  		
	  		
	  		<div class="widget-content">
	  		
	  			<h4>Document List</h4>	  				  			
	  			<hr />
		  		
		  		<fieldset id="fieldsetGridPosTranTypeSelected">
					<table id="gridPosTranTypeSelected"></table>
					<div id="pGridPosTranTypeSelected"></div>
				</fieldset>
				<br />
	  			
	  		</div><!-- widget-content -->

	  		
	  		<!----------------------------------------------------------                          ----------------------------------------------------------->
	  		<!----------------------------------------------------------  POS DOCUMENT BEGIN HERE ----------------------------------------------------------->
	  		<!----------------------------------------------------------                          ----------------------------------------------------------->

	  		
	  		<div class="widget-content">
	  		
	  			<h4>POS Document</h4>	  				  			
	  			<hr />
	  			
	  			<div class="row-fluid">
			  		
			  		<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="registrationDate">
				  				<fmt:message key="lbl.Process.form.RegistrationDate" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.registrationDate" id="registrationDate" class="input-large" />					        	
						    </div>
				  		</div>
				  	</div>
				  	
				  	<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="posUser">
				  				<fmt:message key="lbl.Process.form.PosUser" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.posUser" id="posUser" class="input-large" />					        	
						    </div>
				  		</div>
				  	</div>
				  	
	  				<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="endorsement">
				  				<fmt:message key="lbl.Process.form.Endorsement" bundle="${com}" />
				  			</label>
				  			<div class="controls">													        						        						        
					        	<form:select path="posTransactionType.endorsement" id="endorsement" name="endorsement">
					        		<form:option value="No" label="No"/>
					        		<form:option value="Yes" label="Yes"/>
					        	</form:select>		        							        						        							        							        
					      	</div>
				  		</div>
				  	</div>
				  	
	  				<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="sendTo">
				  				<fmt:message key="lbl.Process.form.SendTo" bundle="${com}" />
				  			</label>
				  			<div class="controls">													        						        						        
					        	<form:select path="posTransactionType.sendTo" id="sendTo" name="sendTo">
					        		<form:option value="Branch" label="Branch"/>
					        		<form:option value="Client" label="Client"/>
					        	</form:select>		        							        						        							        							        
					      	</div>
				  		</div>
				  	</div>
				  	
	  			</div><!-- row-fluid -->
	  			
	  			<div class="row-fluid">
				  	
	  				<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="processStartDate">
				  				<fmt:message key="lbl.Process.form.ProcessStartDate" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.processStartDate" id="processStartDate" class="input-large" />					        	
						    </div>
				  		</div>
				  	</div>
				  	
					<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="approveDate">
				  				<fmt:message key="lbl.Process.form.ApproveDate" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.approveDate" id="approveDate" class="input-large" />					        	
						    </div>
				  		</div>
				  	</div>
	  				
	  				<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="closeDate">
				  				<fmt:message key="lbl.Process.form.CloseDate" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.closeDate" id="closeDate" readonly="readonly" class="input-large" />
						    </div>
				  		</div>
				  	</div>
				  	
				  	<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="rejectDate">
				  				<fmt:message key="lbl.Process.form.RejectDate" bundle="${com}" />
				  			</label>
							<div class="controls">					        	
						        <form:input path="posTransactionType.rejectDate" id="rejectDate" readonly="readonly" class="input-large" />
						    </div>
				  		</div>			  					  						  								  				
		  			</div><!-- span3 -->
				  	
	  			</div><!-- row-fluid -->
	  			
	  			<div class="row-fluid">
	  				
	  				<div class="span3">
		  				<div class="control-group">
			  				<label class="control-label" for="note">
			  					<fmt:message key="lbl.Register.form.Note" bundle="${com}" />
			  				</label>
							<div class="controls">													        						        						        					        	
					        	<form:textarea path="posTransactionType.note" id="note" name="note" rows="4" cols="0" />		        							        						        							        							        
					      	</div>
			  			</div>
			  		</div>
			  		
	  				<div class="span3">
				  		<div class="control-group">
				  			<label class="control-label" for="reasonOfRejection">
				  				<fmt:message key="lbl.Process.form.ReasonOfRejection" bundle="${com}" />
				  			</label>
							<div class="controls">
								<form:textarea path="posTransactionType.reasonOfRejection" 
									id="reasonOfRejection" name="reasonOfRejection" rows="4" cols="0" />		
						    </div>
				  		</div>
				  	</div>
				  	
	  			</div><!-- row-fluid -->
	  			
	  			<c:if test="${posTranTypes.status ne 'Close' && posTranTypes.status ne 'Reject'}">
	  			<div class="form-actions">  					
		    		<button type="button" class="btn btn-warning" id="btnProcess" style="display: none;" ><fmt:message key="btn.process" bundle="${com}" /></button>		    		
		      		<button type="button" class="btn btn-warning" id="btnApprove" style="display: none;"><fmt:message key="btn.approve" bundle="${com}" /></button>
		      		<button type="button" class="btn btn-warning" id="btnClose" style="display: none;"><fmt:message key="btn.close" bundle="${com}" /></button>
		      		<button type="button" class="btn btn-warning" id="btnReject"><fmt:message key="btn.reject" bundle="${com}" /></button>
				</div>
	  			</c:if>
	  		</div><!-- widget content -->
	  		
		</div>
		  			
	</form:form>	
	
	<div id="dialogPosTransactionType">
	
		<div class="row-fluid">
						
			<div class="control-group">
				<label class="control-label" for="posTransactionTypeCode">
						<fmt:message key="lbl.Register.form.POSTransactionTypeCode" bundle="${com}" />
					</label>
				<div class="controls">
		        	<input type="text" class="input-large" name="posTransactionTypeCode" id="posTransactionTypeCode" />					        	
		      	</div>	  				
	      		      	
			</div>							  					
		
			<div class="control-group">
				 <label class="control-label" for="posTransactionTypeDesc">
	  				<fmt:message key="lbl.Register.form.POSTransactionTypeDesc" bundle="${com}" />
	  			</label>
				<div class="controls">
			        <input type="text" class="input-large" name="posTransactionTypeDesc" id="posTransactionTypeDesc" />					        	
			     </div>
			</div>						
		
			<div>		  				
	 			<button type="button" id="btnSearchPosTransactionType" name="btnSearchPosTransactionType" class="btn btn-warning">
	    			<fmt:message key="btn.search" bundle="${com}" />
	    		</button>	      				
	   		</div> 
   		  		
   		</div>
   		<br />
   			
   		<div>	      				
    		<!-- Grid Pos Transaction Type -->
    		<table id="gridPosTransactionType" width="100%"></table>
			<div id="pGridPosTransactionType"></div>						
		</div>
							
	</div><!-- dialogPosTransactionType -->
	
	<div id="dialogAttachment">		 				 	
	
		<form action="" id="dialogAttachmentForm">
			<!-- Grid Policy -->
			<table id="gridAttachment" width="100%"></table>
			<div id="pGridAttachment"></div>
			<br />
			<button type="button" id="btnDeleteAttach" name="btnDeleteAttach" disabled="disabled" class="btn btn-danger">&nbsp;<fmt:message key="btn.delete" bundle="${com}" />&nbsp;</button>
		</form>
		
	</div><!-- dialog attachment -->
	
	<div id="dialogDeleteMessage">
		<div class="span5">
			<div class="control-group">
				<label class="control-label2">
					<img src="${pageContext.request.contextPath}/images/question.png" />
				</label>
				<div class="controls">
					Are you sure that you want to permanently delete the selected file ?
				</div>
			</div>				 
		</div>				
	</div><!-- dialogDeleteMessage -->
	
	<div id="dialogDocumentUpload">		
		<form:form method="POST" modelAttribute="posTransaction" id="processDetailFormDocUpload" action="${processdetail}" enctype="multipart/form-data">
			<table id="fileTableDialogDocUpload">
				
		    </table>
		</form:form>
		<div id="result"></div>
	</div>


    <!---------------------------------------------------------------------------------------------------->
   	<!---  Combo box selected                       ------------------------------------------------------>
   	<!---------------------------------------------------------------------------------------------------->
   	
   	<!-- Document Combo Box -->
   	<c:if test="${not empty tPosDoc}">
   		<c:forEach items="${tPosDoc}" var="tPosDoc">
   			<script type="text/javascript">
   				$("#dummyDocument").multiselect()
   					.find(":checkbox[value='"+ ${tPosDoc.documentIdFK} +"']")
   						.attr("checked","checked");
		      	$("#dummyDocument option[value='" + ${tPosDoc.documentIdFK} + "']")
		      		.attr("selected", 1);
		      	$("#dummyDocument")
		      		.multiselect("refresh");
   			</script>
   		</c:forEach>
   	</c:if>
   	
   	
   	<!-- Activity Type Combo Box -->
   	<c:if test="${not empty posTransaction}">
   		<c:forEach items="${tPosDoc}" var="tPosDoc">
   			<script type="text/javascript">
		      	$("#activityType option[value='" + ${posTransaction.activityType} + "']")
		      		.attr("selected", 1);
   			</script>
   		</c:forEach>
   	</c:if>
   	
   	<!---------------------------------------------------------------------------------------------------->
   	<!---------------------------------------------------------------------------------------------------->
   	<!---------------------------------------------------------------------------------------------------->
	
	
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

		    	// Autocomplete tran code
		    	postracking.autocomplete("posTransactionTypeCode",postrackingcontextpath + "/processdetail/getTranCodeAutoComplete");

		    	// Autocomplete tran desc
		    	postracking.autocomplete("posTransactionTypeDesc",postrackingcontextpath + "/processdetail/getTranDescAutoComplete");

			    // Combo box multiselect
			    $("#dummyDocument").multiselect();		

				// Set up the number formatting.
			    $('#installmentPremium').number(true, 2);
		    	
		    	
		    	/*=============================== Begin Dialog Policy ===========================*/
		    	
		    	$("#dialogPosTransactionType").dialog({
	    			autoOpen: false,
	    			height: 'auto',
	    			width: 'auto',
	    			modal: true,
	    			position: ['top', 20],
	    			title:'Transaction Type List',
	    			buttons: {
	    				'Close': function() {
	    					$(this).dialog('close');
	    				}
	    			}
		    	});

		    	/*================================ End Dialog Policy ============================*/
		    	
		    	
		    	/*===============================  Dialog Delete Msg ===========================*/
		    	
		    	$("#dialogDeleteMessage").dialog({  	    		
					autoOpen: false,
					height: 'auto',
					width: 500,
					modal: true,
					title:'Confirmation',
					buttons: {
						'No': function() {	    						
							$(this).dialog('close');
						},
						'Yes':function(){					
	    					var selectedRows = $('#gridAttachment').getGridParam("selarrrow");
	    					var params = $("form", "#dialogAttachment").serialize();
							$.ajax({
								type:'POST',
								url:postrackingcontextpath+'/processdetail/deleteAttachment?attachId=' + selectedRows,	
								data:params,							
								success:function(data){
									if(data.result == 'deleted'){										
										$("#gridAttachment").trigger("reloadGrid");
										var total = Number($('#totalAttachment').val() - data.totalAttachment); 
										$('#txtBtnUplodedDocPopUp').replaceWith("<div id='txtBtnUplodedDocPopUp'>" + total + " uploaded file(s)</div>");										
									}
									if(data.result == 'failed'){
										alert("Internal System Error, Delete Unsuccessfull");
									}			   										
								},
								failure:function(){
									alert("Error, Failed to delete record");
								},
								dataType:'json'
							});	
							   	   					
							$(this).dialog("close");
							return true;
						}
					}
				});

		    	/*===============================  End Dialog Delete Msg ===========================*/
		    	
		    	/*=============================== Begin Dialog Attachment ===========================*/
		    	
		    	$("#dialogAttachment").dialog({
					autoOpen: false,
					height: 'auto',
					width: 'auto',
					modal: true,			
					title:'Uploaded File(s) List',
					buttons: {
						'Close': function() {
							$(this).dialog('close');
						}
					}
		    	});

		    	/*================================ End Dialog Attachment ============================*/
		    	
		    	/*=============================== Begin Dialog Doc Upload ===========================*/
		    	
		    	$("#dialogDocumentUpload").dialog({
					autoOpen: false,
					height: 'auto',
					width: 'auto',
					modal: true,			
					title:'Document Upload',
					open: function( event, ui ) {return true},
					buttons: {
						'Close': function() {
							$(this).dialog('close');
						}
					}
		    	});

		    	/*================================ End Dialog Doc Upload ============================*/

		    	/*=============================== Begin JQGrid Benefit Info ===========================*/

		    	$("#gridBenefitInfo").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/processdetail/getBenefitInfo?policyCode=" + $('#policyNumber').val(),
					colNames:['Product Code','Product Name','Level','Benefit','Status','End Date','Insured Name'],
					colModel:[															
								{name:'internalId',index:'internalId', sortable: true}, 
								{name:'productName',index:'productName', sortable: true},
								{name:'duty', index:'duty', sortable: true, width:'100px'}, // Level (Plan 2)
								{name:'benefitType2',index:'benefitType2', align:"right",sortable: true, 
									formatter:'currency',formatoptions: {prefix:'Rp ', suffix:'', thousandsSeparator:','}},
								{name:'status',index:'status', align:'center', sortable: true},	
								{name:'riskCommenceDate',index:'riskCommenceDate', sorttype: 'date', align:'center', formatter: 'date', 
									/*formatter: function(cellValue, options) {
								        if(cellValue) {
								            return $.fmatter.util.DateFormat(
								                '', 
								                new Date(+cellValue), 
								                'd/m/Y', 
								                $.extend({}, $.jgrid.formatter.date, options)
								            );
								        } else {
								            return '';
								        }
								    }*/
									formatter: function (cellval, opts) {
										if(cellval) {
											var date = new Date(cellval);
				                            opts = $.extend({}, $.jgrid.formatter.date, opts);
				                            return $.fmatter.util.DateFormat("", date, 'd-M-Y', opts);
										} else {
											return '';
										}			                            
			                        }
		                        },
								{name:'insuredName',index:'insuredName', sortable: true}															
					],								
					gridComplete : function(){
						$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
			        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
					},
			  		multiselect: false,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGridBenefitInfo",
			  		pgbuttons: true,			  		
			  		viewrecords : true,
			  		caption: "",
			  		sortorder : "desc",
			  		jsonReader : {
						repeatitems : false,
						id: 0
					},
					height : "100%",
					widht : "100%",
					mtype : "GET",				
					//rownumbers: true,
					onSelectRow : function(rowId) {
						var selectedRows = $('#gridBenefitInfo').getGridParam("selarrrow");																																			
					},
					loadComplete : function(){}	  			  				
				});		    	

		    	/*=============================== End JQGrid Benefit Info ===========================*/
		    	
		    	/*=============================== Begin JQGrid Pos Transaction Type Selected ===========================*/
		    	
		    	var _idsOfSelectedRows = [];
	    		var arrayTranTypes = '${arrayTranTypes}';	    		
	    		if(arrayTranTypes != ""){	    			
	    			arrayTranTypes = arrayTranTypes.substring(1, arrayTranTypes.length-1);	
			    	arrayTranTypes = arrayTranTypes.replace(/ /g,"");	 
			    	var arrayTranTypesSplit = arrayTranTypes.split(",");
			    	
			    	for(var i = 0; i < arrayTranTypesSplit.length; i++){		    		
			    		_idsOfSelectedRows.push(arrayTranTypesSplit[i]);
				    }
		    	}			    	
		    	
		    	$("#gridPosTranTypeSelected").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/processdetail/proccesTransactionTypeFin?serviceCode=" + _idsOfSelectedRows +
									"&posNumber=" + $('#posNumber').val() +
									"&policyNumber=" + $('#policyNumber').val() +
									"&tranTypeId=" + $('#postrantypeid').val(),
					colNames:['&nbsb;','&nbsb;','&nbsb;','Pos No','Transaction No','Transaction Type','Registration Date','Received Date','Remark',''],
					colModel:[		
								{name:'serviceId',index:'serviceId', hidden: true},
								{name:'posTranTypePosNumberId', index:'posTranTypePosNumberId', hidden: true},	
								{name:'posTranTypeCode', index:'posTranTypeCode', hidden: true},																		
								{name:'posTranTypePosNumber',index:'posTranTypePosNumber', align:"center", sortable: true}, 
								{name:'posTranTypeTransactionNumber',index:'posTranTypeTransactionNumber', align:"center", sortable: true},	
								{name:'posTranTypeDesc',index:'posTranTypeDesc', align:"center", sortable: true},							
								{name:'registrationDate',index:'registrationDate', align:'center', sorttype: 'date', formatter: 'date',								 
									formatter: function (cellval, opts) {
										if(cellval) {
											var date = new Date(cellval);
				                            opts = $.extend({}, $.jgrid.formatter.date, opts);
				                            return $.fmatter.util.DateFormat("", date, 'd/m/y', opts);
										} else {
											return '';
										}			                            
			                        }
		                        },								
		                        {name:'receivedDateStr',index:'receivedDateStr', align:'center', sortable: false},
								{name:'remark',index:'remark', align:'center', sortable: false},
								{name:'status',index:'status', hidden: true}																													
					],								
					gridComplete : function(){
						$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
			        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
						var ids = jQuery("#gridPosTranTypeSelected").jqGrid('getDataIDs');						  							  			
			  			for ( var i = 0; i < ids.length; i++ ) {

			  				var rowData 			= $('#gridPosTranTypeSelected').jqGrid('getRowData',ids[i]);
			  				var rowNum 				= i + 1;
							var tranTypeNo 			= rowData['posTranTypeTransactionNumber'];	
							var tranTypeNo4Del 		= rowData['posTranTypeTransactionNumber'];								
							var remarkValue			= rowData['remark'];
							var receivedDateValue	= rowData['receivedDateStr'];
							var tranCode			= rowData['posTranTypeCode'];
							var status				= rowData['status'];  	
							var rowDataAtFirstRow	= $('#gridPosTranTypeSelected').jqGrid('getRowData',ids[0]);	
							var statusAtFirstRow	= rowDataAtFirstRow['status'];							  														  	
			  				var idTextarea 			= 'textareaRemark_' + ids[i];			
			  				var idReceivedDate		= 'receivedDate_' + ids[i];
			  				var idDeleteTranType	= 'btnDeleteTranType_' + tranCode + '_' + rowNum + '_' + tranTypeNo4Del.replace(/\//g,"-") + '_' + status;
				  						  							  				
			  				var be1 = '<textarea rows="2" cols="12" id=\"'+idTextarea+'\" style="margin-top: 10px;">'+ remarkValue +'</textarea>';	
			  				var be2 = '<input type="text" class="input-small" name="receivedDate" id=\"'+idReceivedDate+'\" value=\"'+receivedDateValue+'\" />';
					  				  			  				
							$("#gridPosTranTypeSelected").jqGrid('setRowData', ids[i], {
								remark : be1,
								receivedDateStr : be2					
		  					});
							$('#'+idReceivedDate).datepicker({dateFormat: "dd/mm/yy"});	

							$('#'+idTextarea).live('change',function(event){
								var btnId = $(this).attr('id').replace('textareaRemark_','');	
								$.ajax({
									type:'POST',
									url:postrackingcontextpath+'/processdetail/onChangeRemark?tranTypeNo=' + tranTypeNo + '&remark=' + $('#textareaRemark_'+btnId).val() ,
									success: function(data){
										if(data.result == '200'){
											//do nothing
										}
										if(data.result == '400'){
											//alert("Error, Failed to store remark");
										}
									},
									failure:function(){
										alert("Error, Failed to store remark");
									},
									dataType:'json'
								});							
							});
							
							$('#'+idReceivedDate).live('change',function(event){								
								var btnId = $(this).attr('id').replace('receivedDate_','');
								$.ajax({
									type:'POST',
									url:postrackingcontextpath+'/processdetail/onChangeReceivedDate?tranTypeNo=' + tranTypeNo + '&receivedDate=' + $('#receivedDate_'+btnId).val(),
									success: function(data){
										if(data.result == '200'){
											//do nothing
										}
										if(data.result == '400'){
											//alert("Error, Failed to store remark");
										}
									},
									failure:function(){
										alert("Error, Failed to store received date");
									},
									dataType:'json'
								});						
							});	

							$('#'+idDeleteTranType).live('click',function(event){													
								var splitId = $(this).attr('id').split('_');												
								var serviceCode = splitId[1];								
								var index = splitId[2];	
								var tranTypeNo = splitId[3];						
								var status = splitId[4];															
								if(statusAtFirstRow != '') {
									index--;
								}																																																														
								$.ajax({
									type:'POST',
									url:postrackingcontextpath + '/processdetail/deleteTransactionType?trantypeno=' + tranTypeNo,																							
									success:function(data){
										if(data.result == '200'){
											$("#gridPosTransactionType").setGridParam({
									    		url 			: postrackingcontextpath+"/processdetail/getPosTransactionType?posNumber=" + $('#posNumber').val(),									    		
												loadComplete : function(){
													var $this = $(this), i, count;
											        for (i = 0, count = idsOfSelectedRows.length; i < count; i++) {
											            $this.jqGrid('setSelection', idsOfSelectedRows[i], false);
											        }
													$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
										        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
												}	
									    						
								    		});								    		
								    		$("#gridPosTransactionType").trigger("reloadGrid");
																													
											/* Set gridPosTranTypeSelected */																																																				
											idsOfSelectedRows.splice(index, 1);																																						    				    				    		    			
								    		$("#gridPosTranTypeSelected").setGridParam({
									    		url 			: postrackingcontextpath+"/processdetail/proccesTransactionTypeFin?serviceCode=" + idsOfSelectedRows +
																		"&posNumber=" + $('#posNumber').val() +
																		"&policyNumber=" + $('#policyNumber').val()						
								    		});
								    		$('#dialogPosTransactionType').dialog("close");
								    		$("#gridPosTranTypeSelected").trigger("reloadGrid");									    									
										}
										if(data.result == '400'){
											//alert("Internal error system");
										}		   										
									},
									failure:function(){
										alert("Error, Failed to delete document");
									},
									dataType:'json'
								});
							});
							

							// Check, apakah ada document yang sudah di upload, kalo ada expand subgrid related
							$.ajax({
								type:'POST',
								url:postrackingcontextpath+'/processdetail/checkUploadedDocument?tranTypeNo=' + tranTypeNo,
								success: function(data){																							
									if(data.resultcheckUploadedDocument == '200'){		
										var parentId = data.serviceId + '';		
								    	var parentIdSplit = parentId.split(",");		
								    	for(var i = 0; i < parentIdSplit.length; i++){									    	
								    		$("#gridPosTranTypeSelected").jqGrid('expandSubGridRow', parentIdSplit[i]);
									    }
									}									
								},
								failure:function(){
									alert("Error, Failed to store received date");
								},
								dataType:'json'
							});	
								
			  			}
					},
			  		multiselect: false,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGridPosTranTypeSelected",
			  		pgbuttons: true,			  		
			  		viewrecords : true,
			  		caption: "Result",
			  		sortorder : "desc",
			  		jsonReader : {
						repeatitems : false,
						id: 0,
					},
					height : "100%",
					widht : "100%",
					mtype : "GET",				
					//rownumbers: true,																					
					subGrid : true,
					subGridOptions: {
				        "plusicon"  : "ui-icon-triangle-1-e",
				        "minusicon" : "ui-icon-triangle-1-s",
				        "openicon"  : "ui-icon-arrowreturn-1-e",
						//expand all rows on load
						"expandOnLoad" : true
					},
					subGridRowExpanded: function(subgrid_id, row_id) {
						var mainGrid = jQuery('#gridPosTranTypeSelected').jqGrid('getRowData', row_id);	
						var subgrid_table_id, pager_id;
						subgrid_table_id = subgrid_id+"_t";
						pager_id = "p_"+subgrid_table_id;
						$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
						$("#"+subgrid_table_id).jqGrid({
							datatype: "json",
							url		: postrackingcontextpath+"/processdetail/findDocumentTransactionSubGrid?serviceId=" + row_id,
							colNames: ['Document Name','Upload Document','',''],
							colModel: [
										{name:'documentDesc',index:'documentDesc',align:'center',sortable: false},
										{name:'uploaded',index:'uploaded',align:'center'},
										{name:'inputFile',index:'inputFile',sortable: false, width:'250px', align:"center"},
										{name:'upload',index:'upload',sortable: false, width:'160px', align:"center"}																													
							],
							gridComplete : function(){	
								$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
					        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");					
					  			var ids = jQuery('#'+subgrid_table_id).jqGrid('getDataIDs');						  							  			
					  			for ( var i = 0; i < ids.length; i++ ) {

					  				var formId = 'formUploadDoc_' + ids[i] + '_' + row_id;
					  				var inputFileId = 'uploadDocuments_' + ids[i] + '_' + row_id; 
					  				var buttonId = 'btnUpload_' + ids[i] + '_' + row_id;

					  				var be1 = '<form id=\"'+formId+'\" method="post" enctype="multipart/form-data" action="/postracking/processdetail/documentUpload">' +					  						  
				  					  '<input type="file" id=\"'+inputFileId+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>';			  						
			  						var be2 = '<input type="button" class="button-upload" title="Upload" id=\"'+buttonId+'\" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />';
			  						var be3 = '<img src="${pageContext.request.contextPath}/images/unchecked.gif" />';						  		
					  						  				
									$('#'+subgrid_table_id).jqGrid('setRowData', ids[i], {
										inputFile : be1,
										upload : be2,
										uploaded : be3
				  					});	

									// Check, apakah ada document yang sudah di upload, kalo ada tampilkan document tersebut
									$.ajax({
										type:'POST',
										url:postrackingcontextpath+'/processdetail/checkUploadedDocumentSubGrid?tranTypeNo=' + mainGrid.posTranTypeTransactionNumber + '&index=' + ids[i],
										success: function(data){
											if(data.result == '200'){	
												var paramDownloadDoc = 'posNumber=' + $('#posNumber').val() + '&tranNo=' + mainGrid.posTranTypeTransactionNumber + '&fileIndex=' + data.fileIndex + '&fileName=' + data.fileName;
												var xButtonRemove = 'btnRemove_' + data.fileIndex + row_id;	
												var be1x = '<img src="${pageContext.request.contextPath}/images/checked.gif" />';
												var be2x = data.fileName;
										        var be3x = '<a href="processdetail/downloadAttachment?'+paramDownloadDoc+'\" title="Download" id="linkDownload"><img src="${pageContext.request.contextPath}/images/download.png" /></a>' +
												          '&nbsp;<input type="button" class="button-delete" title="Delete" id=\"'+xButtonRemove+'\" style="margin-top: 10px; margin-bottom: 10px;" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />';

												$('#'+subgrid_table_id).jqGrid('setRowData', data.fileIndex, {
													uploaded 	: be1x,
													inputFile 	: be2x,
													upload 		: be3x
							  					});	

												/* If transaction submitted, disable all buttons */
											    if('${isSubmit}' == 'true'){	
											    	//$('#linkDownload').attr('href', 'javascript:');										    					    							    								    	
											    	$('input.btn').attr("disabled", "disabled");		     		    	
												}else{				
													//$('input').removeAttr('disabled');									
												}
											    if('${isCommonQuery}' == 'true'){												    
												    //$('#linkDownload').attr('href', 'javascript:');
													$('.button-delete').attr("disabled", "disabled");
												}
												
												$('#'+xButtonRemove).live('click',function(event){
													var splitId = $(this).attr('id').split('_');
													var btnId = $(this).attr('id').replace('btnUpload_','');
													btnId = btnId.substring(1);
													$.ajax({
														type:'POST',
														url:postrackingcontextpath + '/processdetail/deleteDocument?fileName=' + data.fileName + '&fileIndex=' + splitId[1].substring(0,1) + '&posNumber=' + $('#posNumber').val() + '&tranNo=' + mainGrid.posTranTypeTransactionNumber,																							
														success:function(data){
															if(data.result == '200'){										
																$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1].substring(0,1) - 1], {																
																		inputFile 	: '<form id=\"formUploadDoc_'+btnId+'_'+row_id+'\" method="post" enctype="multipart/form-data" action="/postracking/processdetail/documentUpload">' +					  						  
									  					  			  			  	  '<input type="file" id=\"uploadDocuments_'+btnId+'_'+row_id+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>',
									  					  			  	upload 		: '<input type="button" class="button-upload" title="Upload" id=\"btnUpload_'+btnId+'_'+row_id+'\" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />',
																		uploaded 	: be3																	
											  					});										
															}
															if(data.result == '400'){
																//alert("Remove Document Failed");
															}		   			
														    if('${isCommonQuery}' == 'true'){
																$('input.btn').attr("disabled", "disabled");
															} 							
														},
														failure:function(){
															alert("Error, Failed to save record");
														},
														dataType:'json'
													});
												});
											}																			
										},
										failure:function(){
											alert("Internal error system");
										},
										dataType:'json'
									});	

									// Upload Document
									$('#'+buttonId).live('click',function(event){														
										var btnId = $(this).attr('id').replace('btnUpload_','');
										var splitId = $(this).attr('id').split('_');
										var posNumber = $('#posNumber').val();		
										var buttonRemove = 'btnRemove_' + splitId[1] + splitId[2];

										var subGrid = $("#"+subgrid_table_id).jqGrid('getRowData',splitId[1]);
										var documentDesc = subGrid['documentDesc'];											

										var data = new FormData();
										data.append("file", $('#uploadDocuments_'+btnId)[0].files[0]);	
										$.ajax({
												type:'POST',
												url:postrackingcontextpath + '/processdetail/documentUpload?posNumber=' + posNumber + '&documentDesc=' + documentDesc
												+ '&fileIndex=' + splitId[1] + '&tranNo=' + mainGrid.posTranTypeTransactionNumber + '&serviceId=' + row_id,	
												data: data,			
												processData: false,
											    contentType: false,				
												success:function(data){
													if(data.result == '200'){//upload sukses
														var paramDownloadDoc = 'posNumber=' + posNumber + '&tranNo=' + mainGrid.posTranTypeTransactionNumber + '&fileIndex=' + splitId[1] + '&fileName=' + data.fileName;
														var be4 = '<img src="${pageContext.request.contextPath}/images/checked.gif" />';
														var be5 = data.fileName;
														var be6 = '<a href="processdetail/downloadAttachment?'+paramDownloadDoc+'\" title="Download"><img src="${pageContext.request.contextPath}/images/download.png" /></a>' +
						                                  		  '&nbsp;<input type="button" class="button-delete" title="Delete" id=\"'+buttonRemove+'\" style="margin-top: 10px; margin-bottom: 10px;" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />';
														
														$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1] - 1], {
															uploaded 	: be4,
															inputFile 	: be5,
															upload 		: be6
									  					});											
														//alert('Upload document succesfully');

														$('#'+buttonRemove).live('click',function(event){

															$.ajax({
																type:'POST',
																url:postrackingcontextpath + '/processdetail/deleteDocument?fileName=' + data.fileName + '&fileIndex=' + splitId[1] + '&posNumber=' + $('#posNumber').val() + '&tranNo=' + mainGrid.posTranTypeTransactionNumber,																							
																success:function(data){
																	if(data.result == '200'){										
																		$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1] - 1], {																
																			inputFile 	: '<form id=\"formUploadDoc_'+btnId+'\" method="post" enctype="multipart/form-data" action="/postracking/processdetail/documentUpload">' +					  						  
														  					  			  '<input type="file" id=\"uploadDocuments_'+btnId+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>',
																			upload 		: '<input type="button" class="button-upload" title="Upload" id=\"btnUpload_'+btnId+'\" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />',
																			uploaded 	: be3																
													  					});										
																	}
																	if(data.result == '400'){
																		//alert("Remove Document Failed");
																	}		   										
																},
																failure:function(){
																	alert("Error, Failed to delete document");
																},
																dataType:'json'
															});
															
														});
													}
													if(data.result == '400'){//upload fail
														alert('Upload document fail');
													}			   										
												},
												failure:function(){
													alert("Error, Failed to save document");
												},
												dataType:'json'
										});
									});			
					  			}

					  			/* If transaction submitted, disable all buttons */
							    if('${isSubmit}' == 'true'){					    							    								    		
							    	$('input').attr("disabled", "disabled");		     		    	
								}else{				
									//$('input').removeAttr('disabled');									
								}					
								if('${isCommonQuery}' == 'true'){
									$('input').attr("disabled", "disabled");
								}
					  		},
							rowNum : 10,
					  		rowList : [ 10, 20, 30, 40, 50 ],
					  		//pager: pager_id,
							height: 'auto',
							jsonReader: { repeatitems : false, }
						});
					},
					onSelectRow : function(rowId) {},
					loadComplete : function(){
						$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
			        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
					}	  			  				
				});
		    	
		    	/*=============================== End JQGrid Pos Transaction Type Selected ===========================*/
		    	
		    	/*=============================== Begin JQGrid Attachment ===========================*/
		    	
		    	$("#gridAttachment").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/processdetail/getAttachment?attachId=" + $('#attachId').val(),
					colNames:['&nbsb;','FILE NAME','UPLOAD TIME',''],
					colModel:[		
								{name:'posAttachId',index:'posAttachId', hidden: true},																			
								{name:'originalFilename',index:'originalFilename', align:"center", width:'300px', sortable: true},
								{name:'uploadTimestamp',index:'uploadTimestamp', sorttype: 'date', align:'center', formatter: 'date',
									formatter: function (cellval, opts) {
										if(cellval) {
											var date = new Date(cellval);
				                            opts = $.extend({}, $.jgrid.formatter.date, opts);
				                            return $.fmatter.util.DateFormat("", date, 'd-M-Y', opts);
										} else {
											return '';
										}			                            
			                     }},
			                     {name:'download',index:'download',sortable: false, align:"center"}  												
																	
					],								
					gridComplete : function(){
						$(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
			        	$(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
						var ids = jQuery("#gridAttachment").jqGrid('getDataIDs');							 					
						var url;
						for ( var i = 0; i < ids.length; i++ ) {
							var rowData = $("#gridAttachment").jqGrid('getRowData',ids[i]);
							var colData = rowData['originalFilename'];
							
							var id = ids[i];	
							var param = "attachmentId=" + id + "&posNumber=" +$("#posNumber").val();		
							url = '<a href="processdetail/downloadAttachment?'+param+'\" class="btn btn-warning" style="color:white;">Download</a>'														
							var be = url;			  							  							  				
							$("#gridAttachment").jqGrid('setRowData', ids[i], {
								download : be
		  					});								
			  			}
						
					},
			  		multiselect: true,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGridAttachment",
			  		pgbuttons: true,			  		
			  		viewrecords : true,
			  		caption: "",
			  		sortorder : "desc",
			  		jsonReader : {
						repeatitems : false,
						id: 0
					},
					height : "100%",
					widht : "100%",
					mtype : "GET",				
					rownumbers: true,
					onSelectRow : function(rowId) {
						var selectedRows = $('#gridAttachment').getGridParam('selarrrow');			
						if(selectedRows.length>0) {						
							$('#btnDeleteAttach').removeAttr('disabled');						
							if($('.cbox:unchecked','#gridAttachment').length == 0){
								$('#cb_grid').attr('checked',true);
							}else{
								$('#cb_grid').attr('checked',false);
							}
						} else {							
							$('#btnDeleteAttach').attr('disabled','disabled');
						}
					},
					loadComplete : function(){}	  			  				
				});

		    	/*=============================== End JQGrid Attachment ===========================*/
		    	
		    	$("#btnSearchPosTransactionType").click(function(e) {					    		    			    
		    		$("#gridPosTransactionType").setGridParam({
			    		url 			: postrackingcontextpath+"/processdetail/getPosTransactionType?tranDesc=" + $('#posTransactionTypeDesc').val() +
			    								"&posNumber=" + $('#posNumber').val() +
			    								"&policyNumber=" +  $('#policyNumber').val()
		    		});
		    		$("#gridPosTransactionType").trigger("reloadGrid");
		    	});

		    	
				/* Set gridPosTranTypeSelected */
		    	$("#btnProccesTransactionType").click(function(e) {
			    	
		    		$("#gridPosTranTypeSelected").setGridParam({
			    		url 			: postrackingcontextpath + "/processdetail/proccesTransactionTypeFin?serviceCode=" + idsOfSelectedRows +
												"&posNumber=" + $('#posNumber').val() +
												"&policyNumber=" + $('#policyNumber').val()														
		    		});
		    		
		    		$('#dialogPosTransactionType').dialog("close");
		    		$("#gridPosTranTypeSelected").trigger("reloadGrid");
		    			
		    	});

		    	$("#deliveryToPos").loadOptions(postrackingcontextpath+"/processdetail/getEmployeePosDept",{
					afterLoaded:function(){												
						$("#deliveryToPos").children("option[selected=selected]").attr("selected","");
						$("#deliveryToPos").children("option[value="+ ${posTransaction.posTransactionType.deliveryToPos} +"]").attr("selected","selected");
					}
		    	});

		    	/** Default system date**/
		    	$("#submissionDate").val($.datepicker.formatDate("dd/mm/yy", new Date()));								
		    	
			    $("#btnPopUpPosTransactionType").click(function(){
			    	$('#dialogPosTransactionType').dialog("open");
			    });

				$("#search").keyup(function(e) {
					if (e.which == 13) {
						$("#btnSearchPolicy").click();
					}
				});

			    $('#addFile').click(function() {
			        var fileIndex = $('#fileTable tr').children().length;			        
			        $('#fileTable').append(
			                '<tr><td>'+
			                '   <input type="file" name="uploadDocuments['+ fileIndex +']" />'+
			                '</td></tr>');
			    });

			    if($("#attachId").val() != ""){				    
					$("#btnUploadedDocPopUp").show();			
					$('#txtBtnUplodedDocPopUp').replaceWith("<div id='txtBtnUplodedDocPopUp'>${totalAttachment} uploaded file(s)</div>");					    
				}

				$("#btnUploadedDocPopUp").click(function(e) {
					$('#dialogAttachment').dialog("open");
				});

				$("#btnSavePosTransaction").click(function(){					
					$("#processDetailForm").submit();
					/*					
					if($.trim($("#policyNumber").val()) == ""){						
						$('#message').replaceWith(msgRegister("Policy Info cannot be empty"));			
						$('#message').show();								
					}
					*/
				});

				$("#btnSubmitPosTransaction").click(function() {
					$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/submitForm");
					$("#processDetailForm").submit();	
				});		
				
				$("#btnBacktoBranch").click(function() {
					$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/backToBranch");
					$("#processDetailForm").submit();	
				});		

				$("#btnProcess").click(function() {
					$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/processTransactionType?statusDesc=In Progress");
					$("#processDetailForm").submit();	
				});

				$("#btnApprove").click(function() {
					$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/processTransactionType?statusDesc=Approve");
					$("#processDetailForm").submit();
				});

				$("#btnClose").click(function() {
					$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/processTransactionType?statusDesc=Close");
					$("#processDetailForm").submit();
				});

				$("#btnReject").click(function() {					
					if($.trim($("#reasonOfRejection").val()) == "") {
						alert('Please fill the [ Reason of Rejection ] field');
					}
					else {
						$("#processDetailForm").attr("action",postrackingcontextpath+"/processdetail/processTransactionType?statusDesc=Reject");
						$("#processDetailForm").submit();
					}
				});

			    if($("#posTranId").val() != ""){
			    	$('#btnSavePosTransaction').removeAttr('disabled');	
			    	$('#btnSubmitPosTransaction').removeAttr('disabled');
				}

			    if($("#status").val() == "Registered"){
			    	$('#btnProcess').removeAttr('style');
				}
			    else if($("#status").val() == "In Progress"){
			    	$('#btnApprove').removeAttr('style');
				}
			    else if($("#status").val() == "Approve"){
			    	$('#btnClose').removeAttr('style');
				}
				
			    $("#btnDeleteAttach").click(function(){	  	  	    	
		    		postracking.Msg.confirm("Confirmation","Are you sure that you want to permanently delete the selected file ?",{
	   		              "No":function(){
	   		            		postracking.Msg.closeDlg($(this));
	   		              },
	   		              "Yes":function(){         
		   		            	var selectedRows = $('#gridAttachment').getGridParam("selarrrow");
		    					var params = $("form", "#dialogAttachment").serialize();
								$.ajax({
									type:'POST',
									url:postrackingcontextpath+'/processdetail/deleteAttachment?attachId=' + selectedRows,	
									data:params,							
									success:function(data){
										if(data.result == 'deleted'){										
											$("#gridAttachment").trigger("reloadGrid");
											var total = Number($('#totalAttachment').val() - data.totalAttachment); 
											$('#txtBtnUplodedDocPopUp').replaceWith("<div id='txtBtnUplodedDocPopUp'>" + total + " uploaded file(s)</div>");										
										}
										if(data.result == 'failed'){
											alert("Internal System Error, Delete Unsuccessfull");
										}			   										
									},
									failure:function(){
										alert("Error, Failed to delete record");
									},
									dataType:'json'
								});									   	   					
								postracking.Msg.closeDlg($(this));
								return true;
	   		              }
	   	            });		    		
	  	    	});   

				/* If transaction submitted, disable all buttons */				
			    if('${isSubmit}' == 'true'){
			    	$('#btnPopUpPosTransactionType').attr("disabled", "disabled");				     
			    	$('#btnSavePosTransaction').attr("disabled", "disabled");
			    	$('#btnSubmitPosTransaction').attr("disabled", "disabled");
			    	$('#btnUploadedDocPopUp').attr("disabled", "disabled");
			    	$('input').attr("disabled", "disabled");
			    	$('textarea').attr("disabled", "disabled");
			    	/* $('select').attr("disabled", "disabled"); */
			    	$('#deliveryToPos').attr("disabled", "disabled");
			    	$('#reasonOfRejection').removeAttr('disabled');
				}else{	     
			    	$('#btnSavePosTransaction').removeAttr("disabled");
			    	$('#btnSubmitPosTransaction').removeAttr("disabled");
			    	$('#btnUploadedDocPopUp').removeAttr("disabled");			    	
			    	 /* If transaction saved show submit button */
				    if('${isDocumentComplete}' == 'true'){						    			    				    
				    	$('#btnSubmitPosTransaction').removeAttr('disabled');
				    	$('#btnPopUpPosTransactionType').attr("disabled", "disabled");
					}else{
						$('#btnSubmitPosTransaction').attr("disabled", "disabled");						
					}
				}

			    if('${status}' == '0'){			    	
					$('#btnBacktoBranch').attr("disabled", "disabled");
				}else if('${status}' == '1'){
					$('#fieldsetGridPosTranTypeSelected').attr("disabled", "disabled");
					$('#btnBacktoBranch').removeAttr('disabled');
				}else if('${status}' == '2'){
					$('#fieldsetGridPosTranTypeSelected').attr("disabled", "disabled");					
				}
				

				if('${isCommonQuery}' == 'true'){
			    	$('#btnPopUpPosTransactionType').attr("disabled", "disabled");		
			    	$('input').attr("disabled", "disabled");		     
			    	$('#btnSavePosTransaction').attr("disabled", "disabled");
			    	$('#btnSubmitPosTransaction').attr("disabled", "disabled");	
				}	

		    }
		});
			
	</script>
	
</body>