using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FoodDonationManagement
{
    public partial class MyDeliveries : System.Web.UI.Page
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
            else if (Session["Role"] == null ||
                     Session["Role"].ToString() != "Volunteer")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    getMyDeliveries();
                }
            }
        }

        void getMyDeliveries()
        {
            getCon();

            int volunteerID = Convert.ToInt32(Session["UserID"]);

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, FoodType, Quantity, " +
                "PickupAddress, City, PickupDate, PickupTime, Status " +
                "FROM Donations " +
                "WHERE VolunteerID = " + volunteerID +
                " ORDER BY PickupDate ASC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvMyDeliveries.DataSource = dt;
            gvMyDeliveries.DataBind();

            dr.Close();
            con.Close();
        }
    }
}