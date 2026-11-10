using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class AvailableDeliveries : System.Web.UI.Page
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
                    getDeliveries();
                }
            }
        }

        void getDeliveries()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, FoodType, Quantity, " +
                "PickupAddress, City, PickupDate, PickupTime, Status " +
                "FROM Donations " +
                "WHERE Status = 'Accepted' " +
                "AND VolunteerID IS NULL " +
                "ORDER BY PickupDate ASC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDeliveries.DataSource = dt;
            gvDeliveries.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvDeliveries_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AcceptDelivery")
            {
                int donationID = Convert.ToInt32(e.CommandArgument);
                int volunteerID = Convert.ToInt32(Session["UserID"]);

                acceptDelivery(donationID, volunteerID);

                getDeliveries();
            }
        }

        void acceptDelivery(int donationID, int volunteerID)
        {
            getCon();

            cmd = new SqlCommand(
                "UPDATE Donations SET " +
                "VolunteerID = " + volunteerID + ", " +
                "DeliveryStatus = 'Assigned' " +
                "WHERE DonationID = " + donationID +
                " AND Status = 'Accepted' " +
                " AND VolunteerID IS NULL", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('Delivery accepted successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('This delivery is no longer available.');</script>");
            }
        }
    }
}