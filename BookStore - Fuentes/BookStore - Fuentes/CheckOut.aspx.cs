using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BookStore___Fuentes
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void CalculateTotalPrice()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT SUM(price) AS TotalPrice, SUM(qty) AS TotalQuantity FROM BookCart";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        decimal totalPrice;
                        int totalQuantity;

                        if (reader["TotalPrice"] != DBNull.Value && decimal.TryParse(reader["TotalPrice"].ToString(), out totalPrice))
                        {
                            TotalPrice.Text = "₱" + totalPrice.ToString();
                        }
                        else
                        {
                            TotalPrice.Text = "₱ 0.00";
                        }

                        if (reader["TotalQuantity"] != DBNull.Value && int.TryParse(reader["TotalQuantity"].ToString(), out totalQuantity))
                        {
                            totalQty.Text = totalQuantity.ToString();
                        }
                        else
                        {
                            totalQty.Text = "0"; 
                        }
                    }
                    else
                    {
                        total.Text = "₱ 0.00";
                        totalQty.Text = "0";
                    }
                }
            }
        }

        private int GetCustomerId()
        {
            return Session["CustomerId"] != null ? Convert.ToInt32(Session["CustomerId"]) : -1;
        }


        protected void OrderBnt_Click(object sender, EventArgs e)
        {
            int customerId = GetCustomerId();
            string shippingAddress = shippingAdd.Text;
            DateTime currentDate = DateTime.Now;

            GridView1.DataSource = null;
            GridView1.DataBind();
            GridView1.Visible = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT c_name FROM Customer WHERE c_id = @CustomerId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        string customerName = reader["c_name"].ToString();

                        date.Text = currentDate.ToString("yyyy-MM-dd");
                        Label2.Text = shippingAddress;
                        Label3.Text = totalQty.Text;
                        Label4.Text = TotalPrice.Text;
                        name.Text = customerName;

                        int numBook;
                        if (!int.TryParse(Label3.Text, out numBook))
                        {
                            numBook = 0;
                        }

                        decimal totalPrice;
                        string totalPriceText = Label4.Text.Replace("₱", string.Empty);
                        if (!decimal.TryParse(totalPriceText, out totalPrice))
                        {
                            totalPrice = 0;
                        }

                        string orderDate = currentDate.ToString("yyyy-MM-dd");

                        // Insert into TransHistory table
                        using (SqlConnection insertConnection = new SqlConnection(connectionString))
                        {
                            string insertQuery = "INSERT INTO TransHistory (orderDate, numBook, totalPrice, Shipping_add, c_name) " +
                                                 "VALUES (@OrderDate, @NumBook, @TotalPrice, @ShippingAddress, @CustomerName)";

                            using (SqlCommand insertCommand = new SqlCommand(insertQuery, insertConnection))
                            {
                                insertCommand.Parameters.AddWithValue("@OrderDate", orderDate);
                                insertCommand.Parameters.AddWithValue("@NumBook", numBook);
                                insertCommand.Parameters.AddWithValue("@TotalPrice", totalPrice);
                                insertCommand.Parameters.AddWithValue("@ShippingAddress", shippingAddress);
                                insertCommand.Parameters.AddWithValue("@CustomerName", customerName); // Adding customerName parameter

                                insertConnection.Open();
                                int rowsAffected = insertCommand.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Successfully inserted into TransHistory table
                                    // You might want to show a success message or perform additional actions here
                                }
                                else
                                {
                                    // Handle the case where insertion failed
                                }
                            }
                        }
                        // Insert into orderList table
                        using (SqlConnection orderListConnection = new SqlConnection(connectionString))
                        {
                            string insertOrderQuery = "INSERT INTO orderList (c_name, b_title, Quantity) " +
                                                      "SELECT @CustomerName, title, qty FROM BookCart WHERE isbn IN (SELECT isbn FROM BookCart)";

                            using (SqlCommand insertCommand = new SqlCommand(insertOrderQuery, orderListConnection))
                            {
                                insertCommand.Parameters.AddWithValue("@CustomerName", customerName);

                                orderListConnection.Open();
                                int rowsAffected = insertCommand.ExecuteNonQuery();

                                if (rowsAffected > 0)
                                {
                                    // Successfully inserted into orderList table
                                    // You might want to show a success message or perform additional actions here
                                }
                                else
                                {
                                    // Handle the case where insertion failed
                                }
                                orderListConnection.Close();
                            }
                        }

                        DeductBookCartFromItems();
                        DisplayBookTitlesInTextBox();
                        divPlaceOrder.Visible = true;

                        // Clear the BookCart table after placing the order
                        ClearBookCart();
                        first.Visible = false;
                        pageTitle.Visible = false;
                        shopCart.Visible = false;
                        okBnt.Visible = false;
                        clearBnt.Visible = false;
                        OrderBnt.Visible = false;
                        Second.Visible = true;
                        okss.Visible = true;
                    }
                    else
                    {
                        // Handle case where customer data retrieval failed
                    }
                }
            }
        }







 

        protected void ClearBookCart()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string deleteQuery = "DELETE FROM BookCart";

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // BookCart table cleared successfully
                    }
                    else
                    {
                        // Handle the case where deletion failed
                    }
                }
            }
        }

        protected void okBnt_Click(object sender, EventArgs e)
        {
            if (IsBookCartEmpty())
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "emptyCartAlert", "alert('Shopping cart is empty');", true);
                divCheckoutDetails.Visible = false;
            }
            else
            {
                CalculateTotalPrice();
                divCheckoutDetails.Visible = true;
                first.Visible = true;
                Second.Visible = false;
                okss.Visible = false;
            }

        }

        protected bool IsBookCartEmpty()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM BookCart";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    int cartItemCount = (int)command.ExecuteScalar();

                    return cartItemCount == 0; 
                }
            }
        }

        protected void okss_Click(object sender, EventArgs e)
        {
            Response.Redirect("LastPage.aspx");
        }

        protected void DisplayBookTitlesInTextBox()
        {
            string bookTitles = "";
            if (GridView1.Rows.Count > 0)
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    string title = row.Cells[1].Text; 
                    bookTitles += title + Environment.NewLine; 
                }

                TextBox1.Text = bookTitles;
                TextBox1.Rows = GridView1.Rows.Count; 
            }
            else
            {
                TextBox1.Text = "No books in the cart."; 
                TextBox1.Rows = 5;
            }
        }

        protected void DeleteItemFromCart(string isbn)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string deleteQuery = "DELETE FROM BookCart WHERE isbn = @Isbn";

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@Isbn", isbn);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Item successfully deleted from the cart
                    }
                    else
                    {
                        // Handle the case where deletion failed
                    }
                }
            }
        }
        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string isbn = ((sender as Button).NamingContainer.FindControl("isbnLabel") as Label).Text;
            DeleteItemFromCart(isbn);
            GridView1.DataBind();
        }

        protected void clearBnt_Click(object sender, EventArgs e)
        {
            ClearBookCart();
            GridView1.Visible = false;
        }

        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private void DeductBookCartFromItems()
        {
            string query = "SELECT isbn, qty FROM BookCart";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    while (reader.Read())
                    {
                        string isbn = reader["isbn"].ToString();
                        int quantityInCart = Convert.ToInt32(reader["qty"]);

                        DeductQuantityFromItemsTable(isbn, quantityInCart);
                    }

                    reader.Close();
                }
            }
        }
        private void DeductQuantityFromItemsTable(string isbn, int quantityToDeduct)
        {
            string updateQuery = "UPDATE Items SET qty = qty - @QuantityToDeduct WHERE isbn = @Isbn";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(updateQuery, connection))
            {
                command.Parameters.AddWithValue("@QuantityToDeduct", quantityToDeduct);
                command.Parameters.AddWithValue("@Isbn", isbn);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           // if("Data Structures and Algorithms")
        }
    }
}

