<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>
	
<body lang="en">

<g:render template="../layouts/movies_header"></g:render>

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

            <g:render template="../layouts/footer"></g:render>

        </div>
    </footer>

</body>
	
</html>