<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/inquiry" var="inquiry"/>
	<form:form method="post" modelAttribute="user" id="inquiryForm" action="${inquiry}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
				<i class="icon-share"></i>
				<h3><fmt:message key="lbl.Query.header.Inquiry" bundle="${com}" /></h3>
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
								
									<div class="span6">
									
										<div class="control-group">
							  				<label class="control-label" for="name">
							  					<fmt:message key="lbl.Query.form.PolicyNumber" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="input-large" name="policyNumber" id="policyNumber" />
									      	</div>
							  			</div>
							  			
										<div class="control-group">
							  				<label class="control-label" for="name">			  				
							  					<fmt:message key="lbl.Query.form.PolicyHolder" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="input-large" name="policyHolder" id="policyHolder" />
									      	</div>
							  			</div>		
							  			
							  			<div class="control-group">
							  				<label class="control-label" for="validateSelect">
							  					<fmt:message key="lbl.Query.form.Status" bundle="${com}" />
							  				</label>
											<div class="controls">
							        			<select id="statusQueryCombo" name="validateSelect"></select>
							        			<input type="hidden" id="statusQueryFor">
									      	</div>
							  			</div> 						  	
							  			
									</div> <!-- /span6 -->
									
									<div class="span6">
									
							  			<div class="control-group">
							  				<label class="control-label" for="name">			  				
							  					<fmt:message key="lbl.Query.form.PosNumber" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="input-large" name="posNumber" id="posNumber" />
									      	</div>
							  			</div>  	
							  			
							  			<div class="control-group">
							  				<label class="control-label" for="name">
							  					<fmt:message key="lbl.Query.form.SubmissionDate" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="datefield" name="subDateBranch" id="subDateBranch" />
									      	</div>
							  			</div>
							  			
										<div class="control-group">
							  				<label class="control-label" for="validateSelect">			  				
							  					<fmt:message key="lbl.Query.form.Branch" bundle="${com}" />
							  				</label>
							  				<div class="controls">
							        			<select id="branchCombo" name="validateSelect"></select>
							        			<input type="hidden" id="branchFor">
									      	</div>
							  			</div>								  							
							  			
									</div> <!-- /span6 -->
								
								</div> <!-- /row-fluid -->
							
							</div> <!-- /accordion-inner -->
						
						</div> <!-- /accordion-body in collapse -->
					
					</div> <!-- /accordion-group accordion-heading -->
				
				</div> <!-- /accordion -->
				
	  			<div class="form-actions">
			    	<button type="button" id="btnSearchQuery" name="btnSearchQuery" class="btn btn-warning"><i class="icon-search">&nbsp;</i><fmt:message key="btn.search" bundle="${com}" /></button>
			      	<button type="reset" id="btnCancelQuery" name="btnCancelQuery" class="btn"><i class="icon-chevron-left"></i>&nbsp;<fmt:message key="btn.cancel" bundle="${com}" /></button>
				</div>			
				
				<!---   Begin JQgrid Table & Paging --->	
				
				<table id="grid" width="100%" align="center"></table>
				<div id="pGrid"></div>
				
				<!---   End JQgrid Table & Paging  --->	
				
				<br />
				
			 	<div class="form-actions">
			    	<button type="button" id="newBtn" name="newBtn" class="btn btn-warning"><i class="icon-file"></i>&nbsp;<fmt:message key="btn.new" bundle="${com}" />&nbsp;</button>
			    	<button type="button" id="deleteBtn" name="deleteBtn" disabled="disabled" class="btn btn-danger"><i class="icon-trash"></i>&nbsp;<fmt:message key="btn.delete" bundle="${com}" />&nbsp;</button>
			    	<button type="button" id="cancelBtn" name="cancelBtn" disabled="disabled" class="btn"><i class="icon-chevron-left"></i>&nbsp;<fmt:message key="btn.cancel" bundle="${com}" />&nbsp;</button>		      	
				</div>						
			
			</div> <!-- /widget-content -->
	 
		</div> <!-- /widget stacked -->
		
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

  	    	$('#btnSearchQuery').click(function(){
	    		$("#grid").setGridParam({
		    		url 			: postrackingcontextpath+"/inquiry/getTransaction?policyNumber=" + $('#policyNumber').val() +
		    							"&subDateBranch=" + $('#subDateBranch').val() +
		    							"&posNumber=" + $('#posNumber').val() +
		    							"&policyHolder=" + $('#policyHolder').val() +
		    							"&branch=" + $('#branchCombo').val() +
		    							"&status=" + $('#statusQueryCombo').val(),
		    		loadComplete	:function(){
		    			var ids = jQuery("#grid").jqGrid('getDataIDs');
						if(ids.length == ''){
							// to do
						}
		    		}
	    		});
	    		$("#grid").trigger("reloadGrid");
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
				url: postrackingcontextpath+"/inquiry/getTransaction",
				colNames:['&nbsb;','Pos No','Transaction No','Policy No','Transaction Type','Branch','Receive Date','Submission Date','Policy Holder','Doc Complete','Status','Close Date','Action'],
				colModel:[
							{name:'posTransactionTypeId',index:'posTransactionTypeId', hidden: true, width:'1px'},		
							{name:'posNumber',index:'posNumber', align:"center",sortable: true, width:'90px'}, 
							{name:'transactionNumber',index:'transactionNumber', align:"center",sortable: true},
							{name:'policyCode',index:'policyCode',align:"center", sortable: true, width:'100px'},
							{name:'posTranTypeDesc',index:'posTranTypeDesc',align:"center", sortable: true, width:'160px'},
							{name:'branch',index:'branch',align:"center",sortable: false, width:'90px'},	
							{name:'receivedDate',index:'receivedDate', sorttype: 'date', align:'center', formatter: 'date', width:'120px', 
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
							{name:'submissionDateByBranch',index:'submissionDateByBranch', sorttype: 'date', align:'center', formatter: 'date', width:'160px',
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
							{name:'policyHolder',index:'policyHolder',align:"center",sortable: false, width:'130px'},	
							{name:'documentComplete',index:'documentComplete',align:"center",sortable: false, width:'130px'},							
							{name:'transactionStatus',index:'transactionStatus',align:"center",sortable: false, width:'90px'},
							{name:'closeDate',index:'closeDate', sorttype: 'date', align:'center', formatter: 'date', width:'100px',
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
							{name:'edit',index:'edit',sortable: false, align:"center", width:'100px'}								
				],								
				gridComplete : function(){
					var ids = jQuery("#grid").jqGrid('getDataIDs');							 					
					var url, img, tranStatus;			
					for (var i = 0; i < ids.length; i++) {			  							  				
						var id = ids[i];
						var rowData = $('#grid').jqGrid('getRowData',ids[i]);
						var posNumber = rowData['posNumber'];
						var docComplete = rowData['documentComplete'];
						var status = rowData['transactionStatus'];
						var split = posNumber.split('/');

						if (isBranch == 'true')
							 url = '<a href="registrationbrc/policyinfo/edit?trantypeid='+id+'&edit=Y&posnumber='+split[0]+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
						else url = '<a href="registration/policyinfo/edit?trantypeid='+id+'&edit=Y&posnumber='+split[0]+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
						
						if (docComplete == '200') {
							img = "<img src='${pageContext.request.contextPath}/images/checked.gif' />";
						} else if(docComplete == '400'){
							img = "<img src='${pageContext.request.contextPath}/images/unchecked.gif' />";
						} else {
							img = null;
						}

						if (status == 'REGISTRATION_IN_PROGRESS') {
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
		            if (status == true) {
		            	$('#deleteBtn').removeAttr('disabled');	
						$('#cancelBtn').removeAttr('disabled');
			        } else {
						$('#deleteBtn').attr('disabled','disabled');
						$('#cancelBtn').attr('disabled','disabled');
				    }
		        },
				beforeSelectRow: function (rowid, e) {
					return $(e.target).is('input[type=checkbox]');
				},
		  		multiselect: true,
		  		rowNum : 10,
		  		rowList : [ 10, 20, 30, 40, 50 ],
		  		pager : "#pGrid",
		  		pgbuttons: true,
		  		sortname : 'posTransactionTypeId',
		  		viewrecords : true,
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
					if (selectedRows.length > 0) {				
						$('#deleteBtn').removeAttr('disabled');	
						$('#cancelBtn').removeAttr('disabled');														
						if($('.cbox:unchecked','#grid').length == 0)
							 $('#cb_grid').attr('checked',true);
						else $('#cb_grid').attr('checked',false);
					} else {
						$('#deleteBtn').attr('disabled','disabled');
						$('#cancelBtn').attr('disabled','disabled');
					}
					updateIdsOfSelectedRows(rowId, status);
				},
				loadComplete : function() {
					var $this = $(this), i, count;						
			        for (i = 0, count = idsOfSelectedRows.length; i < count; i++) {
			            $this.jqGrid('setSelection', idsOfSelectedRows[i], false);
			        }
			        multiColor('grid');
				}	  			  				
			});		    

	    	$("#deleteBtn").click(function(){	  	  	    	
	    		postracking.Msg.confirm("Confirmation","Are you sure want to delete the selected item(s) ?",{
   		              "No":function(){
   		            		postracking.Msg.closeDlg($(this));
   		              },
   		              "Yes":function(){         
	   		            	var selectedRows = $('#grid').getGridParam("selarrrow");
	    					$.ajax({
	    						type:'POST',
	    						url:postrackingcontextpath + '/inquiry/delete?transactiontypeid=' + selectedRows,
	    						success:function(data){			    						
		    						if(data.result == '200'){
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
	    						url:postrackingcontextpath + '/inquiry/cancel?transactiontypeid=' + selectedRows,
	    						success:function(data){			    						
		    						if(data.result == '200'){
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

	    	$("#statusQueryCombo").loadOptions(postrackingcontextpath+"/inquiry/getStatus",{
				afterLoaded:function(){
					$("#statusQueryCombo").children("option[selected=selected]").attr("selected","");
					$("#statusQueryCombo").children("option[value="+$('#statusQueryFor').val()+"]").attr("selected","selected");
				}
			});

	    	$("#branchCombo").loadOptions(postrackingcontextpath+"/inquiry/getBranch",{
				afterLoaded:function(){
					$("#branchCombo").children("option[selected=selected]").attr("selected","");
					$("#branchCombo").children("option[value="+$('#branchFor').val()+"]").attr("selected","selected");
				}
			});

	    	$("#newBtn").click(function(){			    		
				if(isBranch == 'true') window.location.href = 'registrationbrc';
				else window.location.href = 'registration';					
	    	});

			$("input").keyup(function(e) {
				if (e.which == 13) $("#btnSearchQuery").click();
			});

			if ('${userRole}' == '2' || '${userRole}' == '1') {
				$("#deleteBtn").show();
				$("#cancelBtn").show();
			} else {
				$("#deleteBtn").hide();
				$("#cancelBtn").hide();
			} 

	  	    $('#btnCancelQuery').click(function(){
	  	    	$('#policyNumber,#subDateHO,#posNumber,#policyHolder').val(null);
		  	});
		    
	    }
	});
		
	</script>
	
</body>