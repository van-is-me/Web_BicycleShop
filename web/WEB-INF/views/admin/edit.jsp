<%-- 
    Document   : edit
    Created on : Jul 4, 2022, 10:57:38 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        input:focus{
            width: 400px;
        }
    </style>
    <body>
        <form action="./updating.com">
            ProductId: <br/>
            <input type="text" name="id" value="${bike.productId}"><br/>
            ProductName: <br/>
            <input type="text" name="name" value="${bike.productName}"><br/>
            Size: <br/>
            <input type="text" name="size" value="${bike.size}"><br/>
            FrameMaterial: <br/>
            <input type="text" name="FM" value="${bike.frameMaterial}"><br/>
            UnitPrice: <br/>
            <input type="int" name="price" value="${bike.unitPrice}"><br/>
            Color: <br/>
            <input type="text" name="color" value="${bike.color}"><br/>
            CategoryId: <br/>
            <input type="text" name="cateId" value="${bike.categoryId}"><br/>
            BrandID: <br/>
            <input type="text" name="brandId" value="${bike.brandId}"><br/>
            <input type="submit" value="Update">
        </form>
            <h1>${result}</h1>
    </body>
</html>
