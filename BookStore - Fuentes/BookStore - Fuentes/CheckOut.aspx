<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="BookStore___Fuentes.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .pageTitle
    {
        padding: 7px;
            text-align: center;
            width:800px;
             margin: 0 auto;
             margin-top: 10px;
    }

    .shopCart
    {
        width: 800px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
    }
    .shipAdd
    {
        width: 500px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
    }
    .orderDetails
    {
          width: 500px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
    }
    .ordDetails
    {
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
</style>
    <p>
    <asp:Button ID="LogOutBnt" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />

     <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/TransactionPage.aspx" 
    style="font-size: 25px;">Back</asp:HyperLink>

    <br>
    <br><div id="pTitle" runat=server visible=true>
        <h1 id="pageTitle" class="pageTitle" runat=server Visible=true>Shopping Cart</h1>
    <div id="shopCart" runat=server class="shopCart">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="isbn" DataSourceID="SqlDataSource1" 
            OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="isbn" HeaderText="ISBN" ReadOnly="True" 
                    SortExpression="isbn" />
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                <asp:BoundField DataField="author" HeaderText="Author" 
                    SortExpression="author" />
                <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" />
                <asp:BoundField DataField="i_type" HeaderText="Type" 
                    SortExpression="i_type" />
                <asp:BoundField DataField="qty" HeaderText="Quantity" SortExpression="qty" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
            SelectCommand="SELECT * FROM [BookCart]"
             DeleteCommand="DELETE FROM [BookCart] WHERE [isbn] = @isbn">
    <DeleteParameters>
        <asp:Parameter Name="isbn" Type="String" />
    </DeleteParameters>
            </asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="okBnt" runat="server" OnClick="okBnt_Click" Visible=true Text="Buy now" />
        <asp:Button ID="clearBnt" runat="server" OnClick="clearBnt_Click" Visible=true 
            Text="Clear" />

    </p>
        <p>

  <div id="divCheckoutDetails" runat="server" visible="false">
 <div id="first" class="shipAdd" runat="server" visible="false" style="display: flex; flex-direction: column;">
    <div style="margin-bottom: 10px; ">
        <asp:Label ID="numBooks" runat="server" Text="<b>Number of Books: "></asp:Label>
        <asp:Label ID="totalQty" runat="server" Text="totalQty" style="margin-left: 10px;"></asp:Label>
    </div>
    <div style="margin-bottom: 10px;">
        <asp:Label ID="total" runat="server" Text="<b>Total Price: "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="TotalPrice" runat="server" Text="TotalPrice" style="margin-left: 10px;"></asp:Label>
    </div>
    <div>
         <b>Shipping Address:</b>
        <asp:TextBox ID="shippingAdd" runat="server" style="margin-left: 10px;" 
             Height="16px"></asp:TextBox>
    </div>
</div>

    </p>
        <p>
           
            <asp:Button ID="OrderBnt" runat="server" OnClick="OrderBnt_Click" 
            Text="Place Order" Visible=true/>
            <div id="divPlaceOrder" runat="server" visible="false">
    </p></div>
        <p>

   <div id="Second" class="orderDetails" runat=server style="display: flex; flex-direction: column;" visible=true>
   <h2 class="ordDetails" id="ordDetails" runat=server>Order Details</h2>
       <h3 style="display: inline;">
           <br />
           Date Ordered:</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="date" runat="server" Text="date" style="display: inline;"></asp:Label>
    <p><h3 style="display: inline;">Name:</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="name" runat="server" Text="Label" style="display: inline;"></asp:Label>
    <p><h3 style="display: inline;">Number of Books:</h3>&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Label" style="display: inline;"></asp:Label>
    <p><h3 style="display: inline;">BookBooks Ordered:</h3>
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="5" ReadOnly="true" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
      <p><h3 style="display: inline;">Shipping Address:>&nbsp;
        <asp:Label ID="Label2" runat="server" Text="shipAdd" style="display: inline;"></asp:Label>
    <p><h3 style="display: inline;">Total Price:</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Label" style="display: inline;"></asp:Label>
  
</div>


        <asp:Button ID="okss" runat="server" Text="Ok" OnClick="okss_Click" Visible=true />
    </p>
    </p>
    </div>
    </div>

</asp:Content>
