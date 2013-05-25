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
        <g:render template="../layouts/footer"></g:render>
    </div>
</footer>

</body>

</html>