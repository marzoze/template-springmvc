<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/jsp/common/taglibs.jsp"%>
<body>

	<c:if test="${not empty message}">	
		<div class="alignclear ui-widget">
			<div class="alignclear ui-state-message">
				<ul>
					<span style="float: left; margin-right: 0.3em;" class="ui-icon ui-icon-info"></span><strong>${message}</strong>
				</ul>
			</div>
		</div>
	</c:if>
	
	<c:url value="/administration/department" var="department"/>
	<form:form method="post" modelAttribute="department" action="${department}">
	
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-tag"></i>
	      		<h3>Administration / Department</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		
	  		<div class="widget-content">
	  		
	  			<table id="grid"></table>
				<div id="pGrid"></div>
				
				<div class="form-actions">
			    	<button type="button" id="newBtn" name="newBtn" class="btn btn-warning">&nbsp;<fmt:message key="btn.new" bundle="${com}" />&nbsp;</button>
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
					url: postrackingcontextpath+"/administration/role/getDepartment",
					colNames:['&nbsb;','DEPARTMENT CODE','DEPARTMENT NAME'],
					colModel:[
								{name:'departmentId',index:'departmentId', hidden: true},								
								{name:'departmentCode',index:'departmentCode', align:"left",sortable: true},
								{name:'departmentName',index:'departmentName', align:"left",sortable: true}						
					],								
					gridComplete : function(){},			        
			  		multiselect: true,
			  		rowNum : 10,
			  		rowList : [ 10, 20, 30, 40, 50 ],
			  		pager : "#pGrid",
			  		pgbuttons: true,
			  		sortname : 'departmentId',
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