<%@ include file="/jsp/common/taglibs.jsp"%>
<div class="accordion">

	<div class="accordion-group accordion-heading">	
	
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" href="#collapseProgressTracker">
				<fmt:message key="lbl.Registration.header.ProgressTracker" bundle="${com}" />
			</a>
		</div>
		
		<div id="collapseProgressTracker" class="accordion-body in collapse">
		
			<div class="accordion-inner text-center">
	
				<div class="container-progres-tracker">
				
					<ol class="progress-meter">
						<c:choose>
							<c:when test="${not empty posregistrationid}">
								<li class="progress-point done"><i><fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" /></i></li>
							</c:when>
							<c:otherwise>
								<li class="progress-point todo"><i><fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" /></i></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty postransactionid}">
								<li class="progress-point done"><i><fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" /></i></li>
							</c:when>
							<c:otherwise>
								<li class="progress-point todo"><i><fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" /></i></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty posdocumentid}">
								<li class="progress-point done"><i><fmt:message key="lbl.Registration.header.posdocument" bundle="${com}" /></i></li>
							</c:when>
							<c:otherwise>
								<li class="progress-point todo"><i><fmt:message key="lbl.Registration.header.posdocument" bundle="${com}" /></i></li>
							</c:otherwise>							
						</c:choose>
						<c:choose>
							<c:when test="${submitted == 'true'}">
								<li class="progress-point done"><i><fmt:message key="btn.submit" bundle="${com}" /></i></li>
							</c:when>
							<c:otherwise>
								<li class="progress-point todo"><i><fmt:message key="btn.submit" bundle="${com}" /></i></li>
							</c:otherwise>
						</c:choose>
				  	</ol>
				  	
				</div> <!-- container-progres-tracker -->
		
			</div> <!-- accordion-inner text-center -->
		
		</div> <!-- accordion-body in collapse -->
		
	</div> <!-- accordion-group accordion-heading -->
	
</div> <!-- accordion -->