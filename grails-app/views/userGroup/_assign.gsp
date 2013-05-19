<%@ page import="com.codeon.movierate.group.UserGroup" %>
<div>


<g:select name='new_owner'
          noSelection="${['0':'Nuevo owner']}"
          from='${users}' optionKey="id"></g:select>

</div>

