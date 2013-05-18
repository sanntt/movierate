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
        <div class="wrapper">
            <a href="index.html" id="logo"><g:img dir="img" file="logo.png" alt="Zeni"/></a>

            <nav>
                <ul id="nav" class="sf-menu">
                    <li><a href="${createLink(uri: '/')}">INICIO</a></li>
                    <li class="current-menu-item"><g:link controller="userGroup" action="listMyGroups">MIS GRUPOS</g:link></li>
                    <li><a href="contact.html">PERFIL</a></li>
                    <li><a href="contact.html">CONTACTO</a></li>
                </ul>
                <div id="combo-holder"></div>
            </nav>

        </div>
    </header>


    <!-- MAIN -->
    <div id="main">
        <div class="wrapper clearfix">


            <h2 class="page-heading"><span>MIS GRUPOS</span></h2>

            <!-- page content -->
            <div id="page-content" class="clearfix">
                <ul  class="widget-cols clearfix">
                    <li class="first-col">


                        <div class="widget-block">
                            <h4>Soy el creador</h4>
                            <ul>
                                <g:each in="${userGroupOwner}" var="owned">
                                    <li><g:link action="show" id="${owned.id}">${fieldValue(bean: owned, field: "name")}</g:link></li>
                                </g:each>
                                <li><g:link action="create">Nuevo grupo!</g:link></li>
                            </ul>
                        </div>
                    </li>

                    <li class="second-col">

                        <div class="widget-block">
                            <h4>Soy administrador</h4>
                            <ul>
                                <g:each in="${userGroupAdmined}" var="admined">
                                    <li><g:link action="show" id="${admined.id}">${fieldValue(bean: admined, field: "name")}</g:link></li>
                                </g:each>
                            </ul>
                        </div>

                    </li>

                    <li class="third-col">

                        <div class="widget-block">
                            <h4>Soy moderador</h4>
                            <ul>
                                <g:each in="${userGroupModed}" var="moded">
                                    <li><g:link action="show" id="${moded.id}">${fieldValue(bean: moded, field: "name")}</g:link></li>
                                </g:each>
                            </ul>
                        </div>

                    </li>

                    <li class="fourth-col">

                        <div class="widget-block">
                            <h4>Soy miembro</h4>
                            <ul>
                                <g:each in="${userGroupAsUser}" var="asUser">
                                    <li><g:link action="show" id="${asUser.id}">${fieldValue(bean: asUser, field: "name")}</g:link></li>
                                </g:each>
                            </ul>
                        </div>

                    </li>
                </ul>
            </div>
            <!--  page content-->




        </div>
    </div>
    <!-- ENDS MAIN -->


    <footer>
        <div class="wrapperOnly">
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