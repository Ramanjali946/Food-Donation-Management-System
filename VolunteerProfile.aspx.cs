using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FoodDonationManagement
{
    public partial class VolunteerProfile : System.Web.UI.Page
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
                    getProfile();
                }
            }
        }

        void getProfile()
        {
            getCon();

            int userID = Convert.ToInt32(Session["UserID"]);

            cmd = new SqlCommand(
                "SELECT FullName, Email, Phone, Role, Address, City " +
                "FROM Users " +
                "WHERE UserID = " + userID +
                " AND Role = 'Volunteer'", con);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                txtFullName.Text = dr["FullName"].ToString();
                txtEmail.Text = dr["Email"].ToString();
                txtPhone.Text = dr["Phone"].ToString();
                txtRole.Text = dr["Role"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtCity.Text = dr["City"].ToString();
            }

            dr.Close();
            con.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int userID = Convert.ToInt32(Session["UserID"]);

            getCon();

            cmd = new SqlCommand(
                "UPDATE Users SET " +
                "FullName = '" + txtFullName.Text.Trim() + "', " +
                "Phone = '" + txtPhone.Text.Trim() + "', " +
                "Address = '" + txtAddress.Text.Trim() + "', " +
                "City = '" + txtCity.Text.Trim() + "' " +
                "WHERE UserID = " + userID +
                " AND Role = 'Volunteer'", con);

            int i = cmd.ExecuteNonQuery();

            con.Close();

            if (i > 0)
            {
                Session["FullName"] = txtFullName.Text.Trim();

                Response.Write(
                    "<script>alert('Profile updated successfully!');</script>");
            }
            else
            {
                Response.Write(
                    "<script>alert('Profile update failed.');</script>");
            }
        }
    }
}