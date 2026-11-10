using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FoodDonationManagement
{
    public partial class ManageNGOs : System.Web.UI.Page
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
                    getNGOs();
                }
            }
        }

        void getNGOs()
        {
            getCon();

            cmd = new SqlCommand(
                "SELECT UserID, FullName, Email, Phone, " +
                "Address, City, Status " +
                "FROM Users " +
                "WHERE Role = 'NGO' " +
                "ORDER BY UserID DESC", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();
            dt.Load(dr);

            gvNGOs.DataSource = dt;
            gvNGOs.DataBind();

            dr.Close();
            con.Close();
        }

        protected void gvNGOs_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeactivateNGO")
            {
                int userID = Convert.ToInt32(e.CommandArgument);

                deactivateNGO(userID);

                getNGOs();
            }
        }

        void deactivateNGO(int userID)
        {
            getCon();

            cmd = new SqlCommand(
                "UPDATE Users SET Status = 'Inactive' " +
                "WHERE UserID = " + userID +
                " AND Role = 'NGO'", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Response.Write(
                    "<script>alert('NGO deactivated successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('Unable to deactivate NGO.');</script>");
            }
        }
    }
}