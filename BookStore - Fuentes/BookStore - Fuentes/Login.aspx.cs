using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookStore___Fuentes
{
    public partial class Login1 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      /*  protected void submitCus_Click(object sender, EventArgs e)
        {
            string email = loginEmail.Value;
            string password = loginPassword.Value;
            string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [dbo].[Customer] WHERE [c_email] = @email AND [c_password] = @password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidLogin", "alert('Invalid email or password');", true);
                    }
                }
            }
        }
        */
       /* protected void submitCus_Click(object sender, EventArgs e)
        {
            string email = loginEmail.Value;
            string password = loginPassword.Value;
            string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT c_id FROM [dbo].[Customer] WHERE [c_email] = @email AND [c_password] = @password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();

                    // Retrieve the c_id
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        int customerId = Convert.ToInt32(result);

                        // Call the stored procedure to save the c_id
                        SaveCustomerId(customerId);

                        // Redirect after successful login
                        Response.Redirect("~/TransactionPage.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidLogin", "alert('Invalid email or password');", true);
                    }
                }
            }
        }
        */
        protected void submitCus_Click(object sender, EventArgs e)
        {
            string email = loginEmail.Value;
            string password = loginPassword.Value;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT c_id FROM [dbo].[Customer] WHERE [c_email] = @Email AND [c_password] = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();

                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        int customerId = Convert.ToInt32(result);

                        // Store the customerId in a session
                        Session["CustomerId"] = customerId;

                        // Redirect after successful login
                        Response.Redirect("~/TransactionPage.aspx");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "InvalidLogin", "alert('Invalid email or password');", true);
                    }
                }
            }
        }

        private void SaveCustomerId(int customerId)
        {
            string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("SaveCustomerId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
