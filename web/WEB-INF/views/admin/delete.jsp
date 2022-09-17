<%-- 
    Document   : delete
    Created on : Jul 5, 2022, 7:30:01 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xe dap</title>
    </head>
    <body>
        <h1>Confirm Deletion</h1>
        <hr/>
        <form action="./choosing.com">
            Do you want to delete the product with id = ${id}?<br/>
            <input type="hidden" name="id" value="${id}" />
            <input type="submit" name="op" value="Yes"/>
            <input type="submit" name="op" value="No"/>
        </form>
        <i style="color:red">${result}</i>
    </body>
</html>
