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
	
	<c:url value="/administration/workdays" var="workdays"/>
	<form:form method="post" modelAttribute="workdays" action="${workdays}">
	
		<div id="content" class="widget stacked">
		
			<div class="widget-header">
	      		<i class="icon-tag"></i>
	      		<h3>Administration / Working Calendar</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		
	  		<div class="widget-content">
	  			<div class="row-fluid">
	  				<div class="span6">
			  			<div class="control-group">
			  				<label class="control-label" for="month">
			  					<fmt:message key="lbl.Administration.form.month" bundle="${com}" />
			  				</label>
							<div class="controls">
					        	<input type="text" class="input-large" name="month" id="month" />
					      	</div>
			  			</div>
		  			</div><!-- span6 -->
	  			</div><!-- row-fluid -->
	  			
	  			<div class="form-actions">
			    	<button type="button" id="btnSearchQuery" name="btnSearchQuery" class="btn btn-warning"><fmt:message key="btn.search" bundle="${com}" /></button>
				</div>	
	  			
	  			<!---   Begin JQgrid Table & Paging --->
	  			<table id="grid"></table>
				<div id="pGrid"></div>
				<!---   End JQgrid Table & Paging  --->	
				
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
					url: postrackingcontextpath+"/administration/role/getWorkdays",
					colNames:['&nbsb;','SPECIAL DATE','DESCRIPTION','IS WORKDAY'],
					colModel:[
								{name:'recordId',index:'calendarId', hidden: true},								
								{name:'especialDay',index:'especialDay', align:"left",sortable: true},
								{name:'dateDesc',index:'dateDesc', align:"left",sortable: true}, 
								{name:'isWorkDay',index:'isWorkDay', align:"left",sortable: true}
					],								
					gridComplete: function(){},			        
			  		multiselect: true,
			  		rowNum: 10,
			  		rowList: [ 10, 20, 30, 40, 50 ],
			  		pager: "#pGrid",
			  		pgbuttons: true,
			  		sortname: 'especialDay',
			  		viewrecords: true,
			  		caption: "Result",
			  		sortorder: "desc",
			  		jsonReader: {
						repeatitems : false,
						id: 0
					},
					height : '100%',
					widht : '100%',
					mtype: 'GET',
					altRows: true,
					multiboxonly: true,
					rownumbers: true,
					autowidth: true,
					loadComplete : function(){}	  			  				
				});
				
		    	$('#btnSearchQuery').click(function(){
		    		$("#grid").setGridParam({
			    		url 			: postrackingcontextpath+"/administration/role/getWorkdays?year=" + $('#year').val() +
			    							"&month=" + $('#month').val(),
			    		loadComplete	:function(){
			    			var ids = jQuery("#grid").jqGrid('getDataIDs');
							if(ids.length == ''){
								// do nothing
							}
			    		}
		    		});
		    		$("#grid").trigger("reloadGrid");
		  	    });
		    }
		});
	
	</script>

</body>