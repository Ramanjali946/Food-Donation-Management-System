using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FoodDonationManagement
{
    public partial class DonationStatus : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;

        string s = ConfigurationManager.ConnectionStrings["FoodDonationDB"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    getDonationStatus();
                }
            }
        }

        void getDonationStatus()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, FoodType, Quantity, " +
                "City, PickupDate, PickupTime, Status " +
                "FROM Donations ORDER BY DonationDate DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDonationStatus.DataSource = dt;
            gvDonationStatus.DataBind();

            dr.Close();
            con.Close();
        }
    }
}