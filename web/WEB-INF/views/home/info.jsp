<%-- 
    Document   : info
    Created on : Jun 7, 2022, 7:30:54 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="<c:url value="/css/index.css"/>" rel="stylesheet" type="text/css"/>
        <link href="<c:url value="/css/info.css"/>" rel="stylesheet" type="text/css"/>
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
            <ul class="body-info-address">
                <li><a href="<c:url value="/home/index.com"/>">Home</a></li> /
                <li><a href="<c:url value="/home/brand.com?brand=${bike.brandName}"/>">${bike.brandName}</a></li> /
                <li><a href="<c:url value="/home/info.com?id=${bike.productId}"/>">${bike.productName}</a></li>
            </ul>
            <!--body-->
            <div class="body-info-container">
                <div class="body-info-container__left">
                    <img src="<c:url value="${bike.image}"/>"/>
                    <div class="body-info-container_left_list-img">

                        <c:forEach var="listImage" items="${listImage}">
                            <img class="small-list-img" src="<c:url value="${listImage}"/>"/>
                        </c:forEach>     

                    </div>
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
                    <form action="./addToCart.com">
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
                        <h2 style="display: ${bike.quantity >0 ?"block":"none"}">Quantity: There are ${bike.quantity} bike available</h2>
                        <h2 style="display: ${bike.quantity <1 ?"block":"none"}">Quantity: Out of stock!</h2>
                        <input oninput="changeFunc()" id="quantity" type="number" placeholder="Quantity" name="quantity" value="1"/>
                        <div style="display: ${bike.quantity >0 ?"block":"none"}">
                            <input name="id" type="hidden" value="${bike.productId}"/>
                            <button class="body-info-container__right__add"  value="add_handler" name="op">Add to cart</button>
                            <button class="body-info-container__right__buy" value="buy_handler" name="op">Buy now</button>
                        </div>
                        <div  style="display: ${bike.quantity <1 ?"flex":"none"}; margin: 20px 0 20px 150px;">
                            <div class="disable"><span style="transform: translateX(75%);">Add to cart</span></div>
                            <div class="disable"><span style="transform: translateX(114%);">Buy now</span></div>
                        </div>
                    </form>
                </div>
            </div>
            <!--footer-->
            <footer class="footer-distributed">

                <div class="footer-right">

                    <a href="#"><i class="fa-brands fa-facebook-square"></i></a>
                    <a href="#"><i class="fa-brands fa-youtube"></i></a>
                    <a href="#"><i class="fa-brands fa-github"></i></a>
                    <a href="#"><i class="fa-brands fa-instagram"></i></a>

                </div>

                <div class="footer-left">

                    <p class="footer-links">
                        <a class="link-1" href="<c:url value="/home/index.com"/>">Home</a>
                        <a href="#">Contact</a>
                    </p>

                    <p>감사합니다 PRJ301 &copy; 2022</p>
                </div>
            </footer>
        </div>
        <!--slideshow-->
        <div class="show-slideshow">
            <div class="overplay"></div>
            <div class="slideshow-container">
                <c:forEach var="listImage" items="${listImage}" varStatus="loop">
                    <div class="mySlides fade">
                        <div class="numbertext">${loop.count}/${size}</div>
                        <img src="<c:url value="${listImage}"/>" style="width:100%">
                    </div>
                </c:forEach>  

                <a class="prev" onclick="plusSlides(-1)">❮</a>
                <a class="next" onclick="plusSlides(1)">❯</a>
            </div>
            <br>
        </div>
    </body>
    <script>
        const smallList = document.getElementsByClassName("small-list-img");
        const showSlideshow = document.getElementsByClassName("show-slideshow");
        const overplay = document.getElementsByClassName("overplay");
        const quantity = document.getElementById("quantity");
        let slideshow = document.getElementsByClassName("slideshow-container");

        function changeFunc() {
            if (quantity.value < 1 || quantity.value >${bike.quantity}) {
                alert("Can't input lower than 0 in quantity or higher than quantity in stock!");
                quantity.value = 1;
            }
        }


        overplay[0].onclick = function () {
            slideshow[0].style.display = "none";
            showSlideshow[0].style.display = "none";
            overplay[0].style.display = "none";
        };
        for (let i = 0; i < smallList.length; i++) {
            smallList[i].onclick = function () {
                slideshow[0].style.display = "block";
                showSlideshow[0].style.display = "block";
                overplay[0].style.display = "block";
            };
        }

        let slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) {
                slideIndex = 1
            }
            if (n < 1) {
                slideIndex = slides.length
            }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }
    </script>
</html>
