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
                <li><a href="${createLink(uri: '/')}">INICIO</a></li>
                <li class="current-menu-item"><g:link controller="userGroup" action="list">MIS GRUPOS</g:link></li>
                <!--<li><a href="page.html">PERFIL</a></li>         -->
                <!--<li><a href="contact.html">CONTACTO</a></li>-->
                <sec:ifLoggedIn>
                    <li><g:link controller="logout" action="index">DESCONECTARSE</g:link></li>
                </sec:ifLoggedIn>
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
        <h2 class="home-block-heading"><span>NUEVO GRUPO</span></h2>

        <g:form action="save" name="loginForm" >
            <fieldset class="form">
                <g:render template="form"/>
            </fieldset>
            <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:form>

        </div>
        <!-- ENDS home-block -->

    </div>
</div>
<!-- ENDS MAIN -->


<footer>
    <div class="wrapperOnly">

    </div>
</footer>

</body>

</html>