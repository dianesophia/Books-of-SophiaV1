<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Items.aspx.cs" Inherits="BookStore___Fuentes.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
   
    <style>
        body {
          background-color: white;
          overflow-x: scroll;

        }

       .logOut {
    text-align: right;
    border-radius: 20px;
    background-color: #D5C6C3;
    padding: 20px;
}

        .addNewItems {
             padding:10px;
             background-color:#348494;
             border-top-right-radius: 15px;
             border-top-left-radius: 15px;
             border-bottom-color: black;
             width: 895px;
        }
        .box {
         
         width: 900px;
            padding: 20px;
            margin-left: 165px;
        
        }

        .GridViewEditRow input[type=text] {
          width:70px;
          height: 50%;
          font-size:12px;
        }
        .itemTitle
        {
            font-size: 40px;
            color: #348494;
            font-weight: bold;
            text-align: center;
        }
        .ItemsTable
        {
             width: 1000px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
        }
        </style>
<asp:Button ID="LogOutBnt" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
<asp:Button ID="transHistory" runat="server" Text="Transaction History" 
        style="border-style: none; border-color: inherit; border-width: medium; background-color: #9e3641; color: black; padding: 12px 24px; border-radius: 20px; float: right; margin-left: 21;" 
        Width="217px" OnClick="transHistory_Click" Height="48px" />
          <asp:Button ID="Button4" runat="server" Text="Order List" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="orderList_Click" Height="49px" />
<asp:Button ID="Customers" runat="server" Text="Customer Page" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="Customers_Click" Height="49px" />

 <h2 class="itemTitle">&nbsp;</h2>
    <h2 class="itemTitle">Items</h2>
 <p>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input id="itemsSearch" type="text" runat="server" style="text-align:left" />&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchBntItems" runat="server" Text="Search" Width="103px" OnClick="searchBntItems_Click" style="text-align:left; background-color: #348494; color: black; border: none; padding: 10px 20px; border-radius: 15px; font-size: 16px; cursor: pointer;" />
<div class="ItemsTable">
   <div style="display: flex; align-items: center;">
       
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="i_id" DataSourceID="SqlDataSource2"   
        EnableHorizontalScrollbar="true" 
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="i_id" HeaderText="i_id" InsertVisible="False" ReadOnly="True" SortExpression="i_id" Visible="False" />
            <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
            <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
            <asp:BoundField DataField="author" HeaderText="Author" SortExpression="author" />
            <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
            <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
            <asp:BoundField DataField="i_Type" HeaderText="Type" 
                SortExpression="i_Type" />
            <asp:BoundField DataField="qty" HeaderText="Stock" SortExpression="qty" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="White" CssClass="GridViewEditRow"/>
    </asp:GridView>
    </div>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
        SelectCommand="SELECT [i_id], [isbn], [title], [author], [genre], [price], [i_type],[qty] FROM [Items]"
           DeleteCommand="DELETE FROM [Items] WHERE [i_id] = @i_id"
        UpdateCommand="UPDATE [Items] SET [isbn] = @isbn, [title] = @title, [author] = @author, [genre] = @genre, [price] = @price, [i_type] = @i_type,[qty] = @qty WHERE [i_id] = @i_id">
    <DeleteParameters>
        <asp:Parameter Name="i_id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="isbn" Type="Int32" />
        <asp:Parameter Name="title" Type="String" />
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="genre" Type="String" />
        <asp:Parameter Name="price" Type="decimal" />
        <asp:Parameter Name="i_type" Type="String" />
        <asp:Parameter Name="i_id" Type="Int32" />
        <asp:Parameter Name="qty" Type="Int32" />
    </UpdateParameters>
          
          
      </asp:SqlDataSource>
      <br />
      <br />
      <h2 class="addNewItems"> Add New Items</h2> </div>
  <div class="box">  <div class="inputItems">
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ISBN:&nbsp;&nbsp;&nbsp;
    <input id="inputISBN" type="text" runat="server" /></h4>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="ISBNValidator" runat="server"
    ControlToValidate="inputISBN"
    ErrorMessage="Please enter a valid ISBN (numeric only)"
    ValidationExpression="\d+">
</asp:RegularExpressionValidator>
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Title:&nbsp;&nbsp;
    <input id="inputTitle" type="text" runat="server"/></h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Author:&nbsp;&nbsp; </h4<>
    <input id="inputAuthor" type="text" runat="server"/><br />
    </h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Genre:&nbsp;
<input id="inputGenre" type="text" runat="server"/></h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price:&nbsp;&nbsp;
<input id="inputPrice" type="text" runat="server"/></h4>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ControlToValidate="inputPrice"
    ErrorMessage="Please enter a valid Price (numeric only)"
    ValidationExpression="^\d+(\.\d+)?$">
</asp:RegularExpressionValidator>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; Type:&nbsp;
<input id="inputType" type="text" runat="server"/></h4><br />
 <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quantity:&nbsp; <input id="inputQty" type="text" runat="server"/></h4><br />
    <br />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    <asp:Button ID="addBntItems" runat="server" Text="Submit" Width="117px" OnClick="addBntItems_Click"  style="background-color: #348494; color: black; border: none; padding: 10px 20px; border-radius: 15px; font-size: 16px; cursor: pointer;" />
      &nbsp;<asp:Button ID="cancelBnt" runat="server" OnClick="cancelBnt_Click" Text="Cancel" Width="131px" />
      <br />
      <br />
      <br /></div>
</asp:Content>
