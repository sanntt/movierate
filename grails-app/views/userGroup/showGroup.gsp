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
                    <li><a href="index.html">INICIO</a></li>
                    <li class="current-menu-item"><g:link controller="userGroup" action="listMyGroups">MIS GRUPOS</g:link></li>
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
            <!-- home-block -->
            <div class="home-block">
                <h2 class="home-block-heading"><span>${userGroupInstance.name.toUpperCase()}</span></h2>

                <h3>Usuarios</h3>
                    Owner. ${userGroupInstance.owner}
                    <br>
                    <g:each in="${userGroupInstance.administrators}" var="admin">
                        Admin. ${admin}
                    </g:each>
                    <br>
                    <g:each in="${userGroupInstance.moderators}" var="mod">
                        Mod. ${mod}
                    </g:each>
                    <br>
                    <g:each in="${userGroupInstance.users}" var="user">
                        User. ${user}
                    </g:each>


                <h3>Peliculas</h3>

                <g:if test="${userGroupInstance?.movies.size() > 0}">
                <div class="one-fifth-thumbs clearfix">

                    <g:each in="${userGroupInstance.movies}" var="movie" status="i">
                        <g:if test="${((i+1) % 7    ) == 0}">
                            <figure class="last">
                        </g:if>
                        <g:else>
                            <figure>
                        </g:else>
                            <figcaption>
                                <strong>${movie.title} ${i} ${(i+1 % 3)}</strong>
                                <em>${movie.year}</em>
                                <g:link class="opener" controller="movie" action="showMovieForGroup" id="${movie.id}" params='[gId: "${userGroupInstance.id}"]'></g:link>
                            </figcaption>

                            <g:link class="thumb" controller="movie" action="showMovieForGroup" id="${movie.id}" params='[gId: "${userGroupInstance.id}"]'><img class="movie-poster" src="${movie.poster}" alt="Alt text"/></g:link>
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

            <div class="wrapper">
                <g:form>
                    <fieldset>
                        <g:hiddenField name="id" value="${userGroupInstance?.id}" />

                        <g:actionSubmit action="abandon" value="${message(code: 'default.button.abandon.label', default: 'Abandonar')}" onclick="return confirm('${message(code: 'default.button.abandon.confirm.message', default: 'Esta seguro que desea abandonar el grupo?')}');" />

                        <g:if test="${canEdit}">
                            <g:link class="edit" action="edit" id="${userGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                        </g:if>

                        <g:if test="${canDelete}">
                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </g:if>
                    </fieldset>
                </g:form>
            </div>

            <div class="footer-bottom">
                <div class="right">
                    <ul id="social-bar">
                        <li><a href="http://www.facebook.com/pages/Ansimuz/224538697564461"  title="Become a fan" class="poshytip"><g:img dir="img/social" file="facebook.png" alt="Facebook"/></a></li>
                        <li><a href="https://twitter.com/ansimuz" title="Follow my tweets" class="poshytip"><g:img dir="img/social" file="twitter.png" alt="Twitter"/></a></li>
                        <li><a href="https://plus.google.com/109030791898417339180/posts"  title="Add to the circle" class="poshytip"><g:img dir="img/social" file="plus.png" alt="Google plus"/></a></li>
                    </ul>
                </div>
            </div>

        </div>
    </footer>

    </body>
	
</html>