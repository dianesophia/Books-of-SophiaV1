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
    public partial class WebForm9 : System.Web.UI.Page
    {
        public string connectionString = "Data Source=(localdb)\\Projects;Initial Catalog=Fuentes;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                string query = @"SELECT O.o_id, O.o_date, O.ship_address, C.c_name
                                FROM Orders O
                                INNER JOIN Customer C ON O.c_id = C.c_id";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();

                    connection.Open();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                       // GridView1.DataSource = dataTable;
                        //GridView1.DataBind();
                    }
                    else
                    {
                        // No data found, handle accordingly
                    }
                }
            }
        }

        protected void transHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("TransHistory.aspx");
        }

        protected void Customers_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void items_Click(object sender, EventArgs e)
        {
            Response.Redirect("Items.aspx");
        }

        protected void LogOutBnt_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}