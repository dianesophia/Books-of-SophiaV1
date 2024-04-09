<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransactionPage.aspx.cs" Inherits="BookStore___Fuentes.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        .addNewItems {
            padding: 7px;
            background-color: #348494;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            border-bottom-color: black;
            text-align: center;
            width:500px;
             margin: 0 auto;
             margin-top: 10px;
             box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .hello-text
        {
            font-size: 35px;
            color: #348494;
            font-weight: bold;
        }
        #cusName {
            font-size: 20px; 
            font-weight: bold; 
        }

        .availableItems
        {
              width: 850px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
        }
        .cusCart
        {
            width: 700px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
        }
        .avaItems
        {
            text-align: center;
    margin-bottom: 20px;
        }
        .bookDetails
        {
           width: 450px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
             border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
        }
        .customerCartG
        {
             width: 800px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
             border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
        }

</style>
    

<asp:Button ID="LogOutBnt" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
    <asp:Button ID="Button1" class="logOut" runat="server" Text="Customer Cart" 
        style="text-align: right; border-radius: 20px; background-color: #348494; padding: 10px; color: black; float: right;" 
        OnClick="cartBnt_Click" />



 <h3 class="hello-text">Hello,
        <asp:Label ID="cusName" runat="server" Text="Label"></asp:Label>
        :)
    </h3>
    <p> &nbsp;</p>
    <h1 class="avaItems">Available Items</h1>
  <div class="availableItems">
    <h3> Select items to add to cart</h3>
    <p> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="i_id" DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="i_id" HeaderText="i_id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="i_id" Visible="False" />
                <asp:BoundField DataField="isbn" HeaderText="ISBN" SortExpression="isbn" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="Author" 
                    SortExpression="author" />
                <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:BoundField DataField="i_Type" HeaderText="Type" 
                    SortExpression="i_Type" />
                <asp:BoundField DataField="qty" HeaderText="Stock" SortExpression="qty" />
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
            SelectCommand="SELECT * FROM [Items]"></asp:SqlDataSource>
    </p></div>
    <p>
    <p>
      <div class="box">  <div class="inputItems"><h2 class="addNewItems">Item Details</h2> </div>
    <div class="bookDetails">
        <asp:Label ID="isbn" runat="server" Text="ISBN"></asp:Label>
    <p> 
        <asp:Label ID="title" runat="server" Text="Title"></asp:Label>
    </p>
    <p> 
        <asp:Label ID="author" runat="server" Text="Author"></asp:Label>
    </p>
    <p> 
        <asp:Label ID="genre" runat="server" Text="Genre"></asp:Label>
    </p>
    <p> 
        <asp:Label ID="price" runat="server" Text="Type"></asp:Label>
    </p>
    <p> 
        <asp:Label ID="type" runat="server" Text="Price"></asp:Label>
    </p>
    <p> 
        <asp:TextBox ID="quantity" runat="server" Enabled="false" 
            OnTextChanged="quantity_TextChanged" placeholder="Quantity"  onkeypress="return isNumberKey(event)"></asp:TextBox>
    <p> 

        <asp:Button ID="addBnt" runat="server" OnClick="addBnt_Click" 
            Text="Add to cart" />
        <asp:Button ID="cancelBnt" runat="server" OnClick="cancelBnt_Click" 
            Text="Cancel" />
    </p>
    </div>
    <p> &nbsp;</p>
    
</asp:Content>
