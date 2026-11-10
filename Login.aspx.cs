
using FoodDonationManagement;
using System;
using System.Data.SqlClient;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;

namespace FoodDonationManagement
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        int i;
        string role;

        void getCon()
        {
            con = new SqlConnection(DbHelper.ConnStr);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    Response.Redirect("Home.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtLoginEmail.Text) &&
                !String.IsNullOrEmpty(txtLoginPassword.Text))
            {
                getCon();

                cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email = '" +
                    txtLoginEmail.Text.Trim() +
                    "' AND Password = '" +
                    DbHelper.Hash(txtLoginPassword.Text) +
                    "' AND Status = 'Active'", con);

                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    cmd = new SqlCommand(
                        "SELECT UserID, FullName, Role FROM Users WHERE Email = '" +
                        txtLoginEmail.Text.Trim() +
                        "' AND Password = '" +
                        DbHelper.Hash(txtLoginPassword.Text) +
                        "' AND Status = 'Active'", con);

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        Session["UserID"] = dr["UserID"].ToString();
                        Session["FullName"] = dr["FullName"].ToString();

                        role = dr["Role"].ToString();
                        Session["Role"] = role;
                    }

                    dr.Close();
                    con.Close();

                    if (role == "NGO")
                    {
                        Response.Redirect("NGODashboard.aspx");
                    }
                    else if (role == "Donor")
                    {
                        Response.Redirect("DonorDashboard.aspx");
                    }
                    else if (role == "Volunteer")
                    {
                        Response.Redirect("VolunteerDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("Home.aspx");
                    }
                }
                else
                {
                    con.Close();
                    Response.Write("Invalid Email or Password");
                }
            }
            else
            {
                Response.Write("Please enter Email and Password");
            }
        }
    }
}
