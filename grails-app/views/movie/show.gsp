
<%@ page import="com.codeon.movierate.movie.Movie" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'movie.label', default: 'Movie')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
        <style>
            /* 'star-rating' component */
        .starRate {position:relative; margin:20px; overflow:hidden; zoom:1;}
        .starRate ul {width:160px; margin:0; padding:0;}
        .starRate li {display:inline; list-style:none;}
        .starRate a, .starRate b {background:url(${resource(dir: 'images', file: 'star_rate.gif')}) left top repeat-x;}
        .starRate a {float:right; margin:0 80px 0 -144px; width:80px; height:16px; background-position:left 16px; color:#000; text-decoration:none;}
        .starRate a:hover {background-position:left -32px;}
        .starRate b {position:absolute; z-index:-1; width:80px; height:16px; background-position:left -16px;}
        .starRate div b {left:0px; bottom:0px; background-position:left top;}
        .starRate a span {position:absolute; left:-300px;}
        .starRate a:hover span {left:90px; width:100%;}

        </style>
	</head>
	<body>
		<a href="#show-movie" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <sec:ifAllGranted roles="ROLE_ADMIN">
				    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                </sec:ifAllGranted>
			</ul>
		</div>
		<div id="show-movie" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list movie">
			
				<g:if test="${movieInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="movie.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${movieInstance}" field="title"/></span>
					
				</li>
				</g:if>

				<g:if test="${movieInstance?.actors}">
				<li class="fieldcontain">
					<span id="actors-label" class="property-label"><g:message code="movie.actors.label" default="Actors" /></span>
					
						<g:each in="${movieInstance.actors}" var="a">
						<span class="property-value" aria-labelledby="actors-label"><g:link controller="actor" action="show" id="${a.id}">${a}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.genres}">
				<li class="fieldcontain">
					<span id="genres-label" class="property-label"><g:message code="movie.genres.label" default="Genres" /></span>
					
						<g:each in="${movieInstance.genres}" var="g">
						<span class="property-value" aria-labelledby="genres-label"><g:link controller="genre" action="show" id="${g.id}">${g}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

				<g:if test="${movieInstance?.directors}">
				<li class="fieldcontain">
					<span id="directors-label" class="property-label"><g:message code="movie.directors.label" default="Directors" /></span>
					
						<g:each in="${movieInstance.directors}" var="d">
						<span class="property-value" aria-labelledby="directors-label"><g:link controller="director" action="show" id="${d.id}">${d}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.plot}">
				<li class="fieldcontain">
					<span id="plot-label" class="property-label"><g:message code="movie.plot.label" default="Plot" /></span>
					
						<span class="property-value" aria-labelledby="plot-label"><g:fieldValue bean="${movieInstance}" field="plot"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.poster}">
				<li class="fieldcontain">
					<span id="poster-label" class="property-label"><g:message code="movie.poster.label" default="Poster" /></span>
					
						<span class="property-value" aria-labelledby="poster-label"><g:fieldValue bean="${movieInstance}" field="poster"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${movieInstance?.year}">
				<li class="fieldcontain">
					<span id="year-label" class="property-label"><g:message code="movie.year.label" default="Year" /></span>
					
						<span class="property-value" aria-labelledby="year-label"><g:fieldValue bean="${movieInstance}" field="year"/></span>
					
				</li>
				</g:if>

                <g:if test="${gId != null}">
                <g:form method="post" >
                    <g:hiddenField name="id" value="${movieInstance?.id}" />
                    <g:hiddenField name="gId" value="${gId}" />
                    <fieldset class="form">

                            <li class="fieldcontain">
                                <span id="comment-label" class="property-label"><g:message code="movie.comment.label" default="Comment" /></span>

                                <span class="property-value" aria-labelledby="comment-label"><g:textField name="comment" value=""/></span>

                            </li>

                    </fieldset>
                    <fieldset class="buttons">
                        <g:actionSubmit class="save" action="comment" value="${message(code: 'default.button.comment.label', default: 'Comment')}" />
                        <g:actionSubmit class="save" action="rate" value="${message(code: 'default.button.rate.label', default: 'Rate')}" />
                    </fieldset>
                    <div class="starRate">
                        <g:radio name="rating" value="1"/>
                        <g:radio name="rating" value="2"/>
                        <g:radio name="rating" value="3"/>
                        <g:radio name="rating" value="4"/>
                        <g:radio name="rating" value="5"/>
                    </div>


                </g:form>
                    ${ratings}
                </g:if>



            </ol>
            <sec:ifAllGranted roles="ROLE_ADMIN">
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="${movieInstance?.id}" />
                        <g:link class="edit" action="edit" id="${movieInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </sec:ifAllGranted>

            <g:each in="${comments?}" var="comment">
                <li>${comment.toString()}



                </li>
            </g:each>
		</div>
	</body>
</html>
