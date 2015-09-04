<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:import url="/jsp/common/globalinfo.jsp" />
	<c:url value="/registrationbrc/transaction" var="transaction"/>
	<form:form method="POST" modelAttribute="transaction" id="transactionForm" action="${transaction}" enctype="multipart/form-data">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
		<form:hidden path="posTransactionId" id="posTransactionId" />
		<form:hidden path="posNumber" id="posNumber" />
		
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-share"></i>
	      		<h3><fmt:message key="lbl.Registration.header.registration" bundle="${com}" /></h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  		
	  			<c:import url="/jsp/pages/pos/posprogresstrackerbranch.jsp" />
	  		
	  			<div class="left_menu_box">
	  				<c:import url="/jsp/pages/pos/posregistrationmenulayoutbranch.jsp" />
	  			</div>
	  			
	  			<div class="content_box">
	  			
	  				<!-- ############################################################################################################################################# -->
	  				<!--  																																			   -->
	  				<!-- PANEL POS TRANSACTION 																												   		       -->
	  				<!--  																																			   -->
	  				<!-- ############################################################################################################################################# -->
	  			
	  				<div class="accordion">
	  				
	  					<div class="accordion-group accordion-heading">
	  					
	  						<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" href="#collapse1">
									<fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" />
								</a>
							</div>
							
							<div id="collapse1" class="accordion-body in collapse">
							
								<div class="accordion-inner">
									
									<div class="form-actions">
										<div class="control-group">
											<c:choose>
												<c:when test="${not empty posregistrationid}">
													<button type="button" class="btn btn-warning" id="btnPopUpPosTransactionType">
								  						<fmt:message key="btn.transactiontypelist" bundle="${com}" />
								  					</button>
												</c:when>											
												<c:when test="${not empty param.regid}">
													<button type="button" class="btn btn-warning" id="btnPopUpPosTransactionType">
								  						<fmt:message key="btn.transactiontypelist" bundle="${com}" />
								  					</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-warning" id="btnPopUpPosTransactionType" disabled="disabled">
								  						<fmt:message key="btn.transactiontypelist" bundle="${com}" />
								  					</button>
												</c:otherwise>
											</c:choose>
						  				</div>		    		
									</div>
									
									<div class="row-fluid">	  		
			  				  			
						  				<table id="gridPosTranTypeSelected"></table>
										<div id="pGridPosTranTypeSelected"></div>
										
										<p>&nbsp;</p>
							  			
						  			</div><!-- row-fluid -->												
									
								</div><!-- accordion-inner -->
	  					
	  						</div>
	  					
	  					</div>
	  					
	  				</div>
	  				
	  			</div>
	  			
	  			<div class="clearfix"></div>
	  			<div class="form-actions">  					
		    		<button type="submit" class="btn btn-warning" id="btnSavePosTransaction"><i class="icon-save"></i>&nbsp;<fmt:message key="btn.save" bundle="${com}" /></button>		    				    		
		      		<button type="button" class="btn btn-warning" id="btnSubmitPosRegistration" disabled="disabled"><i class="icon-ok-circle"></i>&nbsp;<fmt:message key="btn.submit" bundle="${com}" /></button>
				</div>
	  			 
	  		</div><!-- widget-content -->
	  		
		</div><!-- widget stacked -->
		  			
	</form:form>	

	<div id="dialogPosTransactionType">
	
		<div class="row-fluid">
						
			<div class="control-group">
				<label class="control-label" for="posTransactionTypeCode">
						<fmt:message key="lbl.Registration.form.POSTransactionTypeCode" bundle="${com}" />
					</label>
				<div class="controls">
		        	<input type="text" class="input-large" name="posTransactionTypeCode" id="posTransactionTypeCode" />					        	
		      	</div>	  				
	      		      	
			</div>							  					
		
			<div class="control-group">
				 <label class="control-label" for="posTransactionTypeDesc">
	  				<fmt:message key="lbl.Registration.form.POSTransactionTypeDesc" bundle="${com}" />
	  			</label>
				<div class="controls">
			        <input type="text" class="input-large" name="posTransactionTypeDesc" id="posTransactionTypeDesc" />					        	
			     </div>
			</div>						
		
			<div>		  				
	 			<button type="button" id="btnSearchPosTransactionType" name="btnSearchPosTransactionType" class="btn btn-warning">
	    			<i class="icon-search"></i>&nbsp;<fmt:message key="btn.search" bundle="${com}" />
	    		</button>	 
	    		<button type="button" id="btnShowAllPosTransactionType" name="btnShowAllPosTransactionType" class="btn btn-warning">
	    			<fmt:message key="btn.showall" bundle="${com}" />
	    		</button>     				
	   		</div> 
   		  		
   		</div>
   		<br />
   			
   		<div>	      				
    		<!-- Grid Pos Transaction Type -->
    		<table id="gridPosTransactionType" width="100%"></table>
			<div id="pGridPosTransactionType"></div>						
		</div>
		
		<br />	
    	<button type="button" id="btnProccesTransactionType" class="btn btn-warning">
    		<fmt:message key="btn.select" bundle="${com}" />
    	</button>
							
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
					Are you sure that you want to permanently delete the 		
					selected file ?
				</div>
			</div>				 
		</div>				
	</div><!-- dialogDeleteMessage -->
	
	<div id="dialogDocumentUpload">		
		<form:form method="POST" modelAttribute="posTransaction" id="registerFormDocUpload" action="${register}" enctype="multipart/form-data">
			<table id="fileTableDialogDocUpload">
				
		    </table>
		</form:form>
		<div id="result"></div>
	</div>
	
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
		    	postracking.autocomplete("posTransactionTypeCode",postrackingcontextpath + "/registrationbrc/getTranCodeAutoComplete");

		    	// Autocomplete tran desc
		    	postracking.autocomplete("posTransactionTypeDesc",postrackingcontextpath + "/registrationbrc/getTranDescAutoComplete");

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
								url:postrackingcontextpath+'/registrationbrc/deleteAttachment?attachId=' + selectedRows,	
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

		    	/*=============================== Begin JQGrid Pos Transaction Type ===========================*/	
		    	
		    	var idsOfSelectedRows = [];
		    	var updateIdsOfSelectedRows = function (id, isSelected) {			    	
		    		var index = $.inArray(id, idsOfSelectedRows);		    		
		            if (!isSelected && index >= 0) {
		                idsOfSelectedRows.splice(index, 1); // remove id from the list
		            } else if (index < 0) {			            
		                idsOfSelectedRows.push(id);
		            }
		    	};

		    	$("#gridPosTransactionType").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/registrationbrc/getPosTransactionType?posNumber=" + $('#posNumber').val(),
					colNames:['&nbsb;','POS No','Transaction Type',''],
					colModel:[		
								{name:'serviceId',index:'serviceId', hidden: true},																			
								{name:'posNumber',index:'posNumber', align:"center", sortable: true}, 
								{name:'description',index:'description', align:'left', width:'300px', sortable: false},	
								{name:'status',index:'status', align:'center', hidden: true}															
					],									
					gridComplete : function() {},									
			        onSelectAll: function (aRowids, status) {
			            var i, count, id;
			            for (i = 0, count = aRowids.length; i < count; i++) {
			                id = aRowids[i];
			                updateIdsOfSelectedRows(id, status);
			            }
			        },
			  		multiselect: true,
			  		rowNum: 50,
			  		//rowList: [ 10, 20, 30, 40, 50 ],
			  		pager: "#pGridPosTransactionType",
			  		pgbuttons: true,
			  		sortname: 'code',
			  		viewrecords: false,
			  		caption: "Result",
			  		sortorder: "desc",
			  		jsonReader: {
						repeatitems : false,
						id: 0
					},
					//scroll: true,
					scrollerbar:true,
					height: '200',
					widht: '100%',
					mtype: 'GET',		
					altRows: true,
					multiboxonly: true,
					//autowidth: true,		
					onSelectRow: function(rowId, status) {							
						if ($('.cbox:unchecked','#gridPosTransactionType').length == 0) {
							 $('#cb_grid').attr('checked',true);
							 updateIdsOfSelectedRows(rowId, status);
						} else {
							$('#cb_grid').attr('checked',false);
							updateIdsOfSelectedRows(rowId, status);	
						}
					},
					beforeSelectRow: function (rowid, e) {
						return $(e.target).is('input[type=checkbox]');
					},
					loadComplete : function(){
						// set gridPosTransactionType selected
						var $this = $(this);
						var transactionId = $('#posTransactionId').val();
						if (transactionId != '') {
							$.ajax({
								type:'POST',
								url:postrackingcontextpath+'/registrationbrc/getServiceSelected?transactionId=' + transactionId,
								success: function(data){																							
									var obj = data.services + '';
									var arr = obj.split(",");								
									for (var i = 0; i < arr.length; i++) {
										$this.jqGrid('setSelection', arr[i], false);
										idsOfSelectedRows.push(arr[i]);
									}		
								},
								failure:function(){
									alert("Error, Failed to store received date");
								},
								dataType:'json'
							});
						}	
						multiColor('gridPosTransactionType');					
					}	  			  				
				});
		    	
		    	/*=============================== End JQGrid Pos Transaction Type ===========================*/
		    	
		    	/*=============================== Begin JQGrid Pos Transaction Type Selected ===========================*/
		    	
		    	var idsOfSelectedRows_ = [];
	    		var arrayTranTypes = '';	    		
	    		if (arrayTranTypes != "") {	    			
	    			//arrayTranTypes = arrayTranTypes.substring(1, arrayTranTypes.length-1);	
			    	//arrayTranTypes = arrayTranTypes.replace(/ /g,"");	 
			    	var arrayTranTypesSplit = arrayTranTypes.split(",");
			    	for (var i = 0; i < arrayTranTypesSplit.length; i++) {		    		
				    	alert(arrayTranTypesSplit[i]);
			    		idsOfSelectedRows_.push(arrayTranTypesSplit[i]);
				    }
		    	}			    

		    	$("#gridPosTranTypeSelected").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/registrationbrc/proccesTransactionType?serviceId=" + idsOfSelectedRows_ +
									"&posNumber=" + $('#posNumber').val() +
									"&transactionId=" + $('#posTransactionId').val(),
					colNames:['&nbsb;','&nbsb;','&nbsb;','Pos No','Transaction No','Transaction Type','Registration Date','Received Date','Remark','&nbsp;&nbsp;Action&nbsp;&nbsp;',''],
					colModel:[		
								{name:'serviceId',index:'serviceId', hidden: true},
								{name:'posTransactionTypeId', index:'posTransactionTypeId', hidden: true},	
								{name:'code', index:'code', hidden: true},																		
								{name:'posNumber',index:'posNumber', align:"center", sortable: true, width:'100px'}, 
								{name:'transactionNumber',index:'transactionNumber', align:"center", sortable: true},	
								{name:'posTranTypeDesc',index:'posTranTypeDesc', align:"center", sortable: true, width:'150px'},							
								{name:'registrationDate',index:'registrationDate', align:'center', sorttype: 'date', formatter: 'date',	width:'150px',							 
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
		                        {name:'receivedDateStr',index:'receivedDateStr', align:'center', sortable: false, width:'120px'},
								{name:'remark',index:'remark', align:'center', sortable: false, width:'120px'},
								{name:'deleteBtn',index:'deleteBtn', align:'center', sortable: false, width:'80px'},
								{name:'transactionStatus',index:'transactionStatus', hidden: true}																													
					],								
					gridComplete: function() {
						var ids = jQuery("#gridPosTranTypeSelected").jqGrid('getDataIDs');						  							  			
			  			for ( var i = 0; i < ids.length; i++ ) {
			  				var rowData 			= $('#gridPosTranTypeSelected').jqGrid('getRowData',ids[i]);
			  				var rowNum 				= i + 1;
							var tranTypeNo 			= rowData['transactionNumber'];	
							var tranTypeNo4Del 		= rowData['transactionNumber'];								
							var remarkValue			= rowData['remark'];
							var receivedDateValue	= rowData['receivedDateStr'];
							var serviceId			= rowData['serviceId'];
							var status				= rowData['transactionStatus'];  	
							var rowDataAtFirstRow	= $('#gridPosTranTypeSelected').jqGrid('getRowData',ids[0]);	
							var statusAtFirstRow	= rowDataAtFirstRow['serviceId'];			
			  				var idTextarea 			= 'textareaRemark_' + ids[i] + '_' + tranTypeNo.replace(/\//g, '-');			
			  				var idReceivedDate		= 'receivedDate_' + ids[i] + '_' + tranTypeNo.replace(/\//g, '-');
			  				var idDeleteTranType	= 'btnDeleteTranType_' + serviceId + '_' + rowNum + '_' + tranTypeNo4Del.replace(/\//g, '-');
				  						  							  				
			  				var be1 = '<textarea rows="2" cols="12" id=\"'+idTextarea+'\" style="margin-top: 10px;">'+ remarkValue +'</textarea>';	
			  				var be2 = '<input type="text" class="input-small" name="receivedDate" id=\"'+idReceivedDate+'\" value=\"'+receivedDateValue+'\" />';			  				

			  				if (status == 'PENDING_AT_REGISTRATION'
				  				|| status == 'REGISTERED_BY_HO'
					  				|| status == 'CANCELLED'
						  				|| status == 'IN_PROGRESS'
							  				|| status == 'APPROVE'
								  				|| status == 'CLOSE'
									  				|| status == 'REJECT') {
			  					var be3 = '<input id=\"'+idDeleteTranType+'\" class="button-delete" type="button" title="Delete" disabled="disabled" value="&nbsp;&nbsp;&nbsp;&nbsp;" />';
			  				} else { 					  	
				  				var be3 = '<input id=\"'+idDeleteTranType+'\" class="button-delete" type="button" title="Deletein" value="&nbsp;&nbsp;&nbsp;&nbsp;" />';
			  				}
					  				  			  				
							$("#gridPosTranTypeSelected").jqGrid('setRowData', ids[i], {
								remark : be1,
								receivedDateStr : be2,
								deleteBtn : be3								
		  					});
							$('#' + idReceivedDate).datepicker({dateFormat: "dd/mm/yy"});	

							$('#' + idDeleteTranType).live('click',function(event) {	
								var btnId 		= $(this).attr('id').replace('btnDeleteTranType_','');
								var array 		= $(this).attr('id').split('_');							
								var serviceId 	= array[1];								
								var index 		= array[2];	
								var tranTypeNo 	= array[3];						
								var status 		= array[4];		
								
								if(statusAtFirstRow != '') index--;
								$.ajax({
									type:'POST',
									url:postrackingcontextpath + '/registrationbrc/deleteTransactionType?transactionTypeNo=' + tranTypeNo,																							
									success:function(data){
										if(data.result == '200'){
											/* Set gridPosTranTypeSelected */
											/*
											 * start from zero, 
											 * splice[0,1]: 
											 * 0 is integer that specifies at what position to add/remove items, 
											 *   Use negative values to specify the position from the end of the array
											 * 1 is the number of items to be removed. If set to 0, no items will be removed
											*/
											idsOfSelectedRows.splice(index, 1);
								    		$("#gridPosTranTypeSelected").setGridParam({
									    		url 			: postrackingcontextpath+"/registrationbrc/proccesTransactionType?serviceId=" + idsOfSelectedRows +
																		"&posNumber=" + $('#posNumber').val() +
																		"&policyNumber=" + $('#policyNumber').val()						
								    		});
								    		$("#gridPosTranTypeSelected").trigger("reloadGrid");

								    		/* Set gridPosTransactionType */
											$("#gridPosTransactionType").setGridParam({									    											    	
												loadComplete : function(){
													var $this = $(this), i, count;
											        for (i = 0, count = idsOfSelectedRows.length; i < count; i++) {
											            $this.jqGrid('setSelection', idsOfSelectedRows[i], false);
											        }
											        multiColor('gridPosTransactionType');
												}	
								    		});								    		
								    		$("#gridPosTransactionType").trigger("reloadGrid");								    												    									
										}
										if(data.result == '400'){
											alert("Internal error system, please contact Administrator");
										}		   										
									},
									failure:function(){
										alert("Error, Failed to delete document");
									},
									dataType:'json'
								});
							});

							$('#' + idTextarea).live('change',function(event){
								var textareaId = $(this).attr('id').replace('textareaRemark_','');	
								var array 	   = $(this).attr('id').split('_');
								var tranTypeNo = array[2];
								$.ajax({
									type:'POST',
									url:postrackingcontextpath+'/registrationbrc/onChangeRemark?tranTypeNo=' + tranTypeNo 
											+ '&remark=' + $('#textareaRemark_'+textareaId).val(),
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
							
							$('#' + idReceivedDate).live('change',function(event){								
								var receivedDateId 	= $(this).attr('id').replace('receivedDate_','');
								var array 	    	= $(this).attr('id').split('_');
								var tranTypeNo  	= array[2];
								$.ajax({
									type:'POST',
									url:postrackingcontextpath+'/registrationbrc/onChangeReceivedDate?tranTypeNo=' + tranTypeNo 
											+ '&receivedDate=' + $('#receivedDate_' + receivedDateId).val(),
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
							
							// Check apakah ada document yang sudah di upload, kalo ada expand subgrid related
							$.ajax({
								type:'POST',
								url:postrackingcontextpath+'/registrationbrc/checkUploadedDocument?tranTypeNo=' + tranTypeNo,
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
					subGrid : true,
					subGridOptions: {
				        "plusicon"  	: "ui-icon-triangle-1-e",
				        "minusicon" 	: "ui-icon-triangle-1-s",
				        "openicon"  	: "ui-icon-arrowreturn-1-e",
						"expandOnLoad" 	: true
					},
					subGridRowExpanded: function(subgrid_id, row_id) {
						var mainGrid = jQuery('#gridPosTranTypeSelected').jqGrid('getRowData', row_id);	
						var subgrid_table_id, pager_id;
						subgrid_table_id = subgrid_id+"_t";
						pager_id = "p_"+subgrid_table_id;
						$("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>");
						$("#"+subgrid_table_id).jqGrid({
							datatype: "json",
							url		: postrackingcontextpath+"/registrationbrc/findDocumentTransactionSubGrid?serviceId=" + row_id,
							colNames: ['Document Name','Is Uploaded','File','Action'],
							colModel: [
										{name:'documentDesc',index:'documentDesc',align:'center',sortable: false},
										{name:'uploaded',index:'uploaded',align:'center'},
										{name:'inputFile',index:'inputFile',sortable: false, width:'250px', align:"center"},
										{name:'upload',index:'upload',sortable: false, width:'160px', align:"center"}																													
							],
							gridComplete : function(){	
								multiColor(subgrid_table_id);
					  			var ids = jQuery('#'+subgrid_table_id).jqGrid('getDataIDs');						  							  			
					  			for ( var i = 0; i < ids.length; i++ ) {

					  				var formId = 'formUploadDoc_' + ids[i] + '_' + row_id;
					  				var inputFileId = 'uploadDocuments_' + ids[i] + '_' + row_id; 
					  				var buttonId = 'btnUpload_' + ids[i] + '_' + row_id;

					  				var be1 = '<form id=\"'+formId+'\" method="post" enctype="multipart/form-data" action="/postracking/registrationbrc/documentUpload">' +					  						  
				  					  '<input type="file" id=\"'+inputFileId+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>';			  						
			  						var be2 = '<input type="button" class="btn btn-warning" title="Upload" id=\"'+buttonId+'\" value="upload" />';
			  						var be3 = '<img src="${pageContext.request.contextPath}/images/unchecked.gif" />';						  		
					  						  				
									$('#'+subgrid_table_id).jqGrid('setRowData', ids[i], {
										inputFile : be1,
										upload : be2,
										uploaded : be3
				  					});	

									// Check, apakah ada document yang sudah di upload, kalo ada tampilkan document tersebut
									$.ajax({
										type:'POST',
										url:postrackingcontextpath+'/registrationbrc/checkUploadedDocumentSubGrid?tranTypeNo=' + mainGrid.transactionNumber 
													+ '&index=' + ids[i],
										success: function(data){
											if(data.result == '200'){	
												var paramDownloadDoc = 'posNumber=' + $('#posNumber').val() + '&tranNo=' + mainGrid.transactionNumber 
														+ '&fileIndex=' + data.fileIndex + '&fileName=' + data.fileName;
												var xButtonRemove = 'btnRemove_' + data.fileIndex + row_id;	
												var be1x = '<img src="${pageContext.request.contextPath}/images/checked.gif" />';
												var be2x = data.fileName;
										        var be3x = '<a href="' + postrackingcontextpath + '/registrationbrc/downloadAttachment?'+ paramDownloadDoc +'\" title="Download" id="linkDownload"><img src="${pageContext.request.contextPath}/images/download.png" /></a>' +
												          '&nbsp;<input type="button" class="button-delete" title="Delete" id=\"'+ xButtonRemove +'\" style="margin-top: 10px; margin-bottom: 10px;" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />';

												$('#'+subgrid_table_id).jqGrid('setRowData', data.fileIndex, {
													uploaded 	: be1x,
													inputFile 	: be2x,
													upload 		: be3x
							  					});	

											    /* If transaction submitted, disable all buttons */
													    if('${submitted}' === 'true')				    							    								    		
													    	$('input,textarea').attr("disabled", "disabled");

												$('#' + xButtonRemove).live('click',function(event){
													var splitId = $(this).attr('id').split('_');
													var btnId = $(this).attr('id').replace('btnUpload_','');
													btnId = btnId.substring(1);
													$.ajax({
														type:'POST',
														url:postrackingcontextpath + '/registrationbrc/deleteDocument?fileName=' + data.fileName 
																	+ '&fileIndex=' + splitId[1].substring(0,1) 
																	+ '&posNumber=' + $('#posNumber').val() 
																	+ '&tranNo=' + mainGrid.transactionNumber,																							
														success:function(data){
															if(data.result == '200'){										
																$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1].substring(0,1) - 1], {																
																		inputFile 	: '<form id=\"formUploadDoc_'+btnId+'_'+row_id+'\" method="post" enctype="multipart/form-data" action="/postracking/registrationbrc/documentUpload">' +					  						  
									  					  			  			  	  '<input type="file" id=\"uploadDocuments_'+btnId+'_'+row_id+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>',
									  					  			  	upload 		: '<input type="button" class="btn btn-warning" title="Upload" id=\"btnUpload_'+btnId+'_'+row_id+'\" value="upload" />',
																		uploaded 	: be3																	
											  					});			
																$("#gridPosTranTypeSelected").trigger("reloadGrid");							
															}
															if(data.result == '400'){
																alert("Error, Failed to remove document");
															}		   									
														},
														failure:function(){
															alert("Error, Failed to remove document");
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

									// upload the document
									$('#' + buttonId).live('click',function(event){			
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
												url:postrackingcontextpath + '/registrationbrc/documentUpload?posNumber=' + posNumber 
															+ '&documentDesc=' + documentDesc
															+ '&fileIndex=' + splitId[1] 
															+ '&tranNo=' + mainGrid.transactionNumber 
															+ '&serviceId=' + row_id,	
												data: data,			
												processData: false,
											    contentType: false,				
												success:function(data){
													if(data.result == '200'){ //upload sukses
														var paramDownloadDoc = 'posNumber=' + posNumber 
																+ '&tranNo=' + mainGrid.transactionNumber 
																+ '&fileIndex=' + splitId[1] 
																+ '&fileName=' + data.fileName;
														var be4 = '<img src="${pageContext.request.contextPath}/images/checked.gif" />';
														var be5 = data.fileName;
														var be6 = '<a href="downloadAttachment?'+paramDownloadDoc+'\" title="Download"><img src="${pageContext.request.contextPath}/images/download.png" /></a>' +
						                                  		  '&nbsp;<input type="button" class="button-delete" title="Delete" id=\"'+buttonRemove+'\" style="margin-top: 10px; margin-bottom: 10px;" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />';
														
														$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1] - 1], {
															uploaded 	: be4,
															inputFile 	: be5,
															upload 		: be6
									  					});			

													    /* If transaction submitted, disable all buttons */
													    if('${submitted}' === 'true')				    							    								    		
													    	$('input,textarea').attr("disabled", "disabled");								

														$('#' + buttonRemove).live('click',function(event){
															$.ajax({
																type:'POST',
																url:postrackingcontextpath + '/registrationbrc/deleteDocument?fileName=' + data.fileName 
																				+ '&fileIndex=' + splitId[1] 
																				+ '&posNumber=' + $('#posNumber').val() 
																				+ '&tranNo=' + mainGrid.transactionNumber,																							
																success:function(data){
																	if(data.result == '200'){										
																		$('#'+subgrid_table_id).jqGrid('setRowData', ids[splitId[1] - 1], {																
																			inputFile 	: '<form id=\"formUploadDoc_'+btnId+'\" method="post" enctype="multipart/form-data" action="/postracking/registrationbrc/documentUpload">' +					  						  
														  					  			  '<input type="file" id=\"uploadDocuments_'+btnId+'\" name="uploadDocuments[0]" style="margin-top: 10px;" /></form>',
																			upload 		: '<input type="button" class="btn btn-warning" title="Upload" id=\"btnUpload_'+btnId+'\" value="upload" />',
																			uploaded 	: be3																
													  					});										
																	}
																	if(data.result == '400'){
																		alert("Error, Failed to remove document");
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
														alert('Error, Failed to upload document');
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
							    if('${submitted}' === 'true')				    							    								    		
							    	$('input,textarea').attr("disabled", "disabled");
					  		},
							rowNum : 10,
					  		rowList : [ 10, 20, 30, 40, 50 ],
							height: 'auto',
							jsonReader: { repeatitems : false, }
						});
					},
					onSelectRow : function(rowId) {},
					loadComplete : function(){
						multiColor('gridPosTranTypeSelected');
					}	  			  				
				});
		    	
		    	/*=============================== End JQGrid Pos Transaction Type Selected ===========================*/
		    	
		    	/*=============================== Begin JQGrid Attachment ===========================*/
		    	
		    	$("#gridAttachment").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/registrationbrc/getAttachment?attachId=" + $('#attachId').val(),
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
						var ids = jQuery("#gridAttachment").jqGrid('getDataIDs');							 					
						var url;
						for ( var i = 0; i < ids.length; i++ ) {
							var rowData = $("#gridAttachment").jqGrid('getRowData',ids[i]);
							var colData = rowData['originalFilename'];
							var id = ids[i];	
							var param = "attachmentId=" + id + "&posNumber=" +$("#posNumber").val();		
							url = '<a href="registrationbrc/downloadAttachment?'+param+'\" class="btn btn-warning" style="color:white;">Download</a>'														
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
						if (selectedRows.length>0) {						
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
					loadComplete : function(){
						multiColor('gridAttachment');
					}	  			  				
				});

		    	/*=============================== End JQGrid Attachment ===========================*/
		    	
		    	$("#btnSearchPosTransactionType").click(function(e) {					    		    			    
		    		$("#gridPosTransactionType").setGridParam({
			    		url 			: postrackingcontextpath+"/registrationbrc/getPosTransactionType?tranDesc=" + $('#posTransactionTypeDesc').val() +
			    								"&posNumber=" + $('#posNumber').val() +
			    								"&policyNumber=" +  $('#policyNumber').val()
		    		});
		    		$("#gridPosTransactionType").trigger("reloadGrid");
		    	});

		    	$("#btnShowAllPosTransactionType").click(function(e) {				
		    		$("#gridPosTransactionType").setGridParam({
			    		url 			: postrackingcontextpath+"/registrationbrc/getPosTransactionType?posNumber=" + $('#posNumber').val(),
			    		gridComplete : function() {},									
				        onSelectAll: function (aRowids, status) {
				            var i, count, id;
				            for (i = 0, count = aRowids.length; i < count; i++) {
				                id = aRowids[i];
				                updateIdsOfSelectedRows(id, status);
				            }
				        },
				  		multiselect: true,
				  		rowNum: 50,
				  		pager: "#pGridPosTransactionType",
				  		pgbuttons: true,
				  		sortname: 'code',
				  		viewrecords: false,
				  		caption: "Result",
				  		sortorder: "desc",
				  		jsonReader: {
							repeatitems : false,
							id: 0
						},
						scrollerbar:true,
						height: '200',
						widht: '100%',
						mtype: 'GET',		
						altRows: true,
						multiboxonly: true,
						onSelectRow: function(rowId, status) {																					
								if ($('.cbox:unchecked','#gridPosTransactionType').length == 0) {
									 $('#cb_grid').attr('checked',true);
									 updateIdsOfSelectedRows(rowId, status);
								} else {
									$('#cb_grid').attr('checked',false);
									updateIdsOfSelectedRows(rowId, status);	
								}
						},
						beforeSelectRow: function (rowid, e) {
							return $(e.target).is('input[type=checkbox]');
						}
			    		
		    		});
		    		$("#gridPosTransactionType").trigger("reloadGrid",[{current:true}]);
		    	});
		    	
				/* Set gridPosTranTypeSelected */
		    	$("#btnProccesTransactionType").click(function(e) {
		    		$("#gridPosTranTypeSelected").setGridParam({
			    		url 			: postrackingcontextpath + "/registrationbrc/proccesTransactionType?serviceId=" + idsOfSelectedRows +
												"&posNumber=" + $('#posNumber').val() +
												"&policyNumber=" + $('#policyNumber').val()														
		    		});
		    		$('#dialogPosTransactionType').dialog("close");
		    		$("#gridPosTranTypeSelected").trigger("reloadGrid");
		    	});


		    	$("#deliveryToPos").loadOptions(postrackingcontextpath+"/registrationbrc/getEmployeePosDept",{
					afterLoaded:function(){												
						$("#deliveryToPos").children("option[selected=selected]").attr("selected","");
						$("#deliveryToPos").children("option[value="+ ${posTransaction.posTransactionType.deliveryToPos} +"]").attr("selected","selected");
					}
		    	});							
		    	
			    $("#btnPopUpPosTransactionType").click(function(){
			    	$('#dialogPosTransactionType').dialog("open");
			    });			    

		    	$("#btnPopUpPolis").click(function() {			    	
		    		$('#dialogPolicy').dialog('open');		    		
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

				$("#btnUploadedDocPopUp").click(function(e) {
					$('#dialogAttachment').dialog("open");
				});
	

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
									url:postrackingcontextpath+'/registrationbrc/deleteAttachment?attachId=' + selectedRows,	
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

		    	$("#btnSubmitPosRegistration").click(function() {
					$("#transactionForm").attr("action",postrackingcontextpath+"/registrationbrc/submit?page=2");
					$("#transactionForm").submit();	
				});

				$("#btnBacktoBranch").click(function() {
					$("#transactionForm").attr("action",postrackingcontextpath+"/registrationbrc/backtobranch?page=2");
					$("#transactionForm").submit();	
				});				

		    }
		});
			
	</script>
	
</body>