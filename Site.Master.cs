using System;

namespace FoodDonationManagement
{
    public partial class site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = Session["UserID"] != null;
            phGuest.Visible = !loggedIn;
            phUser.Visible = loggedIn;
            if (loggedIn)
            {
                litUser.Text = Server.HtmlEncode(Convert.ToString(Session["FullName"]));
                lnkDashboard.HRef = Auth.Dashboard(Convert.ToString(Session["Role"]));
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
