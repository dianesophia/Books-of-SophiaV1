using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace BookStore___Fuentes
{
    public partial class Register : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

       /* protected void submitCus_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";

            string username = registerUsername.Value;
            string email = registerEmail.Value;
            string address = registerAddress.Value;
            string password = registerPassword.Value;
            string confirmPassword = registerConPassword.Value;

            // Check if passwords match
            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PasswordMismatch", "alert('Passwords do not match.');", true);
                return;
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand("INSERT INTO [dbo].[Customer] ([c_name], [c_email], [c_address], [c_username], [c_password]) VALUES (@Name, @Email, @Address, @Username, @Password)", connection))
                {
                    command.Parameters.AddWithValue("@Name", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Username", username); // Assuming username goes into c_username
                    command.Parameters.AddWithValue("@Password", password); // Assuming password goes into c_password

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // Registration successful
                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            // Registration failed
                            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationFailed", "alert('Registration failed.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions
                        System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
                    }
                    finally
                    {
                        // Ensure the connection is closed after execution
                        connection.Close();
                    }
                }
            }
        }*/

      /*  protected void submitCus_Click(object sender, EventArgs e)
        {
            string username = registerUsername.Value;
            string email = registerEmail.Value;
            string address = registerAddress.Value;
            string password = registerPassword.Value;
            string confirmPassword = registerConPassword.Value;

            // Check if passwords match
            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PasswordMismatch", "alert('Passwords do not match.');", true);
                return;
            }

            int customerId = 0; // Initialize customerId

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open(); // Open the connection

                using (SqlCommand command = new SqlCommand("INSERT INTO [dbo].[Customer] ([c_name], [c_email], [c_address], [c_username], [c_password]) VALUES (@Name, @Email, @Address, @Username, @Password); SELECT SCOPE_IDENTITY();", connection))
                {
                    command.Parameters.AddWithValue("@Name", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Username", username); // Assuming username goes into c_username
                    command.Parameters.AddWithValue("@Password", password); // Assuming password goes into c_password

                    try
                    {
                        customerId = Convert.ToInt32(command.ExecuteScalar()); // Retrieve the c_id

                        if (customerId > 0)
                        {
                            // Registration successful, now call the SaveCustomerId stored procedure
                            SaveCustomerId(connection, customerId);

                            // Redirect to the default page after successful registration
                            Response.Redirect("TransactionPage.aspx");
                        }
                        else
                        {
                            // Registration failed
                            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationFailed", "alert('Registration failed.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions
                        System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
                    }
                }
            }
        }*/
        protected void submitCus_Click(object sender, EventArgs e)
        {
            // Get user registration details
            string username = registerUsername.Value;
            string email = registerEmail.Value;
            string address = registerAddress.Value;
            string password = registerPassword.Value;
            string confirmPassword = registerConPassword.Value;

            // Check if passwords match
            if (password != confirmPassword)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "PasswordMismatch", "alert('Passwords do not match.');", true);
                return;
            }

           
            int customerId = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Insert customer details into the database
                using (SqlCommand command = new SqlCommand("INSERT INTO [dbo].[Customer] ([c_name], [c_email], [c_address], [c_username], [c_password]) VALUES (@Name, @Email, @Address, @Username, @Password); SELECT SCOPE_IDENTITY();", connection))
                {
                    command.Parameters.AddWithValue("@Name", username);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Username", username);
                    command.Parameters.AddWithValue("@Password", password);

                    try
                    {
                        customerId = Convert.ToInt32(command.ExecuteScalar());

                        if (customerId > 0)
                        {
                            // Store the customerId in a session
                            Session["CustomerId"] = customerId;

                            // Redirect after successful registration
                            Response.Redirect("TransactionPage.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "RegistrationFailed", "alert('Registration failed.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
                    }
                }
            }
        }


        // Method to call the SaveCustomerId stored procedure
        private void SaveCustomerId(SqlConnection connection, int customerId)
        {
            using (SqlCommand command = new SqlCommand("SaveCustomerId", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CustomerId", customerId);

                try
                {
                    command.ExecuteNonQuery(); // Execute the stored procedure
                }
                catch (Exception ex)
                {
                    // Handle any exceptions
                    System.Diagnostics.Debug.WriteLine("Exception: " + ex.Message);
                }
            }
        }
    }
}
