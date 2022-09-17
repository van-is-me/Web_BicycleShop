<%-- 
    Document   : checkOut
    Created on : Jul 8, 2022, 8:28:57 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/css/checkout.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <a href="./index.com">/Back To Home</a>
        </div>
        <div class="body">
            <form class="checkout__container" action="./goodbye.com">
                <h3>Billing Address</h3>
                <fieldset>
                    <legend><i class="fa-solid fa-user"></i> Full Name</legend>
                    <input type="text" name="fullName" value="${user.fullName}"/>
                </fieldset>
                <fieldset>
                    <legend><i class="fa-solid fa-location-crosshairs"></i> Address</legend>
                    <input type="text" name="address" value="${user.address}"/>
                </fieldset>
                <fieldset>
                    <legend><i class="fa-solid fa-phone"></i> Phone</legend>
                    <input type="text" name="phone" value="${user.phone}"/>
                </fieldset>
                <fieldset>
                    <legend><i class="fa-solid fa-cake-candles"></i> Birthday</legend>
                    <input type="date" name="dob" value="${user.dob}"/>
                </fieldset>
                <button>Checkout</button>
            </form>
            <div class="product">
                <table>
                    <thead>
                        <tr>
                            <th style="text-align: left; width: 60%;">Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <tr>
                                <td style="text-align: left;">

                                    <div>
                                        <h4>${item.bike.productName}</h4>
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
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <span class="total">Total: <fmt:setLocale value="vi_VN"/>
                    <fmt:formatNumber value="${sessionScope.total}" type="currency"/>
                </span>
            </div>
        </div>
    </body>
</html>
