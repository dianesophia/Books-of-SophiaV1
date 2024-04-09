<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderList.aspx.cs" Inherits="BookStore___Fuentes.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="MainContent">

<style>
    .orderList
    {
        width: 500px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
    }
    .orders
    {
        text-align:center;
    }
</style>
    <p>
    <asp:Button ID="Button1" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
<asp:Button ID="Button2" runat="server" Text="Transaction History" 
        style="border-style: none; border-color: inherit; border-width: medium; background-color: #9e3641; color: black; padding: 12px 24px; border-radius: 20px; float: right; margin-left: 21;" 
        Width="217px" OnClick="transHistory_Click" Height="48px" />
<asp:Button ID="Button3" runat="server" Text="Items Page" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="items_Click" Height="49px" />
        <asp:Button ID="Button4" runat="server" Text="Customer Page" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="Customers_Click" Height="49px" />
<br>
<br>
<br>
<br>
        <h2 class="orders">Order List</h2>
         <br>

    <div class="orderList">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="493px">
            <Columns>
                <asp:BoundField DataField="c_name" HeaderText="Name" SortExpression="c_name" />
                <asp:BoundField DataField="b_title" HeaderText="Title" SortExpression="b_title" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" SelectCommand="SELECT * FROM [orderList]"></asp:SqlDataSource>
        
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
            SelectCommand="SELECT * FROM [orderList]"></asp:SqlDataSource>
    </p>
</asp:Content>
