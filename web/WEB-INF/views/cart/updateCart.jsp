<%-- 
    Document   : updateCart
    Created on : Jul 8, 2022, 7:20:24 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/css/info.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        body{
            background: #f1ecec;
        }
        .button-update {
            width: 20%;
            padding: 10px 0;
            margin: 30px 0 30px 150px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            color: #fff;
            background-color: #f8e8ff;
            color: #cc2dee;
            border: 1px solid #cc2dee;
        }
        .button-update:hover {
            opacity: 0.7;
        }
        .body-updating-cart {
            margin-top: 50px; 
        }
    </style>
    <body>
        <div class="body-info-container body-updating-cart" >
            <div class="body-info-container__left">
                <img src="<c:url value="${bike.image}"/>"/>
            </div>
            <div class="body-info-container__right">
                <h1>${bike.productName}</h1>
                <div>
                    <h2>
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${bike.unitPrice}" type="currency"/>
                    </h2>
                    <del>
                        <fmt:setLocale value="vi_VN"/>
                        <fmt:formatNumber value="${bike.unitPrice*2}" type="currency"/>
                    </del>
                </div>
                <form action="./updating.com">
                    <h3>Color</h3>
                    <select name="colorOption">
                        <option value="black">Black</option>
                        <option value="white">White</option>
                        <option value="red">Red</option>
                        <option value="yellow">Yellow</option>
                        <option value="blue">Blue</option>
                        <option value="gray">Gray</option>
                    </select>
                    <h3>Size</h3>
                    <select name="sizeOption">
                        <option value="XS">XS</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="ML">ML</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                    </select>
                    <h2>Quantity: There are ${bike.quantity} bike available</h2>
                    <input oninput="changeFunc()" id="quantity" type="number" placeholder="Quantity" name="quantity" value="${quantity}"/>
                    <div>
                        <input name="id" type="hidden" value="${bike.productId}"/>
                        <button class="button-update">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script>
        const quantity = document.getElementById("quantity");
        function changeFunc() {
            if (quantity.value < 1 || quantity.value >${bike.quantity}) {
                alert("Can't input lower than 0 in quantity or higher than quantity in stock!");
                quantity.value = ${quantity};
            }
        }
    </script>
</html>
