<%@ page import="com.codeon.movierate.movie.Actor" %>



<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="actor.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${actorInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="actor.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${actorInstance?.name}"/>
</div>

