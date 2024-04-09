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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBntCustomer_Click(object sender, EventArgs e)
        {
            string searchCriteria = searchCustomer.Value;

            SqlDataSource1.FilterExpression = "c_name LIKE '%" + searchCriteria + "%' OR c_email LIKE '%" + searchCriteria + "%' OR c_address LIKE '%" + searchCriteria + "%'";

            GridView1.DataBind();
        }

        protected void submitCus_Click(object sender, EventArgs e)
        {
            string name = inputName.Value;
            string email = inputEmail.Value;
            string address = inputAddress.Value;
            string insertQuery = "INSERT INTO Customer (c_name, c_email, c_address) VALUES (@Name, @Email, @Address)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Address", address);
                    int rowsAffected = command.ExecuteNonQuery();

                }
                connection.Close();
            }
            clear();
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string name = e.NewValues["c_name"].ToString();
            string email = e.NewValues["c_email"].ToString();
            string address = e.NewValues["c_address"].ToString();
            int customerId = Convert.ToInt32(e.Keys["c_id"]);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string updateQuery = "UPDATE Customer SET c_name = @Name, c_email = @Email, c_address = @Address WHERE c_id = @CustomerId";
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@CustomerId", customerId);

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
            
            int customerId = Convert.ToInt32(e.Keys["c_id"]);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string deleteQuery = "DELETE FROM Customer WHERE c_id = @CustomerId";
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    int rowsAffected = command.ExecuteNonQuery();
                }
            }

            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
           /* inputName.Value = "";
            inputEmail.Value = "";
            inputAddress.Value = "";*/
            clear();
        }

        protected void Items_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Items.aspx");
        }

        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void transHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/TransHistory.aspx");
        }

        protected void orderList_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderList.aspx");
        }
        public void clear() {
            inputName.Value = "";
            inputEmail.Value = "";
            inputAddress.Value = "";
        }
    }
}