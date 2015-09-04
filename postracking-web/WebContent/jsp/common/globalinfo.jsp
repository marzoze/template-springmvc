<%@ include file="/jsp/common/taglibs.jsp"%>
<c:if test="${not empty globalinfo}">	
	<div class="alignclear ui-widget">
		<div class="alignclear ui-state-info">
			<ul>
				<span class="ui-icon"></span>
				${globalinfo}
			</ul>
		</div>
	</div>
</c:if>