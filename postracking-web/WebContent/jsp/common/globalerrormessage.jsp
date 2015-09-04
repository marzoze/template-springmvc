<%@ include file="/jsp/common/taglibs.jsp"%>
<form:errors path="*">
	<div class="alignclear ui-state-error">
		<ul>
			<span class="ui-icon"></span>
			<form:errors path="*" />
		</ul>
	</div>
</form:errors>