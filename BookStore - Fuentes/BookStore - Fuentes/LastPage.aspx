<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LastPage.aspx.cs" Inherits="BookStore___Fuentes.WebForm7" %>
<asp:Content ID="transHistory" ContentPlaceHolderID="HeadContent" 
    runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Button ID="LogOutBnt" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
   <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 20px;
        }

        .success-message {
            color: black;/* Green color for success message */
            font-size: 34px;
            margin-bottom: 20px;
        }

        .orderAgain {
            padding: 10px 20px;
            font-size: 1em;
           background-color: #348494; /* Green background color for the button */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .orderAgain:hover {
              background-color: #348494; /* Darker green color on hover */
        }
    </style>
</head>
<body>
    <br />
    <br />
    <div class="success-message">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Successfully Ordered<br />
        Thank you for Ordering
    </div>

    <asp:Button ID="Button1" class="orderAgain" runat="server" OnClick="Button1_Click" 
        Text="Order Again" />
</body>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
