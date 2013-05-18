<%@ page import="com.codeon.movierate.group.UserGroup" %>



<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'movies', 'error')} ">
	<label for="movies">
		<g:message code="userGroup.movies.label" default="Movies" />
		
	</label>
	<g:select name="movies" from="${com.codeon.movierate.movie.Movie.list(sort:"title")}" multiple="multiple" optionKey="id" size="5" value="${userGroupInstance?.movies*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="userGroup.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${userGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'owner', 'error')}">
	<label for="owner">
		<g:message code="userGroup.owner.label" default="Owner" />
	</label>
    <span><g:fieldValue bean="${userGroupInstance}" field="owner"/></span>
</div>
<!--
<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="userGroup.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userGroupInstance?.users?}" var="u">
    <li><g:link controller="normalUser" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="normalUser" action="create" params="['userGroup.id': userGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'normalUser.label', default: 'NormalUser')])}</g:link>
</li>
</ul> -->

<div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'users', 'error')} ">
    <label for="normals">
        <g:message code="userGroup.users.label" default="Users" />
    </label>
    <g:select name="normalUsers" from="${com.codeon.movierate.user.User.list(sort:"username")}" multiple="multiple" optionKey="id" size="5" value="${userGroupInstance?.users*.user?.id}" class="many-to-many"/>
</div>



</div>

