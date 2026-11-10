using System;

namespace FoodDonationManagement
{
    public partial class DonorDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                    lblDonorName.Text = Session["FullName"].ToString();
                }
            }
        }
    }
}