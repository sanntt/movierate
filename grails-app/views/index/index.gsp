<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>

<body lang="en">

<g:render template="../layouts/index_header"></g:render>

<!-- MAIN -->
<div id="main">
    <div class="wrapper">

        <!-- slider holder -->
        <div id="slider-holder" class="clearfix">

            <!-- slider -->
            <div class="flexslider home-slider">
                <ul class="slides">
                    <li>
                        <g:img dir="img/slides" file="4091.jpg" alt="Ralph el Demoledor"/>
                        <p class="flex-caption">Ralph el Demoledor (2012)</p>
                    </li>
                    <li>
                        <g:img dir="img/slides" file="3081.jpg" alt="El gato con botas"/>
                        <p class="flex-caption">El gato con botas (2011)</p>
                    </li>
                    <li>
                        <g:img dir="img/slides" file="3001.jpg" alt="Sherlock Holmes"/>
                        <p class="flex-caption">Sherlock Holmes (2009)</p>
                    </li>
                </ul>
            </div>
            <!-- ENDS slider -->

            <div class="home-slider-clearfix "></div>

            <!-- Headline -->
            <div id="headline">

                <sec:ifNotLoggedIn>
                <form id="loginForm" action="${postUrl}" method="post">
                    <h2 class="heading">INGRESAR</h2>
                    <fieldset>
                        <div>
                            <input name="j_username" id="username" type="text" class="form-poshytip" title="Ingrese su usuario" placeholder="Usuario"/>
                        </div>
                        <div>
                            <input name="j_password" id="password" type="password" class="form-poshytip" title="Ingrese su contrase&ntilde;a" placeholder="Contrase&ntilde;a" />
                        </div>

                        <p><input type="submit" value="Ingresar" name="submit" id="submit" /></p>
                    </fieldset>

                </form>
                </sec:ifNotLoggedIn>


                <em id="corner"></em>
            </div>
            <!-- ENDS headline -->


        </div>
        <!-- ENDS slider holder -->


        <!-- home-block -->
        <div class="home-block" >
            <h2 class="home-block-heading"><span>ULTIMAS PELICULAS</span></h2>
            <g:if test="${movies?.size() > 0}">
                <div class="one-fifth-thumbs clearfix">

                    <g:each in="${movies}" var="m" status="i">
                        <g:if test="${((i+1) % 7) == 0}">
                            <figure class="last">
                        </g:if>
                        <g:else>
                            <figure>
                        </g:else>
                        <figcaption>
                            <strong>${m.title}</strong>
                            <em>${m.year}</em>
                            <g:link class="opener" controller="movie" action="show" id="${m.id}"></g:link>
                        </figcaption>

                        <g:link class="thumb" controller="movie" action="show" id="${m.id}"><img class="movie-poster" src="${m.poster}" alt="Alt text"/></g:link>
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
            <g:paginate controller="index" action="index" total="${totalMovies}"/>
        </div>

        <g:render template="../layouts/footer"></g:render>

    </div>
</footer>

</body>

</html>