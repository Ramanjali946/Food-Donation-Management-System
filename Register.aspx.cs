
using System;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodDonationManagement
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        int i;

        string s = ConfigurationManager.ConnectionStrings["FoodDonationDB"].ConnectionString;

        void getCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtFullName.Text) &&
                !String.IsNullOrEmpty(txtEmail.Text) &&
                !String.IsNullOrEmpty(txtPassword.Text))
            {
                getCon();

                // Check whether email already exists
                cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email = '" +
                    txtEmail.Text.Trim() + "'", con);

                i = Convert.ToInt16(cmd.ExecuteScalar());

                if (i > 0)
                {
                    Response.Write("Email already registered");
                    con.Close();
                    return;
                }

                // Insert new user
                cmd = new SqlCommand(
                    "INSERT INTO Users " +
                    "(FullName, Email, Phone, Password, Role, Address, City) VALUES ('" +
                    txtFullName.Text.Trim() + "','" +
                    txtEmail.Text.Trim() + "','" +
                    txtPhone.Text.Trim() + "','" +
                    DbHelper.Hash(txtPassword.Text) + "','" +
                    ddlRole.SelectedValue + "','" +
                    txtAddress.Text.Trim() + "','" +
                    txtCity.Text.Trim() + "')", con);

                i = cmd.ExecuteNonQuery();

                con.Close();

                if (i > 0)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Write("Registration Failed");
                }
            }
            else
            {
                Response.Write("Please fill all required fields");
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            ddlRole.SelectedIndex = 0;
        }
    }
}

