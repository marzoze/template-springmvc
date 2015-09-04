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

	<c:url value="/reportlist" var="reportlist"/>
	<form:form method="post" modelAttribute="report" action="${reportlist}">
	
		<div id="content" class="widget stacked">
	
			<div class="widget-header">
	      		<i class="icon-book"></i>
	      		<h3>Report List</h3>
	  		</div> <!-- /widget-header -->
	  		
	  		<div class="widget-content">
				<c:forEach items="${menuGroup}" var="group">
					<b>${group}</b>
					<ul>
						<c:set var="urlVOs" value="${menuMap[group]}"/>
						<c:forEach items="${urlVOs}" var="urlVO">
							<li><a href="#" onclick="return popitup('${urlVO.url}')">${urlVO.reportName}</a></li>
						</c:forEach>
					</ul>
				</c:forEach>
			</div><!-- widget-content -->
		
		</div>
	
	</form:form>
	
	<script type="text/javascript">
	function popitup(url) {
		newwindow=window.open(url,'name','height=650,width=950,menubar=no,toolbar=no');
		if (window.focus) {newwindow.focus()}
		return false;
	}
	</script>
</body>