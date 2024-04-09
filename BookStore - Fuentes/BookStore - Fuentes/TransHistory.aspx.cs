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
    public partial class WebForm8 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            // Your existing redirection logic
            Response.Redirect("Login.aspx");

            // Clearing TransHistory table
           // ClearTransHistory();
        }

        protected void ClearTransHistory()
        {
            // Connection string to your database

            // SQL command to truncate the TransHistory table
            string clearCommand = "TRUNCATE TABLE TransHistory";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(clearCommand, connection))
                {
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        // Data in TransHistory table cleared successfully
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions that may occur during execution
                        // For example, log the error or show an error message
                    }
                }
            }
        }

        protected void Customers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void items_Click(object sender, EventArgs e)
        {
            Response.Redirect("Items.aspx");
        }

        protected void orderList_Click(object sender, EventArgs e)
        {
            Response.Redirect("OrderList.aspx");
        }

    }
}