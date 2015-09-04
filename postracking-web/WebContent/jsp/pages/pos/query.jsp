<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:if test="${not empty message}">	
		<div class="alignclear ui-widget">
			<div class="alignclear ui-state-message">
				<ul>
					<span  style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span><strong>${message}</strong>
				</ul>
			</div>
		</div>
	</c:if>

	<c:url value="/query" var="query"/>
	<form:form method="post" modelAttribute="user" action="${query}">
	
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-share"></i>
	      		<h3>POS / Inquiry</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  		
	  			<div class="accordion">
	  			
	  				<div class="accordion-group accordion-heading">
	  				
	  					<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
								Search Parameter	
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
							  					
							  			<!--  
							  			<div class="control-group">
							  				<label class="control-label" for="validateSelect">
							  					<fmt:message key="lbl.Query.form.TransactionType" bundle="${com}" />
							  				</label>
											<div class="controls">
							        			<select id="validateSelect" name="validateSelect">
									                <option value="" />Select One
									                <option value="1" />1
									                <option value="2" />2
									                <option value="3" />3
									                <option value="4" />4
									                <option value="5" />5
									             </select>
									      	</div>
							  			</div>	
							  			-->
							  			<div class="control-group">
							  				<label class="control-label" for="validateSelect">
							  					<fmt:message key="lbl.Query.form.Status" bundle="${com}" />
							  				</label>
											<div class="controls">
							        			<select id="statusQueryCombo" name="validateSelect"></select>
							        			<input type="hidden" id="statusQueryFor">
									      	</div>
							  			</div>  	
						  			
						  			</div><!-- span6 -->
						  			
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
									        	<input type="text" class="datefield" name="subDate" id="subDate" />
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
							  			  				
						  			
						  			</div>
					  			
					  			</div><!-- row-fluid -->
							
							
							</div>
						
						</div>
	  				
	  				</div>
	  			
	  			</div>
	  		
	  			<div class="form-actions">
			    	<button type="button" id="btnSearchQuery" name="btnSearchQuery" class="btn btn-warning"><i class="icon-search">&nbsp;</i><fmt:message key="btn.search" bundle="${com}" /></button>
			      	<button type="reset" id="btnCancelQuery" name="btnCancelQuery" class="btn"><i class="icon-chevron-left"></i>&nbsp;<fmt:message key="btn.cancel" bundle="${com}" /></button>
				</div>	
				
				
				<!---   Begin JQgrid Table & Paging --->	
				
				<table id="grid" width="100%" align="center"></table>
				<div id="pGrid"></div>
				
				<!---   End JQgrid Table & Paging  --->	
		
			 	<div class="form-actions">
			    	<button type="button" id="newBtn" name="newBtn" class="btn btn-warning"><i class="icon-file"></i>&nbsp;<fmt:message key="btn.new" bundle="${com}" />&nbsp;</button>
			    	<button type="button" id="deleteBtn" name="deleteBtn" disabled="disabled" class="btn btn-danger"><i class="icon-trash"></i>&nbsp;<fmt:message key="btn.delete" bundle="${com}" />&nbsp;</button>
			    	<button type="button" id="cancelBtn" name="cancelBtn" disabled="disabled" class="btn"><i class="icon-chevron-left"></i>&nbsp;<fmt:message key="btn.cancel" bundle="${com}" />&nbsp;</button>		      	
				</div>
			
			</div><!-- widget-content -->
		
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
		    					//var params = $("form", "#dialogMessage").serialize();
		    					$.ajax({
		    						type:'POST',
		    						url:postrackingcontextpath + '/query/delete?id=' + selectedRows,
		    						//data:params,
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
		    					//var params = $("form", "#dialogMessage").serialize();
		    					$.ajax({
		    						type:'POST',
		    						url:postrackingcontextpath + '/query/cancel?id=' + selectedRows,
		    						//data:params,
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
			    		url 			: postrackingcontextpath+"/query/getPosTransaction?policyNumber=" + $('#policyNumber').val() +
			    							"&subDate=" + $('#subDate').val() +
			    							"&posNumber=" + $('#posNumber').val() +
			    							"&policyHolder=" + $('#policyHolder').val() +
			    							"&branch=" + $('#branchCombo').val() +
			    							"&status=" + $('#statusQueryCombo').val(),
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
		  	    	$('#policyNumber').val("");
		  	    	$('#subDate').val("");
		  	    	$('#posNumber').val("");
		  	    	$('#policyHolder').val("");
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
					url: postrackingcontextpath+"/query/getPosTransaction",
					colNames:['&nbsb;','Pos No','Transaction No','Policy No','Transaction Type','Branch','Receive Date','Submision Date','Policy Holder','Doc Complete','Status',''],
					colModel:[
								{name:'posTranTypePosNumberId',index:'posTranTypePosNumberId', hidden: true, width:'100px'},								
								{name:'posTranTypePosNumber',index:'posTranTypePosNumber', align:"center",sortable: true}, 
								{name:'posTranTypeTransactionNumber',index:'posTranTypeTransactionNumber', align:"center",sortable: true},
								{name:'policyCode',index:'policyCode',align:"center", sortable: true, width:'120px'},
								{name:'posTranTypeDesc',index:'posTranTypeDesc',align:"center", sortable: true},
								{name:'branch',index:'branch',align:"center",sortable: false, width:'90px'},	
								/*								
								{name:'submissionDate',index:'submissionDate', sorttype: 'date', align:'center', formatter: 'date',
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
			                    */					
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
								{name:'submissionDate',index:'submissionDate', sorttype: 'date', align:'center', formatter: 'date',
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
								{name:'policyHolder',index:'policyHolder',align:"center",sortable: false},	
								{name:'documentComplete',index:'documentComplete',align:"center",sortable: false, width:'130px'},							
								{name:'status',index:'status',align:"center",sortable: false, width:'110px'},
								{name:'edit',index:'edit',sortable: false, align:"center", width:'120px'}								
					],								
					gridComplete : function(){
						
						var ids = jQuery("#grid").jqGrid('getDataIDs');							 					
						var url;			
						var img;			
						for ( var i = 0; i < ids.length; i++) {			  							  				
							var id = ids[i];
							var rowData = $('#grid').jqGrid('getRowData',ids[i]);
							var posNumber = rowData['posTranTypePosNumber'];
							var docComplete = rowData['documentComplete'];
							var status = rowData['status'];
															
							if(isBranch == 'true'){
								url = '<a href="register?postrantypeid='+id+'&posnumber='+posNumber+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
							}else{
								url = '<a href="registerho?postrantypeid='+id+'&posnumber='+posNumber+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
							}

							if(docComplete == '200'){
								img = "<img src='${pageContext.request.contextPath}/images/checked.gif' />";
							}
							if(docComplete == '400'){
								img = "<img src='${pageContext.request.contextPath}/images/unchecked.gif' />";
							}

							if(status == 'Cancelled'){
								url = '';
							}
							
							var be1 = url;
							var be2 = img;			  							  							  							  									  					  			
							$("#grid").jqGrid('setRowData', ids[i], {
								edit : be1,
								documentComplete : be2
		  					});								
			  			}					
			  			
			  		},
			        onSelectAll: function (aRowids, status) {				        
			            var i, count, id;
			            for (i = 0, count = aRowids.length; i < count; i++) {
			                id = aRowids[i];
			                updateIdsOfSelectedRows(id, status);
			            }			            
			            if(status == true){
			            	$('#deleteBtn').removeAttr('disabled');	
							$('#cancelBtn').removeAttr('disabled');
				        }else{
							$('#deleteBtn').attr('disabled','disabled');
							$('#cancelBtn').attr('disabled','disabled');
					    }
			        },
			  		multiselect: true,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGrid",
			  		pgbuttons: true,
			  		sortname : 'posNumberId',
			  		viewrecords : false,
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
						if(selectedRows.length>0) {				
							$('#deleteBtn').removeAttr('disabled');	
							$('#cancelBtn').removeAttr('disabled');														
							if($('.cbox:unchecked','#grid').length == 0){
								$('#cb_grid').attr('checked',true);
							}else{
								$('#cb_grid').attr('checked',false);
							}
						}else{
							$('#deleteBtn').attr('disabled','disabled');
							$('#cancelBtn').attr('disabled','disabled');
						}
						updateIdsOfSelectedRows(rowId, status);
					},
					loadComplete : function(){
						var $this = $(this), i, count;						
				        for (i = 0, count = idsOfSelectedRows.length; i < count; i++) {
				            $this.jqGrid('setSelection', idsOfSelectedRows[i], false);
				        }
				        $(this).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
				        $(this).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
					}	  			  				
				});	

		    	$("#statusQueryCombo").loadOptions(postrackingcontextpath+"/query/getStatus",{
					afterLoaded:function(){
						$("#statusQueryCombo").children("option[selected=selected]").attr("selected","");
						$("#statusQueryCombo").children("option[value="+$('#statusQueryFor').val()+"]").attr("selected","selected");
					}
				});

		    	$("#branchCombo").loadOptions(postrackingcontextpath+"/query/getBranch",{
					afterLoaded:function(){
						$("#branchCombo").children("option[selected=selected]").attr("selected","");
						$("#branchCombo").children("option[value="+$('#branchFor').val()+"]").attr("selected","selected");
					}
				});
		    	
		    	$("#newBtn").click(function(){			    		
					if(isBranch == 'true') window.location.href = 'register';
					else window.location.href = 'registerho';					
		    	});		  

				$("input").keyup(function(e) {
					if (e.which == 13) {
						$("#btnSearchQuery").click();
					}
				}); 
				
				if('${userRole}' == '2' || '${userRole}' == '1'){
					$("#deleteBtn").show();
					$("#cancelBtn").show();
				}else{
					$("#deleteBtn").hide();
					$("#cancelBtn").hide();
				} 	
			    
		    }
		});
	
	</script>
</body>