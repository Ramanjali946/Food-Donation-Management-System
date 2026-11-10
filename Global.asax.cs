using System;

namespace FoodDonationManagement
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            // Creates database + tables + demo data automatically on first run
            DbHelper.EnsureDatabase();
        }
    }
}
