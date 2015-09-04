<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/registration" var="registration"/>
	<form:form method="POST" modelAttribute="registration" id="registrationForm" action="${registration}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<form:hidden path="policyInquiry.policyId" id="policyId" />
		
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
	  				<!-- PANEL POLICY INFO 																												   		       -->
	  				<!--  																																			   -->
	  				<!-- ############################################################################################################################################# -->
	  			
	  				<div class="accordion">
	  				
	  					<div class="accordion-group accordion-heading">
	  					
	  						<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
									<fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" />	
								</a>
							</div>
							
							<div id="collapse1" class="accordion-body in collapse">
							
								<div class="accordion-inner">
									
									<div class="form-actions">
								    	<div class="control-group">
							  				<button type="button" id="btnPopUpPolis" name="btnPopUpPolis" class="btn btn-warning">
									  			<fmt:message key="btn.policylist" bundle="${com}" />
									  		</button>
									  	</div>		      	
									</div>
									
									<div class="row-fluid">	  		
			  				  			
						  				<div class="span4">
						  				  					
								  			<div class="control-group">
								  				<label class="control-label" for="policyNumber">
								  					<fmt:message key="lbl.Registration.form.PolicyNumber" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyCode" id="policyNumber" readonly="true" class="input-large" />					        	
										      	</div>
								  			</div>  	
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="policyStatus">
								  					<fmt:message key="lbl.Registration.form.PolicyStatus" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.statusName" id="policyStatus" readonly="true" class="input-large" />
										      	</div>
								  			</div>
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="policyHolder">
								  					<fmt:message key="lbl.Registration.form.PolicyHolder" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.policyHolder" id="policyHolder" readonly="true" class="input-large" />
										      	</div>
								  			</div>	  					  			
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="insured">
								  					<fmt:message key="lbl.Registration.form.Insured" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.insured" id="insured" readonly="true" class="input-large" />
										      	</div>
								  			</div>			  			
								  			
								  			<div class="control-group">
								  				<label class="control-label3" for="agentName">
								  					<fmt:message key="lbl.Registration.form.AgentName" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.agentName" id="agentName" readonly="true" class="input-large" />
										      	</div>
								  			</div>			
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="partner">
								  					<fmt:message key="lbl.Registration.form.Partner" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.partnerName" id="partner" readonly="true" class="input-large" />
										      	</div>
								  			</div>								  									  				  					  						  								  				
						  				
						  				</div><!-- span4 -->
						  				
						  				<div class="span4">
						  					
								  			<div class="control-group">
								  				<label class="control-label" for="policyYear">
								  					<fmt:message key="lbl.Registration.form.PolicyYear" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.policyYear" id="policyYear" readonly="true" class="input-large" />
										      	</div>
								  			</div>	  				
						  					
								  			<div class="control-group">
								  				<label class="control-label" for="commencementDate">
								  					<fmt:message key="lbl.Registration.form.CommencementDate" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.commencementDate" id="commencementDate" readonly="true" class="input-large" />
										      	</div>
								  			</div>
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="issueDate">
								  					<fmt:message key="lbl.Registration.form.IssueDate" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.issueDate" id="issueDate" readonly="true" class="input-large" />
										      	</div>
								  			</div>			  				  			  			
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="coverageEndDate">
								  					<fmt:message key="lbl.Registration.form.CoverageEndDate" bundle="${com}" />
								  				</label>
												<div class="controls">
													<form:input path="policyInquiry.issueDate" id="coverageEndDate" readonly="true" class="input-large" />			        	
										      	</div>
								  			</div>				  	
								  			
									  		<div class="control-group">
								  				<label class="control-label" for="agentStatus">
								  					<fmt:message key="lbl.Registration.form.AgentStatus" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.agentStatusName" id="agentStatus" readonly="true" class="input-large" />
										      	</div>
								  			</div>									  						  		
							  						  					  	
							  			</div><!-- span4 -->
							  			
							  			<div class="span4">
							  			
								  			<div class="control-group">
								  				<label class="control-label" for="branch">
								  					<fmt:message key="lbl.Registration.form.Branch" bundle="${com}" />
								  				</label>
												<div class="controls">					        											        	
										        	<form:input path="policyInquiry.agentBranch" id="branch" readonly="true" class="input-large" />
										      	</div>
								  			</div>
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="dueDate">
								  					<fmt:message key="lbl.Registration.form.DueDate" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.dueDate" id="dueDate" readonly="true" class="input-large" />
										      	</div>
								  			</div>			  				
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="installmentPremium">
								  					<fmt:message key="lbl.Registration.form.InstallmentPremium" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<form:input path="installmentPremium" cssStyle="text-align:right" class="input-large" name="installmentPremium" id="installmentPremium" readonly="true" />
										      	</div>
								  			</div>			  					  					 			  									  		
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="paymentFreq">
								  					<fmt:message key="lbl.Registration.form.PaymentFreq" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.initialTypeName" id="paymentFreq" readonly="true" class="input-large" />
										      	</div>
								  			</div>			
								  			
								  			<div class="control-group">
								  				<label class="control-label" for="ram">
								  					<fmt:message key="lbl.Registration.form.Ram" bundle="${com}" />
								  				</label>
												<div class="controls">					        	
										        	<form:input path="policyInquiry.ramName" id="ram" readonly="true" class="input-large" />
										      	</div>
								  			</div>  			
								  			
							  			</div><!-- span4 -->	
							  			
						  			</div><!-- row-fluid -->												
									
								</div><!-- accordion-inner -->
	  					
	  						</div>
	  					
	  					</div>
	  					
	  				</div>
	  				
	  				<!-- ############################################################################################################################################# -->
	  				<!--  																																			   -->
	  				<!-- PANEL BENEFIT INFO 																												   		   -->
	  				<!--  																																			   -->
	  				<!-- ############################################################################################################################################# -->
	  			
					<div class="accordion">
					
						<div class="accordion-group accordion-heading">
						
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" href="#collapse2">
									<fmt:message key="lbl.Registration.form.BenefitInfo" bundle="${com}" />	
								</a>
							</div>
							
							<div id="collapse2" class="accordion-body in collapse">
							
								<div class="accordion-inner">
								
									<div class="controls pull-left">
					  					<table id="gridBenefitInfo"></table>
										<div id="pGridBenefitInfo"></div>
					  				</div>
					  				
					  				<p>&nbsp;</p>
								
								</div>
							
							</div>
						
						</div><!-- accordion-group accordion-heading -->
					
					</div><!-- accordion -->
	  			
	  			</div>
	  			
	  			<div class="clearfix"></div>
	  			<div class="form-actions">  					
		    		<button type="submit" class="btn btn-warning" id="btnSavePosRegistration"><i class="icon-save"></i>&nbsp;<fmt:message key="btn.save" bundle="${com}" /></button>
		    		<button type="submit" class="btn btn-warning" id="btnSaveContinuePosDocument"><fmt:message key="btn.saveContinue" bundle="${com}" /></button>		    		
		      		<button type="button" class="btn btn-warning" id="btnSubmitPosRegistration" disabled="disabled"><i class="icon-ok-circle"></i>&nbsp;<fmt:message key="btn.submit" bundle="${com}" /></button>
		      		<button type="button" class="btn btn-warning" id="btnBacktoBranch" disabled="disabled"><i class="icon-arrow-left"></i>&nbsp;<fmt:message key="btn.backToBranch" bundle="${com}" /></button>
				</div>
	  			 
	  		</div><!-- widget-content -->
	  		
		</div><!-- widget stacked -->
		  			
	</form:form>	
	
	<div id="dialogPolicy">
 		<div class="control-group">
 			<label class="control-label" for="search">
 				<fmt:message key="lbl.Query.form.PolicyNumber" bundle="${com}" />
 			</label>
			<div class="controls">
	        	<input type="text" class="input-large" name="search" id="search" />&nbsp;&nbsp;	
	        	<button type="button" id="btnSearchPolicy" name="btnSearchPolicy" class="btn btn-warning" style="margin-top: -10px;">
		      		<i class="icon-search"></i>&nbsp;<fmt:message key="btn.search" bundle="${com}" />
		      	</button>        	
		      </div>	 
	      	     	
 		</div>		 	
 			
		<!-- Grid Policy -->
		<table id="grid" width="100%"></table>
		<div id="pGrid"></div>
	</div><!-- dialogPolicy -->

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
			    
				// Set up the number formatting.
			    $('#installmentPremium').number(true, 2);

				/*=============================== Begin Dialog Policy ===========================*/
		    	
		    	$("#dialogPolicy").dialog({
	    			autoOpen: false,
	    			height: 'auto',
	    			width: 'auto',
	    			modal: true,
	    			position: ['top', 60],
	    			title:'Policy List',
	    			buttons: {
	    				'Close': function() {
	    					$(this).dialog('close');
	    				}
	    			}
		    	});

		    	/*================================ End Dialog Policy ============================*/
		    	
		    	/*=============================== Begin JQGrid Policy List ===========================*/

		    	$("#grid").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/registration/getPolicyInquiry",
					colNames:['&nbsb;','Policy Number','Policy Holder','Insured',''],
					colModel:[
								{name:'policyId',index:'policyId', width:'100px', hidden: true},								
								{name:'policyCode',index:'policyCode', sortable: true}, 
								{name:'policyHolder',index:'policyHolder', sortable: true},
								{name:'insured',index:'insured',sortable: false},
								{name:'select',index:'select',sortable: false, width:'110px', align:"center"}								
					],								
					gridComplete : function(){						
			  			var ids = jQuery("#grid").jqGrid('getDataIDs');						  							  			
			  			for ( var i = 0; i < ids.length; i++) {	
			  				var id = 'btnSelect_' + ids[i];			  							  							  				
			  				var be = '<input class="btn btn-warning" type="button" value="Select" id=\"'+id+'\" />';	  				
							$("#grid").jqGrid('setRowData', ids[i], {
								select : be
		  					});					
							$('#'+id).live('click',function(event){
								var btnId = $(this).attr('id').replace('btnSelect_','');								
								$('#dialogPolicy').dialog('close');
								showLoading();														
								$.getJSON(postrackingcontextpath+"/registration/selectPolicy?", { 'policyId':btnId }, function(data){
									if(data.policyNumber){
										hideLoading();											
										$('#policyNumber').val(data.policyNumber);														
										$('#insured').val(data.insured);
										$('#coverageEndDate').val(data.coverageEndDate);
										$('#policyStatus').val(data.policyStatus);
										$('#policyHolder').val(data.policyHolder);
										$('#commencementDate').val(data.commencementDate);
										$('#issueDate').val(data.issueDate);
										$('#policyYear').val(data.policyYear);			
										$('#agentCode').val(data.agentCode);
										$('#agentName').val(data.agentName);
										$('#agentStatus').val(data.agentStatus);
										$('#branch').val(data.branch);			
										$('#partner').val(data.partner);
										$('#ram').val(data.ram);
										$('#installmentPremium').val(data.installmentPremium);
										$('#paymentFreq').val(data.paymentFreq);
										$('#dueDate').val(data.dueDate);
										$('#policyId').val(data.policyId);
									} else {					
										$('#dialogPolicy').dialog('close');	
									}
								});		

								/*========================================= Set & Reload Benefit Info ========================================*/
								$("#gridBenefitInfo").setGridParam({
						    		url 			: postrackingcontextpath+"/registration/getBenefitInfo?pId="+btnId,
						    		loadComplete	: function(){}
					    		});
					    		$("#gridBenefitInfo").trigger("reloadGrid");
							});			
			  			}			  						
			  		},
			  		multiselect: false,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGrid",
			  		pgbuttons: true,
			  		sortname : 'policyId',
			  		viewrecords : true,
			  		caption: "",
			  		sortorder : "desc",
			  		jsonReader : {
						repeatitems : false,
						id: 0
					},
					height : '100%',
					widht : '100%',
					mtype : 'GET',				
					rownumbers: false,
					onSelectRow : function(rowId) {},
					loadComplete : function(){
						multiColor('grid');
					}	  			  				
				});

		    	/*=============================== End JQGrid Policy List ===========================*/

		    	$("#btnSearchPolicy").click(function(e) {			    	
		    		$("#grid").setGridParam({
			    		url 			: postrackingcontextpath+"/registration/getPolicyInquiry?search="+$('#search').val(),
			    		loadComplete	:function(){
			    			var ids = jQuery("#grid").jqGrid('getDataIDs');
							if(ids.length == ''){
								// do nothing
							}
			    		}
		    		});
		    		$("#grid").trigger("reloadGrid");
		    	});


		    	/*=============================== Begin JQGrid Benefit Info ===========================*/

		    	$("#gridBenefitInfo").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/registration/getBenefitInfo?policyCode=" + $('#policyNumber').val(),
					colNames:['Product Code','Product Name','Level','Benefit','Status','End Date','Insured Name'],
					colModel:[															
								{name:'internalId',index:'internalId', sortable: true, width:'100px'}, 
								{name:'productName',index:'productName', sortable: true},
								{name:'duty', index:'duty', sortable: true, width:'70px'}, // Level (Plan 2)
								{name:'benefitType2',index:'benefitType2', align:"right",sortable: true, 
									formatter:'currency',formatoptions: {prefix:'Rp ', suffix:'', thousandsSeparator:','}},
								{name:'status',index:'status', align:'center', sortable: true, width:'50px'},	
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
								{name:'insuredName',index:'insuredName', sortable: true, width:'180px'}															
					],								
					gridComplete : function(){},
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
					onSelectRow : function(rowId) {},
					beforeSelectRow: function (rowid, e) {
						return $(e.target).is('input[type=checkbox]');
					},
					loadComplete : function(){
						multiColor('gridBenefitInfo');
					}	  			  				
				});		    	

		    	/*=============================== End JQGrid Benefit Info ===========================*/		
		    	
		    	$("#btnPopUpPolis").click(function() {			    	
		    		$('#dialogPolicy').dialog('open');		    		
		    	});

				$("#search").keyup(function(e) {
					if (e.which == 13) {
						$("#btnSearchPolicy").click();
					}
				});

		    	$("#btnSubmitPosRegistration").click(function() {
					$("#registrationForm").attr("action",postrackingcontextpath+"/registration/submit?page=1");
					$("#registrationForm").submit();	
				});

		    	$("#btnSaveContinuePosDocument").click(function() {
					$("#registrationForm").attr("action",postrackingcontextpath+"/registration/saveContinuePolicyInfo");
					$("#registrationForm").submit();	
				});
				
				$("#btnBacktoBranch").click(function() {
					$("#registrationForm").attr("action",postrackingcontextpath+"/registration/backtobranch?page=1");
					$("#registrationForm").submit();	
				});		

		    }
		});
			
	</script>
	
</body>