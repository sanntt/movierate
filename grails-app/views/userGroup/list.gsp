<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>

<body lang="en">

<g:render template="../layouts/group_header"></g:render>

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
        <g:render template="../layouts/footer"></g:render>

    </div>
</footer>
</body>
	
</html>