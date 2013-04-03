<%@ page import="com.codeon.movierate.movie.Genre" %>



<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="genre.movies.label" default="Movies" />
		
	</label>
	<g:select name="movies" from="${com.codeon.movierate.movie.Movie.list()}" multiple="multiple" optionKey="id" size="5" value="${genreInstance?.movies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="genre.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${genreInstance?.name}"/>
</div>

