using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class DeliveryStatus : System.Web.UI.Page
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
                    getDeliveryStatus();
                }
            }
        }

        void getDeliveryStatus()
        {
            getCon();

            int volunteerID = Convert.ToInt32(Session["UserID"]);

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, Quantity, " +
                "PickupAddress, City, PickupDate, PickupTime, " +
                "DeliveryStatus " +
                "FROM Donations " +
                "WHERE VolunteerID = " + volunteerID +
                " ORDER BY PickupDate ASC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDeliveryStatus.DataSource = dt;
            gvDeliveryStatus.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvDeliveryStatus_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PickedUp")
            {
                updateDeliveryStatus(
                    Convert.ToInt32(e.CommandArgument),
                    "Picked Up");
            }
            else if (e.CommandName == "Delivered")
            {
                updateDeliveryStatus(
                    Convert.ToInt32(e.CommandArgument),
                    "Delivered");
            }

            getDeliveryStatus();
        }

        void updateDeliveryStatus(
            int donationID,
            string deliveryStatus)
        {
            int volunteerID = Convert.ToInt32(Session["UserID"]);

            getCon();

            cmd = new SqlCommand(
                "UPDATE Donations SET " +
                "DeliveryStatus = '" + deliveryStatus + "', " +
                "Status = CASE WHEN '" + deliveryStatus +
                "' = 'Delivered' THEN 'Delivered' ELSE Status END " +
                "WHERE DonationID = " + donationID +
                " AND VolunteerID = " + volunteerID, con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('Delivery status updated successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('Unable to update delivery status.');</script>");
            }
        }
    }
}