<header class="clearfix">
    <div class="wrapper clearfix">

        <a href="${createLink(uri: '/')}" id="logo"><g:img dir="img" file="movierate.png" alt="MovieRate"/></a>

        <nav>
            <ul id="nav" class="sf-menu">
                <li><a href="${createLink(uri: '/')}">INICIO</a></li>
                <li><g:link controller="movie" action="list">PELICULAS</g:link></li>
                <li class="current-menu-item"><g:link controller="userGroup" action="list">MIS GRUPOS</g:link></li>
            <!--<li><a href="page.html">PERFIL</a></li>         -->
            <!--<li><a href="contact.html">CONTACTO</a></li>-->
                <sec:ifLoggedIn>
                    <li><g:link controller="logout" action="index">DESCONECTARSE</g:link></li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li><g:link controller="register" action="index">REGISTRARSE</g:link></li>
                </sec:ifNotLoggedIn>
            </ul>
            <div id="combo-holder"></div>
        </nav>
    </div>
</header>