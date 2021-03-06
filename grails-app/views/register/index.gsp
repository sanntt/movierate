<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"/>

<body lang="en">

<g:render template="../layouts/register_header"/>

<!-- MAIN -->
<div id="main">
    <div class="wrapper">
        <!-- page content -->
        <div id="page-content" class="clearfix">

        <g:if test='${emailSent}'>
            <div style="text-align: center;">
                <p><g:message code='spring.security.ui.register.sent'/></p>
            </div>
        </g:if>

            <ul  class="widget-cols-half clearfix">
                <li class="first-col">

                    <div class="widget-block">
                        <g:form action="register" name="registerForm">

                            <h2 class="heading">REGISTRARSE</h2>
                            <fieldset>
                                <div>
                                    <label>
                                        <input name="username" type="text" class="form-poshytip"
                                               title="Ingrese su usuario" placeholder="Usuario"/>
                                    </label>
                                </div>
                                <div>
                                    <input name="email" type="text" class="form-poshytip" title="Ingrese su email" placeholder="Email" />
                                </div>
                                <div>
                                    <input name="password" type="password" class="form-poshytip" title="Ingrese su contrase&ntilde;a" placeholder="Contrase&ntilde;a" />
                                </div>
                                <div>
                                    <input name="password2" type="password" class="form-poshytip" title="Confirme su contrase&ntilde;a" placeholder="Confirmar Contrase&ntilde;a" />
                                </div>

                                <p><input type="submit" value="Registrarse" name="submit" /></p>
                            </fieldset>
                        </g:form>
                        <em id="corner"></em>
                    </div>
                </li>
                <li class="second-col">
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
                </li>
            </ul>

        </div>
        <!--  page content-->




    </div>
</div>
<!-- ENDS MAIN -->


<footer>
    <div class="wrapperOnly">

        <g:render template="../layouts/footer"></g:render>

    </div>
</footer>

</body>

</html>