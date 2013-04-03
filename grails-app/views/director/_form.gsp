<%@ page import="com.codeon.movierate.movie.Director" %>



<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="director.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${directorInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="director.movies.label" default="Movies" />
		
	</label>
	<g:select name="movies" from="${com.codeon.movierate.movie.Movie.list()}" multiple="multiple" optionKey="id" size="5" value="${directorInstance?.movies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: directorInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="director.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${directorInstance?.name}"/>
</div>

