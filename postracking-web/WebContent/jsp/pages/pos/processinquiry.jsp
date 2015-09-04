<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/processinquiry" var="processinquiry"/>
	<form:form method="post" modelAttribute="user" action="${processinquiry}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
	
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-share"></i>
	      		<h3><fmt:message key="lbl.Process.header.Inquiry" bundle="${com}" /></h3>
	  		</div> <!-- /widget-header -->
	  		
		  		<div class="widget-content">
		  		
		  			<div class="accordion">
		  			
		  				<div class="accordion-group accordion-heading">
		  				
		  					<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
									<fmt:message key="lbl.common.search" bundle="${com}" />
								</a>
							</div>
		  				
		  					<div id="collapse1" class="accordion-body in collapse">
		  					
		  						<div class="accordion-inner">
		  						
									<div class="row-fluid">
						  				<div class="span3">
						  					<div class="control-group">
								  				<label class="control-label" for="name">			  				
								  					<fmt:message key="lbl.Query.form.PosNumber" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="input-large" name="posNumber" id="posNumber" />
										      	</div>
								  			</div>
								  		</div>
								  		
								  		<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="transactionNo">			  				
								  					<fmt:message key="lbl.Query.form.TransactionNo" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="input-large" name="transactionNo" id="transactionNo" />
										      	</div>
								  			</div>
								  		</div>
								  		
								  		<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="transactionTypeCombo">			  				
								  					<fmt:message key="lbl.Query.form.TransactionType" bundle="${com}" />
								  				</label>
												<div class="controls">
								        			<select id="transactionTypeCombo" name="transactionTypeCombo"></select>
								        			<input type="hidden" id="transactionTypeFor">
										      	</div>
								  			</div>
								  		</div>
								  		
										<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="validateSelect">			  				
								  					<fmt:message key="lbl.Query.form.Branch" bundle="${com}" />
								  				</label>
								  				<div class="controls">
								        			<select id="branchCombo" name="validateSelect"></select>
								        			<input type="hidden" id="branchFor">
										      	</div>
								  			</div>
								  		</div>								  		
								  		
						  			</div><!-- row-fluid -->
						  			
						  			<div class="row-fluid">
						  			
						  				<div class="span3">
						  					<div class="control-group">
								  				<label class="control-label" for="name">
								  					<fmt:message key="lbl.Query.form.PolicyNumber" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="input-large" name="policyNumber" id="policyNumber" />
										      	</div>
								  			</div>  
								  		</div>
								  		
								  		<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="name">			  				
								  					<fmt:message key="lbl.Query.form.PolicyHolder" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="input-large" name="policyHolder" id="policyHolder" />
										      	</div>
								  			</div>
								  		</div>
								  		
								  		<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="validateSelect">
								  					<fmt:message key="lbl.Query.form.Status" bundle="${com}" />
								  				</label>
												<div class="controls">
								        			<select id="statusQueryCombo" name="validateSelect"></select>
								        			<input type="hidden" id="statusQueryFor">
										      	</div>
								  			</div>
								  		</div>
								  		
										<div class="span3">
							  				<div class="control-group">
								  				<label class="control-label" for="deliveryToPos">
								  					<fmt:message key="lbl.Query.form.PosUser" bundle="${com}" />
								  				</label>
												<div class="controls">													        						        						        
										        	<select id="posUserCombo" name="validateSelect"></select>
								        			<input type="hidden" id="posUserFor">			        							        						        							        							        
										      	</div>
								  			</div>	  			  					  								  						  			
							  			</div><!-- span3 -->							  		
								  		
						  			</div> <!-- row-fluid -->
						  			
						  			<div class="row-fluid">
						  			
						  				<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="name">
								  					<fmt:message key="lbl.Query.form.SubmissionDateHo" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="datefield" name="subDateHO" id="subDateHO" />
										      	</div>
								  			</div>
						  				</div>
						  				
										<div class="span3">
								  			<div class="control-group">
								  				<label class="control-label" for="name">
								  					<fmt:message key="lbl.Query.form.SubmissionDateBranch" bundle="${com}" />
								  				</label>
												<div class="controls">
										        	<input type="text" class="datefield" name="subDateBranch" id="subDateBranch" />
										      	</div>
								  			</div>
						  				</div>						  				
						  			
							  			
							  		</div> <!-- row-fluid -->	  						
		  						
		  						</div> <!-- accordion-inner -->
		  					
		  					
		  					</div>  <!-- accordion-body in collapse -->
		  				
		  				</div> <!-- accordion-group accordion-heading -->
		  			
		  			
		  			</div> <!-- accordion -->
		  		
		  			<div class="form-actions">
				    	<button type="button" id="btnSearchQuery" name="btnSearchQuery" class="btn btn-warning"><i class="icon-search">&nbsp;</i><fmt:message key="btn.search" bundle="${com}" /></button>
				      	<button type="reset" id="btnCancelQuery" name="btnCancelQuery" class="btn"><i class="icon-chevron-left"></i>&nbsp;<fmt:message key="btn.cancel" bundle="${com}" /></button>
					</div>	
					
					
					<!---   Begin JQgrid Table & Paging --->	
					
					<table id="grid" width="100%" align="center"></table>
					<div id="pGrid"></div>
					
					<!---   End JQgrid Table & Paging  --->	
					
					<p>&nbsp;</p>
					
			</div>
			
		</div>
		
	</form:form>
	
	<script type="text/javascript">
		postracking.form.init({
			isAjax:false,
			ajaxOptions:{
		           dataType:'',
		           success:function(){				
						hideLoading();						
		           }
		    },
		    fn:function(){

		    	var isBranch = '${sessionScope.isBranch}';

		    	$("#deleteBtn").click(function(){	  	  	    	
		    		postracking.Msg.confirm("Confirmation","Are you sure want to delete the selected item(s) ?",{
	   		              "No":function(){
	   		            		postracking.Msg.closeDlg($(this));
	   		              },
	   		              "Yes":function(){         
		   		            	var selectedRows = $('#grid').getGridParam("selarrrow");
		    					$.ajax({
		    						type:'POST',
		    						url:postrackingcontextpath + '/processinquiry/delete?id=' + selectedRows,
		    						success:function(data){			    						
			    						if(data.result == 'success'){
			    							$("#grid").trigger('reloadGrid');				   						
											$('#deleteBtn').attr('disabled','disabled');
				    					}else{
				    						alert("Error, Failed to delete record");
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

		    	$("#cancelBtn").click(function(){	  	  	    	
		    		postracking.Msg.confirm("Confirmation","Are you sure want to cancel the selected item(s) ?",{
	   		              "No":function(){
	   		            		postracking.Msg.closeDlg($(this));
	   		              },
	   		              "Yes":function(){         
		   		            	var selectedRows = $('#grid').getGridParam("selarrrow");
		    					$.ajax({
		    						type:'POST',
		    						url:postrackingcontextpath + '/processinquiry/cancel?id=' + selectedRows,
		    						success:function(data){			    						
			    						if(data.result == 'success'){
			    							$("#grid").trigger('reloadGrid');				   						
											$('#cancelBtn').attr('disabled','disabled');
				    					}else{
				    						alert("Error, Failed to cancel record");
					    				}
		    						},
		    						failure:function(){
		    							alert("Error, Failed to cancel record");
		    						},
		    						dataType:'json'
		    					});	   	   					
		    					postracking.Msg.closeDlg($(this));
		   						return true;
	   		              }
	   	            });
		    		
	  	    	});
	  	    	

	  	    	$('#btnSearchQuery').click(function(){
		    		$("#grid").setGridParam({
			    		url 			: postrackingcontextpath+"/processinquiry/getPosTransaction?policyNumber=" + $('#policyNumber').val() +
			    							"&subDateBranch=" + $('#subDateBranch').val() +
			    							"&subDateHO=" + $('#subDateHO').val() +
			    							"&posNumber=" + $('#posNumber').val() +
			    							"&policyHolder=" + $('#policyHolder').val() +
			    							"&branch=" + $('#branchCombo').val() +
			    							"&status=" + $('#statusQueryCombo').val() + 
			    							"&transactionNo=" + $('#transactionNo').val() + 
			    							"&transactionType=" + $('#transactionTypeCombo').val() + 
			    							"&posUser=" + $('#posUserCombo').val(),
			    		loadComplete	:function(){
			    			var ids = jQuery("#grid").jqGrid('getDataIDs');
							if(ids.length == ''){
								// do nothing
							}
			    		}
		    		});
		    		$("#grid").trigger("reloadGrid");
		  	    });
		  	    
		  	    $('#btnCancelQuery').click(function(){
		  	    	$('#policyNumber,#subDate,#posNumber,#policyHolder,#transactionNo').val(null);
			  	});
		  	    

		    	var idsOfSelectedRows = [];
		    	var updateIdsOfSelectedRows = function (id, isSelected) {
		    		var index = $.inArray(id, idsOfSelectedRows);		    		
		            if (!isSelected && index >= 0) {
		                idsOfSelectedRows.splice(index, 1); // remove id from the list
		            } else if (index < 0) {			            
		                idsOfSelectedRows.push(id);
		            }
		    	};
				
		    	$("#grid").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/processinquiry/getPosTransaction",
					colNames:['&nbsb;','Pos No','Transaction No','Policy No','Policy Holder','Transaction Type','Branch','Receive Date','Sub Date Branch','Sub Date HO','Pos User','Doc Complete','Status','Action'],
					colModel:[
								{name:'posTransactionTypeId',index:'posTransactionTypeId', hidden: true, width:'1px'},								
								{name:'posNumber',index:'posNumber', align:"center",sortable: true, width:'90px'}, 
								{name:'transactionNumber',index:'transactionNumber', align:"center",sortable: true,width:'160px'},
								{name:'policyCode',index:'policyCode',align:"center", sortable: true, width:'100px'},
								{name:'policyHolder',index:'policyHolder',align:"center",sortable: false},
								{name:'posTranTypeDesc',index:'posTranTypeDesc',align:"center", sortable: true, width:'175px'},
								{name:'branch',index:'branch',align:"center",sortable: false, width:'90px'},					
								{name:'receivedDate',index:'receivedDate', sorttype: 'date', align:'center', formatter: 'date', width:'130px', 
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
								{name:'submissionDateByBranch',index:'submissionDateByBranch', sorttype: 'date', align:'center', formatter: 'date', width:'170px',
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
								{name:'submissionDateByHO',index:'submissionDateByHO', sorttype: 'date', align:'center', formatter: 'date', width:'150px',
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
								{name:'posUser',index:'posUser',align:"center",sortable: false, width:'90px'},	
								{name:'documentComplete',index:'documentComplete',align:"center",sortable: false, width:'140px'},							
								{name:'transactionStatus',index:'transactionStatus',align:"center",sortable: false, width:'80px'},
								{name:'edit',index:'edit',sortable: false, align:"center", width:'100px'}								
					],								
					gridComplete : function(){
						var ids = jQuery("#grid").jqGrid('getDataIDs');							 					
						var img, tranStatus;			
						for ( var i = 0; i < ids.length; i++) {			  							  				
							var id = ids[i];
							var rowData = $('#grid').jqGrid('getRowData',ids[i]);
							var posNumber = rowData['posNumber'];
							var docComplete = rowData['documentComplete'];
							var status = rowData['transactionStatus'];
							var url = '<a href="processdetail/policyinfo/edit?trantypeid='+id+'&edit=Y&posnumber='+posNumber+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';

							if(docComplete == '200') {
								img = "<img src='${pageContext.request.contextPath}/images/checked.gif' />";
							} else if(docComplete == '400'){
								img = "<img src='${pageContext.request.contextPath}/images/unchecked.gif' />";
							} else {
								img = null;
							}

							if(status == 'REGISTRATION_IN_PROGRESS'){
								tranStatus = 'Registration in Progress';
							} else if (status == 'PENDING_AT_REGISTRATION') {
								tranStatus = 'Pending at Registration';
							} else if (status == 'REGISTERED_BY_HO') {
								tranStatus = 'Registered';
							} else if (status == 'CANCELLED') {
								tranStatus = 'Cancelled';
								url = null;
							} else if (status == 'IN_PROGRESS') {
								tranStatus = 'In Progress';
							} else if (status == 'APPROVE') {
								tranStatus = 'Approve';
							} else if (status == 'CLOSE') {
								tranStatus = 'Close';
							} else if (status == 'REJECT') {
								tranStatus = 'Reject';
							} else {
								tranStatus = null;
							}
							
							var be1 = url;
							var be2 = img;			  		
							var be3 = tranStatus;					  							  							  									  					  			
							$("#grid").jqGrid('setRowData', ids[i], {
								edit : be1,
								documentComplete : be2,
								transactionStatus : be3
		  					});								
			  			}					
			  			
			  		},
			        onSelectAll: function (aRowids, status) {				        
			            var i, count, id;
			            for (i = 0, count = aRowids.length; i < count; i++) {
			                id = aRowids[i];
			                updateIdsOfSelectedRows(id, status);
			            }			            
			        },
			  		//multiselect: true,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGrid",
			  		pgbuttons: true,
			  		sortname : 'posTransactionTypeId',
			  		viewrecords : true,
			  		beforeSelectRow: function (rowid, e) {
						return $(e.target).is('input[type=checkbox]');
					},
			  		caption: "Result",
			  		sortorder : "desc",
			  		jsonReader : {
						repeatitems : false,
						id: 0
					},
					height : '100%',
					widht : '100%',
					mtype : 'GET',		
					altRows: true,
					multiboxonly: true,
					autowidth: true,							
					onSelectRow : function(rowId, status) {
						var selectedRows = $('#grid').getGridParam("selarrrow");						
						if(selectedRows.length > 0) {				
							if($('.cbox:unchecked','#grid').length == 0)
								 $('#cb_grid').attr('checked',true);
							else $('#cb_grid').attr('checked',false);
						}
						updateIdsOfSelectedRows(rowId, status);
					},
					loadComplete : function(){
						var $this = $(this), i, count;						
				        for (i = 0, count = idsOfSelectedRows.length; i < count; i++) {
				            $this.jqGrid('setSelection', idsOfSelectedRows[i], false);
				        }
				        multiColor('grid');
					}	  			  				
				});	

		    	$("#statusQueryCombo").loadOptions(postrackingcontextpath+"/processinquiry/getStatus",{
					afterLoaded:function(){
						$("#statusQueryCombo").children("option[selected=selected]").attr("selected","");
						$("#statusQueryCombo").children("option[value="+$('#statusQueryFor').val()+"]").attr("selected","selected");
					}
				});

		    	$("#branchCombo").loadOptions(postrackingcontextpath+"/processinquiry/getBranch",{
					afterLoaded:function(){
						$("#branchCombo").children("option[selected=selected]").attr("selected","");
						$("#branchCombo").children("option[value="+$('#branchFor').val()+"]").attr("selected","selected");
					}
				});

		    	$("#transactionTypeCombo").loadOptions(postrackingcontextpath+"/processinquiry/getService",{
					afterLoaded:function(){
						$("#transactionTypeCombo").children("option[selected=selected]").attr("selected","");
						$("#transactionTypeCombo").children("option[value="+$('#transactionTypeFor').val()+"]").attr("selected","selected");
					}
				});

		    	$("#posUserCombo").loadOptions(postrackingcontextpath+"/processinquiry/getPosUser",{
					afterLoaded:function(){
						$("#posUserCombo").children("option[selected=selected]").attr("selected","");
						$("#posUserCombo").children("option[value="+$('#posUserFor').val()+"]").attr("selected","selected");
					}
				});	  

				$("input").keyup(function(e) {
					if (e.which == 13) {
						$("#btnSearchQuery").click();
					}
				}); 	
			    
		    }
		});
	
	</script>
</body>