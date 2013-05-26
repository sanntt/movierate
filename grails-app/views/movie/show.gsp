<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"/>
	
<body lang="en">

<g:render template="../layouts/movies_header"/>

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
                    <g:img uri="${movieInstance?.poster}" class="movie-poster-resize"/>
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
                <h2 class="home-block-heading"><span>${gName}</span></h2>
                <ul  class="widget-cols-half clearfix">
                    <li class="first-col">

                        <div>
                            <!-- Comment -->
                            <script src="${resource(dir: 'js', file: 'form-validation.js')}"></script>

                            <h4>Comentar!</h4>
                            <g:form method="post" name="commentFilm" action="#">
                                <g:hiddenField name="id" value="${movieInstance?.id}" />
                                <g:hiddenField name="gId" value="${gId}" />
                                <fieldset>
                                    <g:textArea name="comments" value="" id="comments" rows="5" cols="20" class="form-poshytip" title="Ingrese su comentario" maxlength="250"/>

                                    <p><g:actionSubmit value="Comentar" id="submit" name="submit" action="comment"/>
                                </fieldset>

                            </g:form>
                            <p id="sent-form-msg" class="success">Su comentario ha sido enviado!</p>




                            <g:if test="${comments?.size() > 0}">
                                <!-- comments list -->
                                <div id="comments-wrap">
                                    <h3 class="heading">${totalComments} COMENTARIOS</h3>
                                    <ol class="commentlist">

                                        <g:each in="${comments}" var="comment" status="i">
                                        <li class="comment even thread-even depth-1" id="li-comment-1">


                                            <div id="comment-1" class="comment-body clearfix">
                                               <!-- <img alt='' src='http://0.gravatar.com/avatar/4f64c9f81bb0d4ee969aaf7b4a5a6f40?s=35&amp;d=&amp;r=G' class='avatar avatar-35 photo' height='35' width='35' />   -->
                                                <div class="comment-author vcard">${comment.commenter.toString()}</div>
                                                <div class="comment-meta commentmetadata">
                                                    <span class="comment-date"><g:formatDate format="dd-MM-yyyy HH:mm:ss" date="${comment.dateCreated}"/></span>
                                                    <g:if test="${comment.commenter == loggedUser || canDelete}">
                                                        <g:form method="post" controller="comment" name="delete" action="#">
                                                            <fieldset>
                                                                <g:hiddenField name="id" value="${comment?.id}" />
                                                                <g:hiddenField name="mId" value="${movieInstance?.id}" />
                                                                <g:hiddenField name="gId" value="${gId}" />
                                                                <span class="comment-reply-link-wrap"><g:actionSubmit value="Eliminar" name="submit" action="delete" class="normalButton"/></span>
                                                            </fieldset>

                                                        </g:form>
                                                    </g:if>
                                                </div>
                                                <div class="comment-inner">
                                                    <p>${comment.commentText}</p>
                                                </div>
                                            </div>
                                        </li>
                                        </g:each>
                                    </ol>
                                </div>
                                <!-- ENDS comments list -->
                                <div class="pagination">
                                    <g:paginate controller="movie" action="showMovieForGroup" total="${totalComments}" id="${movieInstance?.id}" params='[gId: "${gId}"]'/>
                                </div>
                            </g:if>
                        </div>
                    </li>

                </ul>
            </div>
            </g:if>

            <g:render template="../layouts/footer"/>

        </div>
    </footer>

</body>
	
</html>