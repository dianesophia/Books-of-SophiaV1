<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookStore___Fuentes.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Registration Form</title>
    <style>
        /* Add some basic CSS styling to the registration form */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f1f1f1;
             background-image: url('https://images.alphacoders.com/132/thumbbig-1326370.webp');
        }

        .registration-form {
            width: 300px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .registration-input {
            width: 90%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
        }

        .registration-button {
            width: 97%;
            background-color: #348494;
            color: #fff;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .registration-button:hover {
            background-color: #2c6e6e;
        }

        h2 {
            text-align: center;
        }

        h5 {
            margin-top: 20px;
            margin-bottom: 5px;
        }

        /* Adjust hyperlink styles */
        a {
            color: #348494;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Add an image to the registration form */
        .registration-form img {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
        }

        .register-text {
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-form">
            <h2>Registration Form</h2>
            <h5>Username</h5>
            <input type="text" placeholder="Username" class="registration-input" id="registerUsername" runat ="server">
            <h5>Email</h5>
            <input type="text" placeholder="Email" class="registration-input" id="registerEmail" runat ="server">
            <h5>Address</h5>
            <input type="text" placeholder="Address" class="registration-input" id="registerAddress" runat ="server">
            <h5>Password</h5>
            <input type="password" placeholder="Password" class="registration-input" id="registerPassword" runat ="server">
            <h5>Confirm Password</h5>
            <input type="password" placeholder="ConPassword" class="registration-input" id="registerConPassword" runat ="server">
            <br /><br />
            <asp:Button ID="submitCus" class="registration-button" runat="server" Text="Submit" OnClick="submitCus_Click" />
            <br />
            <asp:HyperLink ID="HyperLinkLogin" runat="server" NavigateUrl="~/Login.aspx">Login</asp:HyperLink>
            &nbsp;<span class="register-text">if you already have an account</span>
        </div>
    </form>
</body>
</html>