﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookStore___Fuentes.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <style>
        /* Add some basic CSS styling to the login page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('https://images.alphacoders.com/132/thumbbig-1326370.webp');
            background-size: cover; 
            background-position: center;
            background-attachment: fixed;
        }

        .login-form {
            width: 300px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

           .login-input {
        width: 90%; /* Adjust the width as needed */
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
    }

        .login-button {
            width: 97%;
            background-color: #348494;
            color: #fff;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #2c6e6e;
        }

        h2 {
            text-align: center;
        }

        h5 {
            margin-top: 20px;
            margin-bottom: 5px;
        }

        .register-text {
            font-size: 14px;
        }

        /* Adjust hyperlinks */
        a {
            color: #348494;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-form">
            <h2>Account Login</h2>
            <h5>Email</h5>
            <input type="email" placeholder="Email" class="login-input" id="loginEmail" runat ="server"/>
            <h5>Password</h5>
            <input type="password" placeholder="Password" class="login-input" id="loginPassword" runat ="server"/>
            <asp:Button ID="submitCus" class="login-button" runat="server" Text="Submit" OnClick="submitCus_Click" />
            <br /><br />
            <asp:HyperLink ID="HyperLinkRegister" runat="server" 
                NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
            <span class="register-text">&nbsp; if you don't have an account</span>
            <br /><br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginAdmin.aspx">Admin account</asp:HyperLink>
        </div>
    </form>
</body>
</html>