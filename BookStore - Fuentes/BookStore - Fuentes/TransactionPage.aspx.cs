using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BookStore___Fuentes
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = Session["CartData"] as DataTable;
                int customerId = GetCustomerId();
                string customerName = GetCustomerName(customerId);
                cusName.Text = customerName;
            }
        }


        protected void clearCells()
        {
            isbn.Text = "ISBN";
            title.Text = "Book Title";
            author.Text = "Book Author";
            genre.Text = "Book Genre";
            price.Text = "Book Price";
            type.Text = "Book Type";
            quantity.Text = string.Empty;
        }


        protected void addBnt_Click(object sender, EventArgs e)
        {

            int quantityToAdd;
            if (!int.TryParse(quantity.Text, out quantityToAdd) || quantityToAdd > 50 || quantityToAdd <= 0)
            {
                string alertScript = "alert('Please enter a valid quantity between 1 and Item stock.');";
                alertScript += "document.getElementById('" + quantity.ClientID + "').value = '';"; 
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidQuantityAlert", alertScript, true);
                return;
            }

            int availableQuantity = GetAvailableQuantity(isbn.Text);

            if (quantityToAdd > availableQuantity)
            {
              /*  string alertScript = "alert('Quantity exceeds available quantity.');";
                alertScript += "document.getElementById('" + quantity.ClientID + "').value = '';";
                ScriptManager.RegisterStartupScript(this, GetType(), "InsufficientQuantityAlert", alertScript, true);
                return;*/
            }

            int temp;
            if (!int.TryParse(quantity.Text, out temp))
            {
                Response.Write("<script>alert('Please enter a valid quantity.');</script>");
                return;
            }
            else if (temp <= 0)
            {
                Response.Write("<script>alert('Please enter a valid quantity greater than zero.');</script>");
                return;
            }
            int tempQuantity = temp;
            if (tempQuantity > availableQuantity)
            {
                Response.Write("<script>alert('Entered quantity exceeds available stock. Available stock: " + availableQuantity + "');</script>");
                return;
            }
            if (quantityToAdd > availableQuantity)
            {
                // Quantity exceeds available quantity
                string alertScript = "alert('Quantity exceeds available quantity.');";
                alertScript += "document.getElementById('" + quantity.ClientID + "').value = '';";
                ScriptManager.RegisterStartupScript(this, GetType(), "InsufficientQuantityAlert", alertScript, true);
                return;
            }
            else if (quantityToAdd <= 0)
            {
                // Quantity is zero or negative
                string alertScript = "alert('Please enter a valid quantity greater than zero.');";
                alertScript += "document.getElementById('" + quantity.ClientID + "').value = '';";
                ScriptManager.RegisterStartupScript(this, GetType(), "InvalidQuantityAlert", alertScript, true);
                return;
            }
            else
            {
                // Proceed to add the item to the cart
                // ... (Your existing logic to add the item to the cart goes here)
            }


            DataTable dt;
            if (Session["CartData"] == null)
            {
                dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[]
        {
            new DataColumn("isbn", typeof(string)),
            new DataColumn("title", typeof(string)),
            new DataColumn("author", typeof(string)),
            new DataColumn("genre", typeof(string)),
            new DataColumn("i_type", typeof(string)),
            new DataColumn("qty", typeof(int)),
            new DataColumn("price", typeof(decimal))
        });
                Session["CartData"] = dt;
            }
            else
            {
                dt = (DataTable)Session["CartData"];
            }

            DataRow newRow = dt.NewRow();
            newRow["isbn"] = isbn.Text;
            newRow["title"] = title.Text;
            newRow["author"] = author.Text;
            newRow["genre"] = genre.Text;
            newRow["i_type"] = type.Text;
            newRow["qty"] = quantityToAdd;
            newRow["price"] = Convert.ToDecimal(price.Text) * quantityToAdd;

            dt.Rows.Add(newRow);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string checkExistingQuery = "SELECT COUNT(*) FROM BookCart WHERE isbn = @isbn";

                using (SqlCommand checkCommand = new SqlCommand(checkExistingQuery, connection))
                {
                    checkCommand.Parameters.AddWithValue("@isbn", newRow["isbn"]);

                    int existingCount = (int)checkCommand.ExecuteScalar();

                    if (existingCount == 0)
                    {
                        string insertQuery = "INSERT INTO BookCart (isbn, title, author, genre, i_type, qty, price) " +
                                            "VALUES (@isbn, @title, @author, @genre, @i_type, @qty, @price)";

                        using (SqlCommand command = new SqlCommand(insertQuery, connection))
                        {
                            command.Parameters.AddWithValue("@isbn", newRow["isbn"]);
                            command.Parameters.AddWithValue("@title", newRow["title"]);
                            command.Parameters.AddWithValue("@author", newRow["author"]);
                            command.Parameters.AddWithValue("@genre", newRow["genre"]);
                            command.Parameters.AddWithValue("@i_type", newRow["i_type"]);
                            command.Parameters.AddWithValue("@qty", newRow["qty"]);
                            command.Parameters.AddWithValue("@price", newRow["price"]);

                            try
                            {
                                command.ExecuteNonQuery();
                            }
                            catch (SqlException ex)
                            {
                                if (ex.Number == 2627)
                                {
                                }
                                else
                                {
                                }
                            }
                        }
                    }
                    else
                    {
                    }
                }
            }

            clearCells();
           // DeductBookCartFromItems();
            Response.Redirect("CheckOut.aspx");
        }


        private void DeductQuantityFromDatabase(int bookId, int quantityToDeduct)
        {
            string updateQuery = "UPDATE Items SET qty = qty - @QuantityToDeduct WHERE i_id = @BookId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(updateQuery, connection))
            {
                command.Parameters.AddWithValue("@QuantityToDeduct", quantityToDeduct);
                command.Parameters.AddWithValue("@BookId", bookId);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }



        protected void cancelBnt_Click(object sender, EventArgs e)
        {
            clearCells();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            if (row != null)
            {
                if (row.Cells.Count >= 7) 
                {
                    int isbnBox;
                    if (int.TryParse(row.Cells[1].Text, out isbnBox))
                    {
                        string itemTitle = row.Cells[2].Text;
                        string itemAuthor = row.Cells[3].Text;
                        string itemGenre = row.Cells[4].Text;
                        string itemPrice = row.Cells[5].Text;
                        string itemType = row.Cells[6].Text;

                        isbn.Text = isbnBox.ToString();
                        title.Text = itemTitle;
                        author.Text = itemAuthor;
                        genre.Text = itemGenre;
                        price.Text = itemPrice;
                        type.Text = itemType;
                        quantity.Enabled = true;
                    }
                    else
                    {
                        // Handle invalid ISBN
                    }
                }
                else
                {
                    // Handle insufficient cells in the row
                }
            }
        }

        protected void NextBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrdersPage.aspx");
        }

        protected void clearBnt_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[]
    {
        new DataColumn("isbn", typeof(string)),
        new DataColumn("title", typeof(string)),
        new DataColumn("author", typeof(string)),
        new DataColumn("genre", typeof(string)),
        new DataColumn("i_type", typeof(string)),
        new DataColumn("qty", typeof(int)),
        new DataColumn("price", typeof(decimal))
    });

            Session["CartData"] = dt;
            clearCells();
    
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string clearQuery = "TRUNCATE TABLE BookCart";

                using (SqlCommand command = new SqlCommand(clearQuery, connection))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

        private void DeleteFromBookCart(string isbn)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string deleteQuery = "DELETE FROM BookCart WHERE isbn = @Isbn";

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@Isbn", isbn);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            BindCustomerCart();
        }
        private void DeleteFromCustomerCart(string isbn)
        {
            DataTable dt = Session["CartData"] as DataTable;
            if (dt != null)
            {
                DataRow[] rowsToDelete = dt.Select("isbn = '" + isbn + "'");
                foreach (DataRow row in rowsToDelete)
                {
                    dt.Rows.Remove(row);
                }
            }
        }

        private void BindCustomerCart()
        {
            DataTable dt = Session["CartData"] as DataTable;
            if (dt != null)
            {
            }
        }

        protected void quantity_TextChanged(object sender, EventArgs e)
        {

        }
        private int GetAvailableQuantity(string isbn)
        {
            int availableQuantity = 0;
            string query = "SELECT qty FROM Items WHERE isbn = @ISBN";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ISBN", isbn); 

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        availableQuantity = Convert.ToInt32(reader["qty"]);
                    }

                    reader.Close();
                }
            }

            return availableQuantity;
        }

        private int GetCustomerId()
        {
            if (Session["CustomerId"] != null)
            {
                return Convert.ToInt32(Session["CustomerId"]);
            }
            else
            {
                return -1; 
            }
        }

        private string GetCustomerName(int customerId)
        {
            string customerName = string.Empty;
            string query = "SELECT c_name FROM Customer WHERE c_id = @CustomerId";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        customerName = reader["c_name"].ToString();
                    }

                    reader.Close();
                }
            }

            return customerName;
        }

        private int GetAvailableQuantityFromDatabase(string isbn)
        {
            int availableQuantity = 0;
            string query = "SELECT qty FROM Items WHERE isbn = @isbn";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@isbn", isbn);

                    connection.Open();
                    var result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        availableQuantity = Convert.ToInt32(result);
                    }
                }
            }

            return availableQuantity;
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
     


        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void cartBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckOut.aspx");
        }


    }
}