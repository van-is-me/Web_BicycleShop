<%-- 
    Document   : login
    Created on : Jun 5, 2022, 2:31:09 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        @import url("https://fonts.googleapis.com/css?family=Nunito:400,600,700");
        * {
            box-sizing: border-box;
        }
        body {
            font-family: "Nunito", sans-serif;
            color: rgba(0, 0, 0, 0.7);
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .container {
            height: 100vh;
            background-image: url(https://luotbike.vn/wp-content/uploads/2021/05/xe-dap-riteway-shepherd-2048x1365.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .modal {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height: 60px;
            background: rgba(51, 51, 51, 0.5);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: 0.4s;
        }
        .modal-container {
            display: flex;
            max-width: 720px;
            width: 100%;
            border-radius: 10px;
            overflow: hidden;
            position: absolute;
            opacity: 0;
            pointer-events: none;
            transition-duration: 0.3s;
            background: #fff;
            transform: translateY(100px) scale(0.4);
        }
        .modal-title {
            font-size: 26px;
            margin: 0;
            font-weight: 400;
            color: #55311c;
        }
        .modal-left {
            padding: 60px 30px 20px;
            background: #fff;
            flex: 1.5;
            transition-duration: 0.5s;
            transform: translateY(80px);
            opacity: 0;
        }
        .modal-button {
            color: #7d695e;
            font-family: "Nunito", sans-serif;
            font-size: 18px;
            cursor: pointer;
            border: 0;
            outline: 0;
            padding: 10px 40px;
            border-radius: 30px;
            background: #fff;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.16);
            transition: 0.3s;
        }
        .modal-button:hover {
            border-color: rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.8);
        }
        .modal.is-open {
            height: 100%;
            background: rgba(51, 51, 51, 0.85);
        }
        .modal.is-open .modal-button {
            opacity: 0;
        }
        .modal.is-open .modal-container {
            opacity: 1;
            transition-duration: 0.6s;
            pointer-events: auto;
            transform: translateY(0) scale(1);
        }
        .modal.is-open .modal-right img {
            transform: scale(1);
        }
        .modal.is-open .modal-left {
            transform: translateY(0);
            opacity: 1;
            transition-delay: 0.1s;
        }
        .modal-buttons {
            display: flex;
            justify-content: flex-end;
            align-items: center;
        }
        .modal-buttons a {
            color: rgba(51, 51, 51, 0.6);
            font-size: 14px;
        }
        .sign-up {
            margin: 60px 0 0;
            font-size: 14px;
            text-align: center;
        }
        .sign-up a {
            color: #8c7569;
        }
        .input-button {
            padding: 8px 12px;
            outline: none;
            border: 0;
            color: #fff;
            border-radius: 4px;
            background: #8c7569;
            font-family: "Nunito", sans-serif;
            transition: 0.3s;
            cursor: pointer;
        }
        .input-button:hover {
            background: #55311c;
        }
        .input-label {
            font-size: 11px;
            text-transform: uppercase;
            font-family: "Nunito", sans-serif;
            font-weight: 600;
            letter-spacing: 0.7px;
            color: #000;
            transition: 0.3s;
        }
        .input-block {
            display: flex;
            flex-direction: column;
            padding: 10px 10px 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            transition: 0.3s;
        }
        .input-block input {
            outline: 0;
            border: 0;
            padding: 4px 0 0;
            font-size: 14px;
            font-family: "Nunito", sans-serif;
        }
        .input-block input::placeholder {
            color: #ccc;
            opacity: 1;
        }
        .input-block:focus-within {
            border-color: #8c7569;
        }
        .input-block:focus-within .input-label {
            color: rgba(140, 117, 105, 0.8);
        }
        .icon-button {
            outline: 0;
            position: absolute;
            right: 10px;
            top: 12px;
            width: 13px;
            height: 22px;
            border: 0;
            background: 0;
            padding: 0;
            cursor: pointer;
        }
        .link-button {
            text-decoration: none;
            color: #000;
        }
        @media (max-width: 750px) {
            .modal-container {
                width: 90%;
            }
        }

    </style>
    <body>
        <div class="container"></div>
        <div class="modal is-open">
            <form class="modal-container" action="./logining.com">
                <div class="modal-left">
                    <h1 class="modal-title">Welcome!</h1>
                    <div class="input-block">
                        <label for="user" class="input-label">User name</label>
                        <input type="text" name="user" id="email" placeholder="User name">
                    </div>
                    <div class="input-block">
                        <label for="password" class="input-label">Password</label>
                        <input type="password" name="password" id="password" placeholder="Password">
                    </div>
                    <div class="modal-buttons">
                        <button class="input-button">Login</button>
                    </div>
                    <p class="sign-up">Don't have an account? <a href="<c:url value="/user/register.com"/>">Sign up now</a></p>
                    <h2 style="color: red;">${result}</h2>
                </div>

                <div class="icon-button close-button">
                    <a class="link-button" href="<c:url value="/home/index.com"/>">X</a>
                </div>
            </form>

        </div>
    </body>
</html>
