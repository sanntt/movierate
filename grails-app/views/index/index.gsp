<!doctype html>
<html class="no-js">

<head>
    <meta charset="utf-8"/>
    <title>ZENI</title>

    <!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
    <link rel="stylesheet" media="all" href="${resource(dir: 'css', file: 'style.css')}"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->


    <!-- JS -->
    <script src="${resource(dir: 'js', file: 'jquery-1.6.4.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'css3-mediaqueries.js')}"></script>
    <script src="${resource(dir: 'js', file: 'custom.js')}"></script>
    <script src="${resource(dir: 'js', file: 'tabs.js')}"></script>

    <!-- Tweet -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.tweet.css')}" media="all"  />
    <script src="${resource(dir: 'js/tweet', file: 'jquery.tweet.js')}" ></script>
    <!-- ENDS Tweet -->

    <!-- superfish -->
    <link rel="stylesheet" media="screen" href="${resource(dir: 'css', file: 'superfish.css')}" />
    <script  src="${resource(dir: 'js/superfish-1.4.8/js', file: 'hoverIntent.js')}"></script>
    <script  src="${resource(dir: 'js/superfish-1.4.8/js', file: 'superfish.js')}"></script>
    <script  src="${resource(dir: 'js/superfish-1.4.8/js', file: 'supersubs.js')}"></script>
    <!-- ENDS superfish -->

    <!-- prettyPhoto -->
    <script  src="${resource(dir: 'js/prettyPhoto/js', file: 'jquery.prettyPhoto.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'js/prettyPhoto/css', file: 'prettyPhoto.css')}"  media="screen" />
    <!-- ENDS prettyPhoto -->

    <!-- poshytip -->
    <link rel="stylesheet" href="${resource(dir: 'js/poshytip-1.1/src/tip-twitter', file: 'tip-twitter.css')}"  />
    <link rel="stylesheet" href="${resource(dir: 'js/poshytip-1.1/src/tip-yellowsimple', file: 'tip-yellowsimple.css')}"  />
    <script  src="${resource(dir: 'js/poshytip-1.1/src', file: 'jquery.poshytip.min.js')}"></script>
    <!-- ENDS poshytip -->

    <!-- GOOGLE FONTS -->
    <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,300' rel='stylesheet' type='text/css'>

    <!-- Flex Slider -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'flexslider.css')}" >
    <script src="${resource(dir: 'js', file: 'jquery.flexslider-min.js')}"></script>
    <!-- ENDS Flex Slider -->

    <!-- Less framework -->
    <link rel="stylesheet" media="all" href="${resource(dir: 'css', file: 'lessframework.css')}"/>

    <!-- modernizr -->
    <script src="${resource(dir: 'js', file: 'modernizr.js')}"></script>

    <!-- SKIN -->
    <link rel="stylesheet" media="all" href="${resource(dir: 'css', file: 'skin.css')}"/>

    <!-- reply move form -->
    <script src="${resource(dir: 'js', file: 'moveform.js')}"></script>


</head>

<body lang="en">
<header class="clearfix">
    <div class="wrapper clearfix">

        <a href="index.html" id="logo"><g:img dir="img" file="logo.png" alt="Zeni"/></a>

        <nav>
            <ul id="nav" class="sf-menu">
                <li class="current-menu-item"><a href="index.html">INICIO</a></li>
                <li><g:link controller="userGroup" action="listMyGroups">MIS GRUPOS</g:link></li>
                <li><a href="page.html">PERFIL</a></li>
                <li><a href="contact.html">CONTACTO</a></li>
            </ul>
            <div id="combo-holder"></div>
        </nav>
    </div>
</header>

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
                            <g:link class="opener" controller="movie" action="showMovieForGroup" id="${m.id}"></g:link>
                        </figcaption>

                        <g:link class="thumb" controller="movie" action="showMovieForGroup" id="${m.id}"><img class="movie-poster" src="${m.poster}" alt="Alt text"/></g:link>
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
        <div class="footer-bottom">
            <div class="right">
                <ul id="social-bar">
                    <li><a href="http://www.facebook.com/pages/Ansimuz/224538697564461"  title="Become a fan" class="poshytip"><img src="img/social/facebook.png"  alt="Facebook" /></a></li>
                    <li><a href="https://twitter.com/ansimuz" title="Follow my tweets" class="poshytip"><img src="img/social/twitter.png"  alt="twitter" /></a></li>
                    <li><a href="https://plus.google.com/109030791898417339180/posts"  title="Add to the circle" class="poshytip"><img src="img/social/plus.png" alt="Google plus" /></a></li>
                </ul>
            </div>
        </div>

    </div>
</footer>

</body>

</html>