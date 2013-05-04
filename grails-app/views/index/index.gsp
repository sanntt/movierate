<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'prettyPhoto.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.5.2.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'cufon-yui.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'cufon-replace.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'Terminal_Dosis_300.font.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'atooltip.jquery.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'roundabout.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'roundabout_shapes.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.easing.1.2.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.prettyPhoto.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'hover-image.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'tabs.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'script.js')}" ></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'html5.js')}" ></script>
</head>
<body id="page3">
<div class="body1">
<div class="body2">
<div class="body3">
<div class="main">
<!-- header -->
<header>
    <div class="wrapper">
        <h1><a href="index.html" id="logo"></a></h1>

        <g:form id="search" url="[action:'find',controller:'movie']">
            <div>
                <input type="submit" class="submit" value="">
                <g:textField name="title" class="input" type="text" value="Search for Movie" onblur="if(this.value=='') this.value='Search for Movie'" onFocus="if(this.value =='Search for Movie' ) this.value=''"/>
            </div>
        </g:form>
        <div>
            <nav>
                <ul id="menu">
                    <li id="active"><a href="#">Home</a></li>
                    <li><a href="perfil.html">Perfil</a></li>
                    <li class="end"><g:link controller="userGroup" action="listMyGroups">Grupos</g:link></li>
                </ul>
            </nav>

        </div>
    </div>
    <div class="relative">
        <div id="gallery">
            <ul id="myRoundabout">
                <li><g:img dir="images" file="img1.png"/></li>
                <li><g:img dir="images" file="img2.png"/></li>
                <li><g:img dir="images" file="img3.png"/></li>
            </ul>
        </div>
    </div>
</header>
<!-- / header-->
<!-- content -->
<section id="content">
<div class="line1 wrapper">
<div class="wrapper tabs">
<article class="tab-content" id="Accion">
    <h2>Películas</h2>
    <ul class="gallery">
        <g:each var="movie" in="${movies}">
        <li>
            <g:link controller="movie" action="show" class="lightbox-image" id="${movie.id}">
                <g:img uri="${movie.poster}" width="218" height="146" />
            </g:link>
        </li>
        </g:each>
    </ul>
</article>
<article class="col2 pad_left1 tab-content" id="Aventura">
    <h2>Películas de Aventura</h2>
    <ul class="gallery">
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li class="end">
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
    </ul>
</article>
<article class="col2 pad_left1 tab-content" id="Biograficas">
    <h2>Películas Biográficas</h2>
    <ul class="gallery">
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li class="end">
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
    </ul>
</article>
<article class="col2 pad_left1 tab-content" id="CienciaFiccion">
    <h2>Películas de Ciencia Ficción</h2>
    <ul class="gallery">
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li class="end">
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
    </ul>
</article>
<article class="col2 pad_left1 tab-content" id="etc">
    <h2>etc...</h2>
    <ul class="gallery">
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li>
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
        <li class="end">
            <a href="#" class="lightbox-image" rel="prettyPhoto[group2]" >
                <g:img dir="images" file="page3_img3.jpg"/>
            </a>
        </li>
    </ul>
</article>
</div>
</div>
</section>
</div>
</div>
</div>
</div>
<div class="body4">
    <div class="main">
        <section id="content2">
        </section>
    </div>
</div>
<!-- / content -->
<div class="main">
    <!-- footer -->
    <footer>
        <div class="wrapper">

        </div>
        <!-- {%FOOTER_LINK} -->
    </footer>
    <!-- / footer -->
</div>
<script type="text/javascript"> Cufon.now(); </script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#myRoundabout').roundabout({
            shape: 'square',
            minScale: 0.93, // tiny!
            maxScale: 1, // tiny!
            easing:'easeOutExpo',
            clickToFocus:'true',
            focusBearing:'0',
            duration:800,
            reflect:true
        });
        tabs.init();
        // for lightbox
        if ($("a[rel^='prettyPhoto']").length) {
            $(document).ready(function() {
                // prettyPhoto
                $("a[rel^='prettyPhoto']").prettyPhoto({theme:'light_square'});
            });
        }
    });
</script>
</body>
</html>