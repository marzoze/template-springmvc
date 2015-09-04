<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:import url="/jsp/common/globalmessage.jsp" />
	<c:url value="/administration/groupform" var="group"/>
	<form:form method="GET" modelAttribute="group" action="${group}">
	
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-tag"></i>
	      		<h3>Administration / Group</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		
	  		<div class="widget-content">
	  		
	  			<table id="grid" width="50%"></table>
				<div id="pGrid"></div>
				
				<div class="form-actions">
			    	<button type="submit" id="newBtn" name="newBtn" class="btn btn-warning">&nbsp;<fmt:message key="btn.new" bundle="${com}" />&nbsp;</button>
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

		    	$("#grid").jqGrid({
					datatype: "json",
					url: postrackingcontextpath+"/administration/role/getGroup",
					colNames:['&nbsb;','GROUP NAME','DESCRIPTION',''],
					colModel:[
								{name:'secGroupId',index:'secGroupId', hidden: true},								
								{name:'shortdescription',index:'shortdescription', align:"left",sortable: true},
								{name:'longdescription',index:'longdescription', align:"left",sortable: true},
								{name:'edit',index:'edit',sortable: false, align:"center", width:'120px'}						
					],								
					gridComplete : function(){
						var ids = jQuery("#grid").jqGrid('getDataIDs');	
						var url;
						for ( var i = 0; i < ids.length; i++) {
							var id = ids[i];
							url = '<a href="_groupform?groupid='+id+'\" id=\"'+id+'\" title="Edit"><img src="${pageContext.request.contextPath}/images/edit.png" /></a>';
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
			  		sortname : 'secGroupId',
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

		    }
		});
	
	</script>

</body>