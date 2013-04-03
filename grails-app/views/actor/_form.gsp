<%@ page import="com.codeon.movierate.movie.Actor" %>



<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="actor.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${actorInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="actor.movies.label" default="Movies" />
		
	</label>
	<g:select name="movies" from="${com.codeon.movierate.movie.Movie.list()}" multiple="multiple" optionKey="id" size="5" value="${actorInstance?.movies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="actor.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${actorInstance?.name}"/>
</div>

