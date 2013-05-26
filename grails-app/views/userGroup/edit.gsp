<!doctype html>
<html class="no-js">

<g:render template="../layouts/head"></g:render>

<body lang="en">

<g:render template="../layouts/group_header"></g:render>

<!-- MAIN -->
<div id="main">
    <div class="wrapper">
        <!-- home-block -->
        <div class="home-block">
            <h2 class="home-block-heading"><span>NUEVO GRUPO</span></h2>

            <g:form action="save" name="normalForm" >
                <g:hiddenField name="id" value="${userGroupInstance?.id}" />
                <g:hiddenField name="version" value="${userGroupInstance?.version}" />

                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>

                <g:if test="${userGroupInstance?.users.size() > 0}">
                <div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'administrators', 'error')} ">
                    <label for="administrators">
                        <!-- <g:message code="userGroup.administrators.label" default="Administrators" />    -->
                    </label>
                    <g:select name="administratorUsers" from="${userGroupInstance?.users*.user}" multiple="multiple" optionKey="id" size="5" value="${userGroupInstance?.administrators*.user.id}" title="Seleccione los administradores" class="many-to-many form-poshytip"/>
                </div>


                <div class="fieldcontain ${hasErrors(bean: userGroupInstance, field: 'moderators', 'error')} ">
                    <label for="moderators">
                        <!--<g:message code="userGroup.moderators.label" default="Moderators" />   -->
                    </label>
                    <g:select name="moderatorUsers" from="${userGroupInstance?.users*.user}" multiple="multiple" optionKey="id" size="5" value="${userGroupInstance?.moderators*.user.id}" title="Seleccione los moderadores" class="many-to-many form-poshytip"/>
                </div>
                </g:if>
                <fieldset class="buttons">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                    <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>

        </div>
        <!-- ENDS home-block -->

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