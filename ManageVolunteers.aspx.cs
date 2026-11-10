using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class ManageVolunteers : System.Web.UI.Page
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
                    getVolunteers();
                }
            }
        }

        void getVolunteers()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT UserID, FullName, Email, Phone, " +
                "Address, City, Status " +
                "FROM Users " +
                "WHERE Role = 'Volunteer' " +
                "ORDER BY UserID DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvVolunteers.DataSource = dt;
            gvVolunteers.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvVolunteers_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeactivateVolunteer")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                deactivateVolunteer(userID);

                getVolunteers();
            }
        }

        void deactivateVolunteer(int userID)
        {
            getCon();

            cmd = new SqlCommand(
                "UPDATE Users SET Status = 'Inactive' " +
                "WHERE UserID = " + userID +
                " AND Role = 'Volunteer'", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('Volunteer deactivated successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('Unable to deactivate volunteer.');</script>");
            }
        }
    }
}