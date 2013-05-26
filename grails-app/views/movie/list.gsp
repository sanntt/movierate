<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>

<body lang="en">

<g:render template="../layouts/movies_header"></g:render>

<!-- MAIN -->
<div id="main">
    <div class="wrapper">
        <!-- home-block -->
        <div class="home-block" >
            <h2 class="home-block-heading"><span>ULTIMAS PELICULAS</span></h2>
            <g:if test="${movieInstanceTotal > 0}">
                <div class="one-fifth-thumbs clearfix">

                    <g:each in="${movieInstanceList}" var="movie" status="i">
                        <g:if test="${((i+1) % 7) == 0}">
                            <figure class="last">
                        </g:if>
                        <g:else>
                            <figure>
                        </g:else>
                        <figcaption>
                            <strong>${movie.title}</strong>
                            <em>${movie.year}</em>
                            <g:link class="opener" controller="movie" action="show" id="${movie.id}"></g:link>
                        </figcaption>

                        <g:link class="thumb" controller="movie" action="show" id="${movie.id}"><img class="movie-poster" src="${movie.poster}" alt="Could not load poster"/></g:link>
                        </figure>
                    </g:each>
                </div>
            </g:if>
        </div>
        <!-- ENDS home-block -->



    </div>
</div>
<!-- ENDS MAIN -->


<footer>
    <div class="wrapperOnly">
        <div class="pagination">
            <g:paginate controller="movie" action="list" total="${movieInstanceTotal}"/>
        </div>

        <g:render template="../layouts/footer"></g:render>

    </div>
</footer>

</body>

</html>