using System;

namespace FoodDonationManagement
{
    public partial class Volunteer : System.Web.UI.Page
    {
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
        }
    }
}