<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>

<body lang="en">

<g:render template="../layouts/group_header"></g:render>

<!-- MAIN -->
<div id="main">
    <div class="wrapper">
        <!-- home-block -->
        <div class="home-block group">
            <h2 class="home-block-heading"><span>${userGroupInstance.name.toUpperCase()}</span></h2>

            <div id="users" class="margin-bottom">
                <h3>Usuarios</h3>
                <div class="group-user">
                    <a href="#">${userGroupInstance.owner}</a>
                </div>
                <g:each in="${userGroupInstance.administrators}" var="admin">
                    <div class="group-user">
                        <a href="#">${admin}</a>
                    </div>
                </g:each>
                <g:each in="${userGroupInstance.moderators}" var="mod">
                    <div class="group-user">
                        <a href="#">${mod}</a>
                    </div>
                </g:each>
                <g:each in="${userGroupInstance.users}" var="user">
                    <div class="group-user">
                        <a href="#">${user}</a>
                    </div>
                </g:each>
                <div class="clearfix"></div>
            </div>

            <div id="movies">

                <h3 class="margin-bottom">Peliculas</h3>

                <g:if test="${userGroupInstance?.movies.size() > 0}">
                <div class="one-fifth-thumbs clearfix">

                    <g:each in="${userGroupInstance.movies}" var="movie" status="i">
                        <g:if test="${((i+1) % 7) == 0}">
                            <figure class="last">
                        </g:if>
                        <g:else>
                            <figure>
                        </g:else>
                            <figcaption>
                                <strong>${movie.title}</strong>
                                <em>${movie.year}</em>
                                <g:link class="opener" controller="movie" action="showMovieForGroup" id="${movie.id}" params='[gId: "${userGroupInstance.id}"]'></g:link>
                            </figcaption>

                            <g:link class="thumb" controller="movie" action="showMovieForGroup" id="${movie.id}" params='[gId: "${userGroupInstance.id}"]'><img class="movie-poster" src="${movie.poster}" alt="Alt text"/></g:link>
                        </figure>
                    </g:each>
                </div>
                </g:if>
            </div>
        </div>
        <!-- ENDS home-block -->

    </div>
</div>
<!-- ENDS MAIN -->


<footer>
    <div class="wrapperOnly">

        <div class="wrapper">
            <g:form name="normalForm">

                <fieldset class="form">
                    <g:actionSubmit class="normalButton" action="abandon" value="${message(code: 'default.button.abandon.label', default: 'Abandonar')}" onclick="return confirm('${message(code: 'default.button.abandon.confirm.message', default: 'Esta seguro que desea abandonar el grupo?')}');" />

                    <g:if test="${canDelete && users.size() > 0}">
                        <g:select name='new_owner' noSelection="${['0':'Nuevo owner']}" from='${users}' optionKey="id" id="new-owner"></g:select>
                    </g:if>
                    <g:hiddenField name="id" value="${userGroupInstance?.id}" />

                    <g:if test="${canEdit}">
                        <g:link class="normalButton" action="edit" id="${userGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    </g:if>

                    <g:if test="${canDelete}">
                        <g:actionSubmit class="normalButton" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </g:if>
                </fieldset>
            </g:form>
        </div>

        <g:render template="../layouts/footer"></g:render>

    </div>
</footer>

</body>
	
</html>