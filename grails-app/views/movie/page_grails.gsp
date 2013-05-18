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
	        	
				<!-- page content -->
	        	<div id="page-content" class="clearfix">
					
					
					
					<!-- floated content -->
					<div class="floated-content">

                        <g:if test="${movieInstance?.title}">
						    <h2 class="page-heading">
                                <span>${movieInstance.toString().toUpperCase()}</span>
                            </h2>
                        </g:if>

                        <g:if test="${movieInstance?.actors}">
                            <h4>Actores</h4>
						    <p>
                                <g:each in="${movieInstance.actors}" var="actor" status="i">
                                    <g:if test="${i == movieInstance.actors.size() - 1}">
                                        ${actor}
                                    </g:if>
                                    <g:else>
                                        ${actor},
                                    </g:else>
                                </g:each>
						    </p>
                        </g:if>

                        <g:if test="${movieInstance?.directors}">
                            <g:if test="${movieInstance.directors.size() == 1}">
                                <h4>Director</h4>
                            </g:if>
                            <g:else>
                                <h4>Directores</h4>
                            </g:else>
                            <p>
                                <g:each in="${movieInstance.directors}" var="director" status="i">
                                    <g:if test="${i == movieInstance.directors.size() - 1}">
                                        ${director}
                                    </g:if>
                                    <g:else>
                                        ${director},
                                    </g:else>
                                </g:each>
                            </p>
                        </g:if>

                        <g:if test="${movieInstance?.genres}">
                            <g:if test="${movieInstance.genres.size() == 1}">
                                <h4>G&eacute;nero</h4>
                            </g:if>
                            <g:else>
                                <h4>G&eacute;neros</h4>
                            </g:else>
                            <p>
                                <g:each in="${movieInstance.genres}" var="genero" status="i">
                                    <g:if test="${i == movieInstance.genres.size() - 1}">
                                        ${genero}
                                    </g:if>
                                    <g:else>
                                        ${genero},
                                    </g:else>
                                </g:each>
                            </p>
                        </g:if>

                        <g:if test="${movieInstance?.plot}">
                            <h4>Trama</h4>
                            <p>${movieInstance?.plot}</p>
                        </g:if>
						
					</div>
					<!-- ends floated content -->
					
					<!-- sidebar -->
		        	<aside id="sidebar">
                        <g:img uri="${movieInstance?.poster}"></g:img>
		        		<em id="corner"></em>
		        	</aside>
					<!-- ENDS sidebar -->
					
				</div>	        	
	        	<!--  page content-->
	        	
	        	

	        	
			</div>
		</div>
		<!-- ENDS MAIN -->
		
		
		<footer>
			<div class="wrapperOnly">
                <g:if test="${gId != null}">
                <div class="wrapper">
                    <ul  class="widget-cols clearfix">
                        <li class="first-col">

                            <div>
                                <!-- Comment -->
                                <script src="${resource(dir: 'js', file: 'form-validation.js')}"></script>
                                <h4>Comentar!</h4>
                                <g:form method="post" name="commentFilm" action="#">
                                    <g:hiddenField name="id" value="${movieInstance?.id}" />
                                    <g:hiddenField name="gId" value="${gId}" />
                                    <fieldset>
                                        <g:textArea name="comments" value="" id="comments" rows="5" cols="20" class="form-poshytip" title="Ingrese su comentario"></g:textArea>

                                        <p><g:actionSubmit value="Comentar" id="submit" name="submit" action="comment" params="['xx':'aa']"></g:actionSubmit>

                                            <span id="error" class="warning">Message</span></p>

                                    </fieldset>

                                </g:form>
                                <p id="sent-form-msg" class="success">Su comentario ha sido enviado!</p>
                            </div>

                            <g:if test="${comments?.size() > 0}">
                                <div class="widget-block">
                                    <h4>Comentarios recientes</h4>
                                    <g:each in="${comments}" var="comment" status="i">
                                        <div class="recent-post">
                                            <a href="#" class="thumb"><g:img dir="img/dummies" file="54x54.gif" alt="Post"/></a>
                                            <div class="post-head">

                                                <g:form method="post" controller="comment" name="delete" action="#">
                                                    <fieldset>
                                                        <p>
                                                            <span>${comment.commentText}</span>
                                                            <span>${comment.commenter.toString()} <g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${comment.dateCreated}"/></span>

                                                            <g:if test="${comment.commenter == loggedUser || canDelete}">
                                                                <g:hiddenField name="id" value="${comment?.id}" />
                                                                <g:hiddenField name="mId" value="${movieInstance?.id}" />
                                                                <g:hiddenField name="gId" value="${gId}" />
                                                                <p><g:actionSubmit value="Eliminar" name="submit" action="delete"></g:actionSubmit>
                                                            </g:if>

                                                        </p>

                                                    </fieldset>

                                                </g:form>


                                            </div>
                                        </div>
                                    </g:each>
                                </div>
                            </g:if>
                        </li>

                    </ul>
                </div>
                </g:if>
				
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