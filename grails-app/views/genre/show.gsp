
<%@ page import="com.codeon.movierate.movie.Genre" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'genre.label', default: 'Genre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-genre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAllGranted>
			</ul>
		</div>
		<div id="show-genre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list genre">
			
				<g:if test="${genreInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="genre.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${genreInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="${genreInstance?.id}" />
                        <g:link class="edit" action="edit" id="${genreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </sec:ifAllGranted>
		</div>
	</body>
</html>
