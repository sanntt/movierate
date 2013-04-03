<%@ page import="com.codeon.movierate.movie.Genre" %>



<div class="fieldcontain ${hasErrors(bean: genreInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="genre.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${genreInstance?.name}"/>
</div>

