using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class ManageDonations : System.Web.UI.Page
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
                     Session["Role"].ToString() != "Admin")
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
                "City, PickupDate, PickupTime, Status, DeliveryStatus " +
                "FROM Donations " +
                "ORDER BY DonationID DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDonations.DataSource = dt;
            gvDonations.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvDonations_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CancelDonation")
            {
                int donationID = Convert.ToInt32(e.CommandArgument);

                cancelDonation(donationID);

                getDonations();
            }
        }

        void cancelDonation(int donationID)
        {
            getCon();

            cmd = new SqlCommand(
                "UPDATE Donations SET Status = 'Cancelled' " +
                "WHERE DonationID = " + donationID +
                " AND Status <> 'Delivered' " +
                " AND Status <> 'Cancelled'", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('Donation cancelled successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('This donation cannot be cancelled.');</script>");
            }
        }
    }
}