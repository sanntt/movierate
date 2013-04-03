<%@ page import="com.codeon.movierate.movie.Movie" %>



<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="movie.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${movieInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'actors', 'error')} ">
	<label for="actors">
		<g:message code="movie.actors.label" default="Actors" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'genres', 'error')} ">
	<label for="genres">
		<g:message code="movie.genres.label" default="Genres" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'directors', 'error')} ">
	<label for="directors">
		<g:message code="movie.directors.label" default="Directors" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'plot', 'error')} ">
	<label for="plot">
		<g:message code="movie.plot.label" default="Plot" />
		
	</label>
	<g:textField name="plot" value="${movieInstance?.plot}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'poster', 'error')} ">
	<label for="poster">
		<g:message code="movie.poster.label" default="Poster" />
		
	</label>
	<g:textField name="poster" value="${movieInstance?.poster}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: movieInstance, field: 'year', 'error')} required">
	<label for="year">
		<g:message code="movie.year.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="year" type="number" value="${movieInstance.year}" required=""/>
</div>

