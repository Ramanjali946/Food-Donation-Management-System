using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class TestDatabase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            string connectionString =
                ConfigurationManager
                .ConnectionStrings["FoodDonationDB"]
                .ConnectionString;

            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    lblMessage.Text =
                        "Database Connected Successfully!";
                }
                catch (Exception ex)
                {
                    lblMessage.Text =
                        "Connection Failed: " + ex.Message;
                }
            }
        }
    }
}