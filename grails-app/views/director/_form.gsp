<%@ page import="com.codeon.movierate.movie.Director" %>



<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="director.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${directorInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="director.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${directorInstance?.name}"/>
</div>

