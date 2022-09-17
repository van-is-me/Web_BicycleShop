<%-- 
    Document   : manager
    Created on : Jul 2, 2022, 3:58:41 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Xe dap</title>
    </head>
    <body>
        <h3><a href="<c:url value="/home/index.com"/>">Home</a></h3>
        <h1 style="text-align: center">Management</h1> <hr/>
        <form action="./search.com">
            <input type="text" name="name">
            <input type="submit" value="Search">
        </form>
        <table border="1" cellspacing="0" style="margin-left: auto; margin-right: auto">
            <h2><a href="./showCreateForm.com">Create</a></h2>
            <thead>
                <tr>
                    <th>ProductId</th>
                    <th>ProductName</th>
                    <th>Size</th>
                    <th>FrameMaterial</th>
                    <th>UnitPrice</th>
                    <th>Color</th>
                    <th>CategoryId</th>
                    <th>BrandId</th>
                    <th>Operations</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${listCate}">
                    <tr>
                        <td>${p.productId}</td>
                        <td>${p.productName}</td>
                        <td>${p.size}</td>
                        <td>${p.frameMaterial}</td> 
                        <td>${p.unitPrice}</td> 
                        <td>${p.color}</td> 
                        <td>${p.categoryId}</td> 
                        <td>${p.brandId}</td> 

                        <td>
                            <a href="<c:url value="/admin/update.com?id=${p.productId}"/>">Update</a>
                            <a href="<c:url value="/admin/delete.com?id=${p.productId}"/>">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>

</html>
