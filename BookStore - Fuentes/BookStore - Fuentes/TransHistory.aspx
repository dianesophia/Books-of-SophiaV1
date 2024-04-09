<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransHistory.aspx.cs" Inherits="BookStore___Fuentes.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">

<style>
    .tranHis
    {
        margin:auto;
        font-size: 30px;
        text-align: center; 
    }
    .transTable{
         width: 659px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
    }
</style>

   <asp:Button ID="Button1" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
        <asp:Button ID="Button4" runat="server" Text="Order List" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="orderList_Click" Height="49px" />
<asp:Button ID="Button2" runat="server" Text="Items" 
        style="border-style: none; border-color: inherit; border-width: medium; background-color: #9e3641; color: black; padding: 12px 24px; border-radius: 20px; float: right; margin-left: 21;" 
        Width="160px" OnClick="items_Click" Height="48px" />
<asp:Button ID="Button3" runat="server" Text="Customer Page" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="Customers_Click" Height="49px" />
        
        <br>
        <br>
<h1 class="tranHis">&nbsp;</h1>
    <h1 class="tranHis">Transaction History</h1>
     <div class="transTable">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" Width="673px">
        <Columns>
            <asp:BoundField DataField="orderDate" HeaderText="Date" 
                SortExpression="orderDate" />
            <asp:BoundField DataField="c_name" HeaderText="Customer Name" 
                SortExpression="c_name" />
            <asp:BoundField DataField="numBook" HeaderText="Number of Books" 
                SortExpression="numBook" />
            <asp:BoundField DataField="totalPrice" HeaderText="Total Price" 
                SortExpression="totalPrice" />
            <asp:BoundField DataField="Shipping_add" HeaderText="Shipping Address" 
                SortExpression="Shipping_add" />
        </Columns>
    </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
        SelectCommand="SELECT * FROM [TransHistory]"></asp:SqlDataSource>
    <p>
    </p>
</asp:Content>

