<%@ include file="/jsp/common/taglibs.jsp"%>
<div id="sidebar">
	<!-- ======================================================================================================================================================  -->
	<!-- SIDE MENUS  -->
	<!-- ======================================================================================================================================================  -->
	<div class="dropdown clearfix">
		<ul class="dropdown-menu" style="display: block; position: static; width: 196px">
			<c:choose>
				<c:when test="${not empty posregistrationid}">
					<li <c:if test="${sideMenuActive eq 'policyinfo'}">class="active"</c:if>><a href="<c:url value="/"/>registrationbrc/policyinfo?regid=${posregistrationid}"><strong><fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" /></strong></a></li>
				</c:when>
				<c:when test="${not empty param.regid}">
					<li <c:if test="${sideMenuActive eq 'policyinfo'}">class="active"</c:if>><a href="<c:url value="/"/>registrationbrc/policyinfo?regid=${posregistrationid}"><strong><fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" /></strong></a></li>
				</c:when>				
				<c:otherwise>
					<li <c:if test="${sideMenuActive eq 'policyinfo'}">class="active"</c:if>><a href="<c:url value="/"/>registrationbrc/policyinfo"><strong><fmt:message key="lbl.Registration.header.policyinfo" bundle="${com}" /></strong></a></li>
				</c:otherwise>
			</c:choose>				
			<li class="divider"></li>
			<c:choose>
				<c:when test="${not empty posregistrationid}">
					<li <c:if test="${sideMenuActive eq 'postransaction'}">class="active"</c:if>><a href="<c:url value="/"/>registrationbrc/postransaction?regid=${posregistrationid}"><strong><fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" /></strong></a></li>
				</c:when>
				<c:when test="${not empty param.regid}">
					<li <c:if test="${sideMenuActive eq 'postransaction'}">class="active"</c:if>><a href="<c:url value="/"/>registrationbrc/postransaction?regid=${posregistrationid}"><strong><fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" /></strong></a></li>
				</c:when>				
				<c:otherwise>
					<li <c:if test="${sideMenuActive eq 'postransaction'}">class="active"</c:if>><a href="javascript: alert('Please Complete Previous Step ')"><strong><fmt:message key="lbl.Registration.header.postransaction" bundle="${com}" /></strong></a></li>
				</c:otherwise>
			</c:choose>			
		</ul>
	</div>
	
	<p>&nbsp;</p>
	
	<!-- ======================================================================================================================================================  -->
	<!-- PANEL CURRENT STATUS  -->
	<!-- ======================================================================================================================================================  -->
	<div class="current-status-sidebar">
	
		<div class="accordion">
		
			<div class="accordion-group accordion-heading">
			
		  		<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" href="#collapseRegistrationStatus">
						<fmt:message key="lbl.Registration.header.RegistrationStatus" bundle="${com}" />
					</a>
				</div>
				
				<div id="#collapseRegistrationStatus" class="accordion-body in collapse">
				
					<div class="accordion-inner">
						<p align="center" id="registrationStatus">--</p>
					</div>
				
				</div>
			
			</div> <!-- accordion-group accordion-heading -->
		
		</div> <!-- accordion -->
		
		<div class="accordion">
		
			<div class="accordion-group accordion-heading">
			
		  		<div class="accordion-heading">
					<a class="accordion-toggle" data-toggle="collapse" href="#collapseTransactionStatus">
						<fmt:message key="lbl.Registration.header.TransactionStatus" bundle="${com}" />
					</a>
				</div>
				
				<div id="#collapseTransactionStatus" class="accordion-body in collapse">
				
					<div class="accordion-inner">
						<p align="center" id="transactionStatus">--</p>
					</div>
				
				</div>
			
			</div> <!-- accordion-group accordion-heading -->
		
		</div> <!-- accordion -->		
	
	</div> <!-- current-status-sidebar -->
	
</div> <!-- sidebar -->

<script>

$('document').ready(function(){	

	// validate submit button 
	var readytosubmit = '${readytosubmit}';	
	var documentcomplete = '${documentcomplete}';
	if (readytosubmit === 'true' && documentcomplete === 'true') {
		$('#btnSubmitPosRegistration').removeAttr('disabled');
	}

	var submitted = '${submitted}';
	if (submitted === 'true') {
		$("#content")
			.find("input, textarea, button, select, submit").attr('disabled','disabled');
	}

	var postransactionid = '${postransactionid}';
	// check registration status
	$.ajax({
		type:'POST',
		url:postrackingcontextpath+'/registrationbrc/getRegistrationStatus?postransactionid=' + postransactionid,
		success: function(data){	
			$('#registrationStatus').text('');	
			var registrationStatus = data.registrationStatus; 
			var status;
			for (var key in registrationStatus) {			
				if (registrationStatus[key] == 'P') {
					status = 'In Progress';
				} else if (registrationStatus[key] == 'S') {
					status = 'Submitted by Branch';
				} else if (registrationStatus[key] == 'H') {
					status = 'Submitted by HO';
				} else {
					status = 'In Progress';
				}
				$('#registrationStatus').append('<p align="center" id="registrationStatus">' + key + ' : ' + status +'</p>');
			}							
		},
		failure:function(){
			alert("Error, Failed to get registration status");
		},
		dataType:'json'
	});	

	// check transaction status
	$.ajax({
		type:'POST',
		url:postrackingcontextpath+'/registrationbrc/getTransactionStatus?postransactionid=' + postransactionid,
		success: function(data) {
			$('#transactionStatus').text('');	
			var transactionStatus = data.transactionStatus; 				
			for (var key in transactionStatus) {
				$('#transactionStatus').append('<p align="center" id="transactionStatus">' + key + ' : ' + transactionStatus[key] +'</p>');
			}						
		},
		failure:function(){
			alert("Error, Failed to get transaction status");
		},
		dataType:'json'
	});

});

</script>