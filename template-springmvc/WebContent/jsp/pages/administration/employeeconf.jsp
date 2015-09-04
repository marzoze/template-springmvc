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
	
	<c:url value="/register" var="register"/>
	<form:form method="POST" modelAttribute="posTransaction" id="registerForm" action="${register}">
	
	</form:form>

</body>