using System;
using System.Configuration;
using System.Data.SqlClient;

namespace FoodDonationManagement
{
    public partial class DonateFood : System.Web.UI.Page
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
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["Role"] == null ||
                     Session["Role"].ToString() != "Donor")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnDonate_Click(object sender, EventArgs e)
        {
            int qty;
            DateTime pdate;

            if (int.TryParse(txtQuantity.Text, out qty) &&
                qty > 0 &&
                DateTime.TryParse(txtPickupDate.Text, out pdate) &&
                txtFoodName.Text.Trim() != "" &&
                ddlFoodType.SelectedValue != "")
            {
                getCon();

                cmd = new SqlCommand(
                    "INSERT INTO Donations " +
                    "(UserID, FoodName, FoodType, Quantity, Description, " +
                    "PickupAddress, City, PickupDate, PickupTime) VALUES ('" +
                    Session["UserID"].ToString() + "','" +
                    txtFoodName.Text.Trim() + "','" +
                    ddlFoodType.SelectedValue + "','" +
                    qty + "','" +
                    txtDescription.Text.Trim() + "','" +
                    txtPickupAddress.Text.Trim() + "','" +
                    txtCity.Text.Trim() + "','" +
                    pdate + "','" +
                    txtPickupTime.Text + "')", con);

                i = cmd.ExecuteNonQuery();

                con.Close();

                if (i > 0)
                {
                    Session["Flash"] = "Food donation submitted successfully!";
                    Response.Redirect("MyDonations.aspx");
                }
                else
                {
                    Response.Write("Food donation failed");
                }
            }
            else
            {
                Response.Write(
                    "Please fill food name, type, quantity and pickup date correctly.");
            }
        }
    }
}