<%@ include file="/jsp/common/taglibs.jsp"%>
<c:if test="${not empty globalsave}">	
	<div class="alignclear ui-widget">
		<div class="alignclear ui-state-message">
			<ul>
				<span class="ui-icon"></span>
				${globalsave}
			</ul>
		</div>
	</div>
</c:if>