<%-- 
    Document   : cart
    Created on : Jun 18, 2022, 1:24:28 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/css/cart.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css"/>
        <title>Xe dap</title>
    </head>
    <style>
        .mess {
            color: red;
            position: relative;
            bottom: -440px;
            left: 32%;
            font-size: 30px;
        }
    </style>
    <body>
        <!--header-->
        <header>
            <div class="header__top">
                <h4>
                    <i class="fa-solid fa-envelope"></i> GmailCuaNhomMinh@gmail.com
                </h4>
                <h4>
                    <i class="fa-solid fa-phone"></i> 0900000009
                </h4>
                <div class="header__user">
                    <c:if test="${sessionScope.acc != null}">
                        <a href="#">Hello ${sessionScope.acc.userName}</a>
                        <a href="<c:url value="./logout.com"/>">Logout</a>
                    </c:if>
                    <c:if test="${sessionScope.acc == null}">
                        <a href="<c:url value="/user/login.com"/>">Login</a>
                    </c:if>
                    <a href="<c:url value="/cart/cart.com"/>"><i class="fa-solid fa-cart-shopping"></i></a>
                    <a style="display: ${sessionScope.acc.userName == "administrator"?"block":"none"}" href="<c:url value="/admin/manager.com"/>"><i class="fa-solid fa-user-lock"></i> Admin</a>
                </div>
            </div>
            <div class="header__bottom">
                <div class="header__left">
                    <img class="header__left_img" src="<c:url value="/images/logo.png"/>"/>
                </div>
                <div class="header__right">
                    <ul>
                        <li><a href="<c:url value="/home/index.com"/>">Home</a></li>
                        <li><a href="">Shop</a></li>
                        <li><a href="">Contact</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!--body-->
        <div class="cart__body__container">
            <table class="cart__body__container__table">
                <thead>
                    <tr>
                        <th style="text-align: left;">Product</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <tr>
                            <td class="cart__body__container__table__product">
                                <img class="cart__body__container__table__product__img" src="${item.bike.image}"/>
                                <div class="cart__body__container__table__product__prop">
                                    <h4>${item.bike.productName}</h4>
                                    <span>Color: ${item.bike.color}</span>
                                    <span>Size: ${item.bike.size}</span>
                                </div>
                            </td>
                            <td>
                                <fmt:setLocale value="vi_VN"/>
                                <fmt:formatNumber value="${item.bike.unitPrice}" type="currency"/>
                            </td>
                            <td>
                                <span>
                                    ${item.quantity}
                                </span>
                            </td>
                            <td>
                                <span>
                                    <fmt:setLocale value="vi_VN"/>
                                    <fmt:formatNumber value="${item.bike.unitPrice * item.quantity}" type="currency"/>
                                </span>
                            </td>
                            <td>
                                <a href="./updateCart.com?id=${item.bike.productId}&color=${item.bike.color}&size=${item.bike.size}&quantity=${item.quantity}">Update</a> |
                                <a href="./delete.com?id=${item.bike.productId}&color=${item.bike.color}&size=${item.bike.size}">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                <span class="mess">${mess}</span>
            </table>
            <div class="cart__body__container__total-and-pay">

                <span class="total">Total: 
                    <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${sessionScope.total}" type="currency"/>
                </span>

                <form action="./clear.com">
                    <button value="clear" name="op">Clear cart</button>
                    <button value="buyAll" name="op">Pay all</button>
                </form>
            </div>
        </div>
    </body>
    <script>
    </script>
</html>
