using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class ManageUsers : System.Web.UI.Page
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
                    getUsers();
                }
            }
        }

        void getUsers()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT UserID, FullName, Email, Phone, " +
                "Role, City, Status " +
                "FROM Users " +
                "ORDER BY UserID DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvUsers.DataSource = dt;
            gvUsers.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvUsers_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Deactivate")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                deactivateUser(userID);

                getUsers();
            }
        }

        void deactivateUser(int userID)
        {
            int adminID = Convert.ToInt32(Session["UserID"]);

            if (userID == adminID)
            {
                Response.Write(
                    "<script>alert('You cannot deactivate your own Admin account.');</script>");

                return;
            }

            getCon();

            cmd = new SqlCommand(
                "UPDATE Users SET Status = 'Inactive' " +
                "WHERE UserID = " + userID +
                " AND Role <> 'Admin'", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('User deactivated successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('Unable to deactivate user.');</script>");
            }
        }
    }
}