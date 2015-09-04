<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />	
	<c:url value="/administration/employeeform" var="employee"/>
	<form:form method="GET" modelAttribute="employee" action="${employee}">
		<c:import url="/jsp/common/globalerrormessage.jsp" />
	
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-tag"></i>
	      		<h3>Administration / Employee</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
	  		
	  			<!-- ############################################################################################################################################# -->
	  			<!--  																																			   -->
	  			<!-- PANEL SEARCH PARAMETER 																												   	   -->
	  			<!--  																																			   -->
	  			<!-- ############################################################################################################################################# -->
	  			
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
							  				<label class="control-label" for="userName">
							  					<fmt:message key="lbl.Administration.Employee.form.username" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="input-large" name="userName" id="userName" />
									      	</div>
							  			</div>
							  			
					  					<div class="control-group">
							  				<label class="control-label" for="name">
							  					<fmt:message key="lbl.Administration.Employee.form.name" bundle="${com}" />
							  				</label>
											<div class="controls">
									        	<input type="text" class="input-large" name="name" id="name" />
									      	</div>
							  			</div>			  			
					  					
					  				</div>
					  				
					  				<div class="span6">
					  				
					  					<div class="control-group">
							  				<label class="control-label" for="validateSelect">			  				
							  					<fmt:message key="lbl.Administration.Employee.form.branch" bundle="${com}" />
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
			    	<button type="button" id="btnSearchEmployee" name="btnSearchEmployee" class="btn btn-warning"><fmt:message key="btn.search" bundle="${com}" /></button>&nbsp;&nbsp;
			      	<button type="reset" id="btnCancelEmployee" name="btnCancelEmployee" class="btn"><fmt:message key="btn.cancel" bundle="${com}" /></button>
				</div>
	  		
	  			<table id="grid"></table>
				<div id="pGrid"></div>
				
				<div class="form-actions">
			    	<button type="button" id="newBtn" name="newBtn" disabled="disabled" class="btn btn-warning">&nbsp;<fmt:message key="btn.new" bundle="${com}" />&nbsp;</button>
			    	<button type="button" id="deleteBtn" name="deleteBtn" disabled="disabled" class="btn btn-danger">&nbsp;<fmt:message key="btn.delete" bundle="${com}" />&nbsp;</button>		      	
				</div>	
	  		
	  		</div><!-- /widget-content -->	
				
		</div><!-- /widget stacked -->
	
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

	  	    	$('#btnSearchEmployee').click(function(){
		    		$("#grid").setGridParam({
			    		url 			: postrackingcontextpath+"/administration/role/getEmployee?username=" + $('#userName').val() +
			    							"&name=" + $('#name').val() +
			    							"&branch=" + $('#branchCombo').val(),
			    		loadComplete	:function(){
			    			var ids = jQuery("#grid").jqGrid('getDataIDs');
							if(ids.length == ''){
								// do nothing
							}
			    		}
		    		});
		    		$("#grid").trigger("reloadGrid");
		  	    });
			    

		    	$("#grid").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/administration/role/getEmployee",
					colNames:['&nbsb;','EMPLOYEE CODE','FIRST NAME','LAST NAME','USERNAME','DEPARTMENT','BRANCH',''],
					colModel:[
								{name:'secUserId',index:'secUserId', hidden: true},								
								{name:'employee.employeeCode',index:'employee.employeeCode', align:"left",sortable: true},
								{name:'employee.firstName',index:'employee.firstName', align:"left",sortable: true},
								{name:'employee.lastName',index:'employee.lastName', align:"left",sortable: true},
								{name:'userName',index:'userName', align:"left",sortable: true},
								{name:'employee.department.departmentName',index:'employee.department.departmentName', align:"left",sortable: true},
								{name:'employee.branch.physicalLocation',index:'employee.branch.physicalLocation', align:"left",sortable: true},								
								{name:'edit',index:'edit',sortable: false, align:"center"}						
					],								
					gridComplete : function(){
						var ids = jQuery("#grid").jqGrid('getDataIDs');							 					
						var url;
						for ( var i = 0; i < ids.length; i++ ) {			  							  				
							var id = ids[i];	
							url = '<a href="employeeform?employeeid='+id+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
							var be = url;			  							  							  									  					  				
							$("#grid").jqGrid('setRowData', ids[i], {
								edit : be
		  					});								
			  			}
					},			        
			  		multiselect: true,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGrid",
			  		pgbuttons: true,
			  		sortname : 'secUserId',
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
					rownumbers: true,					
					loadComplete : function(){}	  			  				
				});


		    	$("#branchCombo").loadOptions(postrackingcontextpath+"/administration/getBranch",{
					afterLoaded:function(){
						$("#branchCombo").children("option[selected=selected]").attr("selected","");
						$("#branchCombo").children("option[value="+$('#branchFor').val()+"]").attr("selected","selected");
					}
				});

		    }
		});
	
	</script>

</body>