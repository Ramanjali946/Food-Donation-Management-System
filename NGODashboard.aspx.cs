using System;

namespace FoodDonationManagement
{
    public partial class NGODashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (Session["Role"] == null ||
                     Session["Role"].ToString() != "NGO")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}