<!DOCTYPE html>
<html>
<head>
<title>Success | Cloud Foundry</title>
</head>
<body id="micro">
	<div class="content">
		<div>
			<div>
				<h2>Success</h2>

				<p>Your account login is working and you have authenticated.</p>

				<c:if test="${error!=null}">
					<div class="error" title="${error}">
						<p>But there was an error.</p>
					</div>
				</c:if>

				<h2>You are logged in.</h2>

				<p>
					<c:url value="/logout.do" var="url" />
					<a href="${fn:escapeXml(url)}">Logout</a> &nbsp;
				</p>

			</div>
		</div>
		<div title="Version: ${app.version}, Commit: ${commit_id}, Timestamp: ${timestamp}">
			Copyright &copy;
			<fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy" />
			Pivotal Software, Inc. All rights reserved.
		</div>
	</div>
</body>
</html>
