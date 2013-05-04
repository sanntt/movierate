
<%@ page import="com.codeon.movierate.group.UserGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userGroup.label', default: 'UserGroup')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'userGroup.name.label', default: 'Name')}" />
					
						<th><g:message code="userGroup.owner.label" default="Owner" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userGroupInstanceList}" status="i" var="userGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userGroupInstance.id}">${fieldValue(bean: userGroupInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: userGroupInstance, field: "owner")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>

            <g:each in="${userGroupAdmined}" var="admin">
                <g:link action="show" id="${admin.id}">${fieldValue(bean: admin, field: "name")}</g:link>
                    ${fieldValue(bean: admin, field: "owner")}
            </g:each>

            <g:each in="${userGroupModed}" var="mod">
                <g:link action="show" id="${mod.id}">${fieldValue(bean: mod, field: "name")}</g:link>
                ${fieldValue(bean: mod, field: "owner")}
            </g:each>

            <g:each in="${userGroupAsUser}" var="user">
                <g:link action="show" id="${user.id}">${fieldValue(bean: user, field: "name")}</g:link>
                ${fieldValue(bean: user, field: "owner")}
            </g:each>
			<div class="pagination">
				<g:paginate total="${userGroupInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
