using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookStore___Fuentes
{
    public partial class Login : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitCus_Click(object sender, EventArgs e)
        {
            string username = loginName.Value;
            string password = loginPassword.Value;
           // string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM [dbo].[Admin] WHERE [admin_username] = @username AND [admin_password] = @password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@password", password);

                    connection.Open();

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    if (count > 0)
                    {
                        Response.Redirect("~/Customers.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "InvalidLogin", "alert('Invalid username or password');", true);
                    }
                }
            }
        }
    }
}
