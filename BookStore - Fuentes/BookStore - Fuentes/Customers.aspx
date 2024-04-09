<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="BookStore___Fuentes.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
  
   <style>
        /* CSS for the form layout */
        .form-container {
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        /* CSS for the input fields */
        input[type="text"] {
            width: 250px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        /* CSS for the buttons */
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .addNew {
          padding: 5px;
        }
        .newCus {
           background-color:#348494;
           border-radius: 15px;
        }

        .box {
        padding: 50px;
        }
       /* .box1 {
           background-color: aliceblue;
        }*/

        .styledButton {
  background-color: aliceblue; /* Change this color to your preference */
  color: black; /* Text color */
  border: none;
  padding: 10px 20px;
  font-size: 18px;
  cursor: pointer;
     width: 800px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
             border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
}

.styledButton:hover {
  background-color: #348494;
}
       .customersTable
       {
              width: 800px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.8);
            border-radius:15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 0 auto;
       }
       .cusTitle
       {
           font-size: 35px;
            color: #348494;
            font-weight: bold;
            text-align: center;
       }
       .search-container
       {
           text-align: right; 
           margin-right: 20px;
       }
        .GridViewEditRow input[type=text] {
          width:90px;
          height: 50%;
          font-size:12px;
        }
       
    </Style>
    <asp:Button ID="LogOutBnt" class="logOut" runat="server" Text="Log out" 
        style="text-align: right; border-radius: 20px; background-color: #D5C6C3; padding: 10px; color: black; float: right;" 
        OnClick="LogOutBnt_Click" />
   <asp:Button ID="transHistory" runat="server" Text="Transaction History" 
        style="border-style: none; border-color: inherit; border-width: medium; background-color: #9e3641; color: black; padding: 12px 24px; border-radius: 20px; float: right; margin-left: 21;" 
        Width="217px" OnClick="transHistory_Click" Height="48px" />
     <asp:Button ID="Button4" runat="server" Text="Order List" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="orderList_Click" Height="49px" />
    <asp:Button ID="Items" runat="server" Text="Items Page" 
        style="background-color: #9e3641; border: none; color: black; padding: 12px 24px; border-radius: 20px; float: right;" 
        Width="172px" OnClick="Items_Click" Height="49px" />
   
    <br />

            <h1 class="cusTitle">&nbsp;</h1>
    <h1 class="cusTitle">CUSTOMER PAGE</h1>
            <div class="search-container">
        <input id="searchCustomer" type="text"  runat="server"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="searchBntCustomer" runat="server" Text="Search" Width="103px" OnClick="searchBntCustomer_Click" style="background-color: #348494; color: black; border: none; padding: 10px 20px; border-radius: 15px; font-size: 16px; cursor: pointer;"/>
   </div>
    <br />
   
   <div class="customersTable">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="c_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="c_id" HeaderText="c_id" InsertVisible="False" 
                ReadOnly="True" SortExpression="c_id" Visible="False" />
                <asp:BoundField DataField="c_name" HeaderText="Name" 
                SortExpression="c_name" />
            <asp:BoundField DataField="c_email" HeaderText="Email" 
                SortExpression="c_email" />
            <asp:BoundField DataField="c_address" HeaderText="Address" 
                SortExpression="c_address" />
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
         <EditRowStyle BackColor="White" CssClass="GridViewEditRow"/>
    </asp:GridView>

    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FuentesConnectionString %>" 
        SelectCommand="SELECT [c_id], [c_name], [c_email], [c_address] FROM [Customer]"
    DeleteCommand="DELETE FROM [Customer] WHERE [c_id] = @c_id"
        UpdateCommand="UPDATE [Customer] SET [c_name] = @c_name, [c_email] = @c_email, [c_address] = @c_address WHERE [c_id] = @c_id">
    <DeleteParameters>
        <asp:Parameter Name="c_id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="c_name" Type="String" />
        <asp:Parameter Name="c_email" Type="String" />
        <asp:Parameter Name="c_address" Type="String" />
        <asp:Parameter Name="c_id" Type="Int32" />
    </UpdateParameters>
    </asp:SqlDataSource>



  
    <br />
    <br />
    <br />
    <div class="box1">
 <div class="inputs"><div class="newCus">  <h2 class="addNew"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add New Customer</h2> </div>
 </div class="box">&nbsp;<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input id="inputName" type="text"  runat="server" />&nbsp;&nbsp;&nbsp; </h4>
        <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input id="inputEmail" type="text" runat="server" /></h4>
        <asp:RegularExpressionValidator ID="emailValidator" runat="server"
    ControlToValidate="inputEmail"
    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
    ErrorMessage="Please enter a valid email address."
    Display="Dynamic" />
<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address:&nbsp;&nbsp;&nbsp;
<input id="inputAddress" type="text" runat="server" /></h4>&nbsp;&nbsp;
<br />
<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="submitCus" runat="server" Text="Submit" Width="116px" OnClick="submitCus_Click" style="background-color: #348494; color: black; border: none; padding: 10px 20px; border-radius: 15px; font-size: 16px; cursor: pointer;" />

        <asp:Button ID="Cancel" runat="server" OnClick="Cancel_Click" Text="Cancel" Width="107px" />

    <br />
        <br />
        <br />
    <br />
    </div></div>
    </div>

    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
