using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace FoodDonationManagement
{
    public static class DbHelper
    {
        public static string ConnStr
        {
            get { return ConfigurationManager.ConnectionStrings["FoodDonationDB"].ConnectionString; }
        }

        public static string Hash(string text)
        {
            using (SHA256 sha = SHA256.Create())
            {
                byte[] b = sha.ComputeHash(Encoding.UTF8.GetBytes(text ?? ""));
                StringBuilder sb = new StringBuilder();
                foreach (byte x in b) sb.Append(x.ToString("x2"));
                return sb.ToString();
            }
        }

        public static void EnsureDatabase()
        {
            SqlConnectionStringBuilder b = new SqlConnectionStringBuilder(ConnStr);
            string dbName = b.InitialCatalog;
            b.InitialCatalog = "master";

            using (SqlConnection con = new SqlConnection(b.ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(
                    "IF DB_ID('" + dbName + "') IS NULL CREATE DATABASE [" + dbName + "]", con))
                { cmd.ExecuteNonQuery(); }
            }

            string schema = @"
IF OBJECT_ID('Users') IS NULL
CREATE TABLE Users(
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Phone NVARCHAR(20) NULL,
    Password NVARCHAR(200) NOT NULL,
    Role NVARCHAR(20) NOT NULL,
    Address NVARCHAR(300) NULL,
    City NVARCHAR(100) NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Active',
    RegistrationDate DATETIME NOT NULL DEFAULT GETDATE());

IF OBJECT_ID('Donations') IS NULL
CREATE TABLE Donations(
    DonationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    FoodName NVARCHAR(100) NOT NULL,
    FoodType NVARCHAR(30) NULL,
    Quantity INT NOT NULL,
    Description NVARCHAR(500) NULL,
    PickupAddress NVARCHAR(300) NULL,
    City NVARCHAR(100) NULL,
    PickupDate DATE NULL,
    PickupTime NVARCHAR(20) NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    DonationDate DATETIME NOT NULL DEFAULT GETDATE(),
    NGOID INT NULL,
    VolunteerID INT NULL,
    DeliveryStatus NVARCHAR(20) NOT NULL DEFAULT 'Not Assigned');";

            using (SqlConnection con = new SqlConnection(ConnStr))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand(schema, con)) { cmd.ExecuteNonQuery(); }

                // demo accounts (password for all demo users: Pass@123, admin: Admin@123)
                string seed = @"
IF NOT EXISTS(SELECT 1 FROM Users WHERE Email='admin@fooddonation.com')
INSERT INTO Users(FullName,Email,Phone,Password,Role,Address,City) VALUES
('System Admin','admin@fooddonation.com','9999999999',@admin,'Admin','Head Office','Rajkot');
IF NOT EXISTS(SELECT 1 FROM Users WHERE Email='donor@demo.com')
INSERT INTO Users(FullName,Email,Phone,Password,Role,Address,City) VALUES
('Demo Donor','donor@demo.com','9000000001',@pass,'Donor','MG Road','Rajkot'),
('Helping Hands NGO','ngo@demo.com','9000000002',@pass,'NGO','Station Road','Rajkot'),
('Demo Volunteer','volunteer@demo.com','9000000003',@pass,'Volunteer','Ring Road','Rajkot');";
                using (SqlCommand cmd = new SqlCommand(seed, con))
                {
                    cmd.Parameters.AddWithValue("@admin", Hash("Admin@123"));
                    cmd.Parameters.AddWithValue("@pass", Hash("Pass@123"));
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }

    public static class Auth
    {
        // Returns true if logged in (and in one of the roles, when roles are given)
        public static bool Require(Page page, params string[] roles)
        {
            object id = page.Session["UserID"];
            object role = page.Session["Role"];
            bool ok = id != null;
            if (ok && roles != null && roles.Length > 0)
                ok = role != null && Array.IndexOf(roles, role.ToString()) >= 0;
            if (!ok)
            {
                page.Response.Redirect("~/Login.aspx", false);
                System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            return ok;
        }

        public static string Dashboard(string role)
        {
            switch (role)
            {
                case "Donor": return "~/DonorDashboard.aspx";
                case "NGO": return "~/NGODashboard.aspx";
                case "Volunteer": return "~/VolunteerDashboard.aspx";
                case "Admin": return "~/AdminDashboard.aspx";
                default: return "~/Home.aspx";
            }
        }

        public static void Alert(Page page, string message)
        {
            page.ClientScript.RegisterStartupScript(page.GetType(), "msg",
                "alert('" + message.Replace("'", "\\'") + "');", true);
        }
    }
}
