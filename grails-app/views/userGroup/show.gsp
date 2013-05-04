<%@ page import="com.codeon.movierate.group.UserGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userGroup.label', default: 'UserGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userGroup">
			
				<g:if test="${userGroupInstance?.administrators}">
				<li class="fieldcontain">
					<span id="administrators-label" class="property-label"><g:message code="userGroup.administrators.label" default="Administrators" /></span>
					
						<g:each in="${userGroupInstance.administrators}" var="a">
						<span class="property-value" aria-labelledby="administrators-label"><g:link controller="administrator" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userGroupInstance?.moderators}">
				<li class="fieldcontain">
					<span id="moderators-label" class="property-label"><g:message code="userGroup.moderators.label" default="Moderators" /></span>
					
						<g:each in="${userGroupInstance.moderators}" var="m">
						<span class="property-value" aria-labelledby="moderators-label"><g:link controller="moderator" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userGroupInstance?.movies}">
				<li class="fieldcontain">
					<span id="movies-label" class="property-label"><g:message code="userGroup.movies.label" default="Movies" /></span>
					
						<g:each in="${userGroupInstance.movies}" var="m">
						<span class="property-value" aria-labelledby="movies-label"><g:link controller="movie" action="showMovieForGroup" id="${m.id}" params='[gId: "${userGroupInstance.id}"]'>${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="userGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userGroupInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="userGroup.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="user" action="show" id="${userGroupInstance?.owner?.id}">${userGroupInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userGroupInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="userGroup.users.label" default="Users" /></span>
					
						<g:each in="${userGroupInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="normalUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userGroupInstance?.id}" />
                <g:if test="${canEdit}">
                    <g:link class="edit" action="edit" id="${userGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                </g:if>

                <g:if test="${canDelete}">
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</g:if>
                </fieldset>
			</g:form>
		</div>
	</body>
</html>
