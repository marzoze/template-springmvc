	 <%@ include file="/jsp/common/taglibs.jsp"%>
	 <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	 <div class="navbar navbar-inverse navbar-fixed-top">
	 
	 	<div class="navbar-inner">
	 	
	 		<div class="container">
	 		
	 			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><i class="icon-cog"></i></a>
	 			<b><a class="brand" href="dashboard">POS Tracking<sup>2.2</sup></a></b>
	 			
	 			<div class="nav-collapse collapse">
	 			
	 				<ul class="nav pull-right">
	 				
	 					<!-- Setting Panel  -->
	 					<li class="dropdown">
	 					
		 					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-cog"></i>
								Settings
								<b class="caret"></b>
							</a>
							
							<ul class="dropdown-menu">
								<li><a href="javascript:;">Account Settings</a></li>
								<li><a href="javascript:;">Privacy Settings</a></li>
								<li class="divider"></li>
								<li><a href="javascript:;">Help</a></li>
							</ul>							
	 					
	 					</li>
	 					
	 					<!-- User Panel -->
	 					<li class="dropdown">
	 						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="icon-user"></i> 
									<c:if test="${not empty sessionScope.user}">
										${sessionScope.userName}
									</c:if>
								<b class="caret"></b>
							</a>
							
							<ul class="dropdown-menu">
								<li><a href="javascript:;">My Profile</a></li>
								<li><a href="javascript:;">My Groups</a></li>
								<!--  
								<li class="divider"></li>
								<li><a href="javascript:;">Logout</a></li>
								-->
							</ul>							
							
	 					</li>	 					
	 				
	 				</ul>
	 				
	 				<!-- Search Panel -->
	 				<!-- <input type="text" class="search-query" placeholder="Search" /> -->
	 			
	 			</div><!--/.nav-collapse -->
	 						
	 		</div><!-- /container -->
	 		
	 	</div><!-- /navbar-inner -->
	 	
	 </div><!-- /navbar -->
	 
	 
	 <!----------------------------------------------------------------------------------------------------------------------
	 	 
	 				NAVIGATON begin here, contains : all menus
	 				 	 
	 ----------------------------------------------------------------------------------------------------------------------->
	 
	 
	 <div class="subnavbar">
	 	
	 	<div class="subnavbar-inner">
	 		
	 		<div class="container">
	 			
	 			<a class="btn-subnavbar collapsed" data-toggle="collapse" data-target=".subnav-collapse">
					<i class="icon-reorder"></i>
				</a>
				
				<div class="subnav-collapse collapse">
				
					<ul class="mainnav">
					
						
						<c:forEach items="${sessionScope.right}" var="right">
						
							<li <c:choose>
							
									<c:when test="${menuActive eq right.rigName}">
									
										<c:if test="${right.rigType eq '0'}">
											class="active"
										</c:if>
										<c:if test="${right.rigType eq '1'}">
											class="dropdown active"
										</c:if>
										
									</c:when>
									
									<c:otherwise>
									
										<c:if test="${right.rigType eq '0'}">
											class=""
										</c:if>
										<c:if test="${right.rigType eq '1'}">
											class="dropdown"
										</c:if>
										
									</c:otherwise>
									
								</c:choose> >
							
								<c:choose>
								
									<c:when test="${right.rigType eq '0'}">
									
										<a href="${contextPath}/${right.rigName}">
											<i class="${right.icon}"></i>
											<span>
												${right.rigNameMnu}									
											</span>
										</a>
										
									</c:when>
									
									<c:otherwise>
									
										<c:choose>
										
											<c:when test="${right.rigType eq '1'}">
											
												<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
													<i class="${right.icon}"></i>
													<span>
														${right.rigNameMnu}	
													</span>
													<b class="caret"></b>
												</a>	 
												
											</c:when>
											
										</c:choose>
										
										<c:if test="${ right.rigName eq 'pos' }">
											<ul class="dropdown-menu">
												<li><a href="${contextPath}/inquiry">Inquiry</a></li>
												<c:choose>
													<c:when test="${sessionScope.isBranch eq 'true'}">
														<li><a href="${contextPath}/registrationbrc">Registration</a></li>
													</c:when>
													<c:otherwise>
														<li><a href="${contextPath}/registration">Registration</a></li>
														<li><a href="${contextPath}/processinquiry">Process</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</c:if>										
										
										<c:if test="${ right.rigName eq 'administration' }">
											<ul class="dropdown-menu">
												<li><a href="${contextPath}/administration/role"><fmt:message key="lbl.Administration.submenu.title.Role" bundle="${com}" /></a></li>
												<li><a href="${contextPath}/administration/group"><fmt:message key="lbl.Administration.submenu.title.Group" bundle="${com}" /></a></li>
												<li><a href="${contextPath}/administration/department"><fmt:message key="lbl.Administration.submenu.title.Department" bundle="${com}" /></a></li>
												<li><a href="${contextPath}/administration/employee"><fmt:message key="lbl.Administration.submenu.title.Employee" bundle="${com}" /></a></li>
												<li><a href="${contextPath}/administration/workdays"><fmt:message key="lbl.Administration.submenu.title.WorkingCalendar" bundle="${com}" /></a></li>								
											</ul>
										</c:if>
										
									</c:otherwise>
									
								</c:choose>
								
							</li>
						
						</c:forEach>
					
					</ul>
				
				</div><!-- /.subnav-collapse -->
	 			
	 		</div><!-- /container -->
	 		
	 	</div><!-- /subnavbar-inner -->
	 		 
	 </div><!-- /subnavbar -->