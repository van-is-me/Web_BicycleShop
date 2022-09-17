<%-- 
    Document   : detail
    Created on : Jun 18, 2022, 3:19:58 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/detail.css"/>" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="app">
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
            <div class="line"></div>
            <div class="body-container">
                <div class="body-container__left">
                    <h1>Category</h1>
                    <hr style="width: 60%"/>
                    <ul>
                        <li><a href="<c:url value="/home/detail.com?type=DP"/>">Xe Đạp Đường Phố</a></li>
                        <li><a href="<c:url value="/home/detail.com?type=DH"/>">Xe Đạp Địa Hình</a></li>
                        <li><a href="<c:url value="/home/detail.com?type=D"/>">Xe Đạp Đua</a></li>
                        <li><a href="<c:url value="/home/detail.com?type=G"/>">Xe Đạp Gấp</a></li>
                        <li><a href="<c:url value="/home/detail.com?type=N"/>">Xe Đạp Nữ</a></li>
                        <li><a href="<c:url value="/home/detail.com?type=TE"/>">Xe Đạp Trẻ Em</a></li>
                    </ul>
                    <hr>
                    <h1>Brand</h1>
                    <hr style="width: 60%"/>
                    <ul>
                        <li><a href="<c:url value="/home/brand.com?brand=GIANT"/>">GIANT</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=TRINX"/>">TRINX</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=MOMENTUM"/>">MOMENTUM</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=FORNIX"/>">FORNIX</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=VINBIKE"/>">VINBIKE</a></li>                  
                        <li><a href="<c:url value="/home/brand.com?brand=ROYALBABY"/>">ROYALBABY</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=MARUISHI"/>">MARUISHI</a></li>        
                        <li><a href="<c:url value="/home/brand.com?brand=LIV"/>">LIV</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=SOMINGS"/>">SOMINGS</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=STITAH"/>">STITAH</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=HITASA"/>">HITASA</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=WAHOO"/>">WAHOO</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=MAXXIS"/>">MAXXIS</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=MIAMOR"/>">MIAMOR</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=PROTEC"/>">PROTEC</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=CADEX"/>">CADEX</a></li>
                        <li><a href="<c:url value="/home/brand.com?brand=HILAND"/>">HILAND</a></li>
                    </ul>
                </div>
                <div class="body-container__right">
                    <!--item-->
                    <div class="body-container__right__item">
                        <h1><a href="<c:url value="/home/detail.com?type=${line}"/>">${typeLine}</a></h1>
                        <div class="body-container__right__list-item">
                            <c:forEach var="bike" items="${listCate}">
                                <a href="<c:url value="/home/info.com?id=${bike.productId}"/>">
                                    <img src="<c:url value="${bike.image}"/>"/>
                                    <div class="body-container__right__item--sale-off">
                                        <span class="body-container__right__item--sale-off__angle"></span>
                                        <span class="body-container__right__item--sale-off__percent">49%</span>
                                        <span class="body-container__right__item--sale-off__lable">Sale</span>
                                    </div>
                                    <hr/>
                                    <div style="height: 110px;">
                                        <h4>${bike.productName}</h4>
                                        <h4>
                                            <fmt:setLocale value="vi_VN"/>
                                            <fmt:formatNumber value="${bike.unitPrice}" type="currency"/>
                                        </h4>
                                    </div>
                                    <div class="body-container__right__add__btn">
                                        <button class="body-container__right__add"  >Add to cart</button>
                                        <button class="body-container__right__buy" >Buy now</button>
                                    </div>
                                </a>
                            </c:forEach>                          
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>
