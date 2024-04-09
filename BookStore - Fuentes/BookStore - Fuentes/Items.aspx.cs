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
    public partial class WebForm2 : System.Web.UI.Page
    {

        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void searchBntItems_Click(object sender, EventArgs e)
        {
            string searchCriteria = itemsSearch.Value;

            SqlDataSource2.FilterExpression = "CONVERT(isbn, 'System.String') LIKE '%" + searchCriteria + "%' OR title LIKE '%" + searchCriteria + "%' OR author LIKE '%" + searchCriteria + "%' OR genre LIKE '%" + searchCriteria + "%' OR CONVERT(price, 'System.String') LIKE '%" + searchCriteria + "%' OR i_type LIKE '%" + searchCriteria + "%'";

            GridView1.DataBind();
        }

        protected void addBntItems_Click(object sender, EventArgs e)
        {
            int isbn = Convert.ToInt32(inputISBN.Value);
            string title = inputTitle.Value;
            string author = inputAuthor.Value;
            string genre = inputGenre.Value;
            decimal price = Convert.ToDecimal(inputPrice.Value); 
            string i_type = inputType.Value;
            int qty;

            if (int.TryParse(inputQty.Value, out qty))
            {
                string insertQuery = "INSERT INTO Items (isbn, title, author, genre, price, i_type, qty) VALUES (@Isbn, @Title, @Author, @Genre, @Price, @IType, @Qty)";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@Isbn", isbn);
                        command.Parameters.AddWithValue("@Title", title);
                        command.Parameters.AddWithValue("@Author", author);
                        command.Parameters.AddWithValue("@Genre", genre);
                        command.Parameters.AddWithValue("@Price", price);
                        command.Parameters.AddWithValue("@IType", i_type);
                        command.Parameters.AddWithValue("@Qty", qty);

                        try
                        {
                            int rowsAffected = command.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                }

                GridView1.DataBind();
                clear();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int isbn = Convert.ToInt32(e.Keys["isbn"]);
            string title = e.NewValues["title"].ToString();
            string author = e.NewValues["author"].ToString();
            string genre = e.NewValues["genre"].ToString();
            decimal price = Convert.ToDecimal(e.Keys["price"]);
            string type = e.NewValues["i_type"].ToString();
            int itemsId = Convert.ToInt32(e.Keys["i_id"]);
            int qty = Convert.ToInt32(e.NewValues["qty"]); 

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE Items SET isbn = @ISBN, title = @Title, author = @Author, genre = @Genre, price = @Price, type = @Type, qty = @Qty WHERE i_id = @ItemsId";
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@ISBN", isbn);
                    command.Parameters.AddWithValue("@Title", title);
                    command.Parameters.AddWithValue("@Author", author);
                    command.Parameters.AddWithValue("@Genre", genre);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Type", type);
                    command.Parameters.AddWithValue("@Qty", qty);
                    command.Parameters.AddWithValue("@ItemsId", itemsId);

                    int rowsAffected = command.ExecuteNonQuery();
                }
            }

            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int itemId = Convert.ToInt32(e.Keys["i_id"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string deleteQuery = "DELETE FROM Items WHERE i_id = @ItemsId";
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@ItemsId", itemId);

                    int rowsAffected = command.ExecuteNonQuery();
                }
            }

            GridView1.DataBind();
        }

        protected void cancelBnt_Click(object sender, EventArgs e)
        {
           /* inputISBN.Value = "";
            inputTitle.Value = "";
            inputAuthor.Value = "";
            inputGenre.Value = "";
            inputPrice.Value = "";
            inputType.Value = "";
            inputQty.Value = "";*/
            clear();
        }

        protected void Customers_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customers.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void transHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("TransHistory.aspx");
        }

        protected void orderList_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderList.aspx");
        }
        public void clear() {
            inputISBN.Value = "";
            inputTitle.Value = "";
            inputAuthor.Value = "";
            inputGenre.Value = "";
            inputPrice.Value = "";
            inputType.Value = "";
            inputQty.Value = "";
        }
    }
}