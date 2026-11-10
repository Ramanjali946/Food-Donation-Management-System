using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class AvailableDonations : System.Web.UI.Page
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
                     Session["Role"].ToString() != "NGO")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    getDonations();
                }
            }
        }

        void getDonations()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, FoodType, Quantity, " +
                "Description, PickupAddress, City, PickupDate, " +
                "PickupTime, Status " +
                "FROM Donations " +
                "WHERE Status = 'Pending' " +
                "ORDER BY DonationDate DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDonations.DataSource = dt;
            gvDonations.DataBind();

            dr.Close();
            con.Close();
        }

        // ACCEPT DONATION
        protected void gvDonations_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptDonation")
            {
                int donationID = Convert.ToInt32(e.CommandArgument);
                int ngoID = Convert.ToInt32(Session["UserID"]);

                getCon();

                cmd = new SqlCommand(
                    "UPDATE Donations SET " +
                    "Status = 'Accepted', " +
                    "NGOID = " + ngoID +
                    " WHERE DonationID = " + donationID +
                    " AND Status = 'Pending'", con);

                int i = cmd.ExecuteNonQuery();

                con.Close();

                if (i > 0)
                {
                    getDonations();
                }
                else
                {
                    Response.Write("Donation could not be accepted");
                }
            }
        }
    }
}