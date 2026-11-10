using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace FoodDonationManagement
{
    public partial class MyDonations : System.Web.UI.Page
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
                     Session["Role"].ToString() != "Donor")
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    if (Session["Flash"] != null)
                    {
                        Response.Write(
                            "<script>alert('" +
                            Session["Flash"].ToString() +
                            "');</script>");

                        Session.Remove("Flash");
                    }

                    getDonations();
                }
            }
        }

        void getDonations()
        {
            getCon();

            int userID = Convert.ToInt32(Session["UserID"]);

            cmd = new SqlCommand(
                "SELECT DonationID, FoodName, FoodType, Quantity, " +
                "City, PickupDate, Status, DonationDate " +
                "FROM Donations " +
                "WHERE UserID = " + userID +
                " ORDER BY DonationDate DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvDonations.DataSource = dt;
            gvDonations.DataBind();

            dr.Close();
            con.Close();
        }
    }
}