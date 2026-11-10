<%@ Page Title="Admin Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="FoodDonationManagement.AdminDashboard" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="dashboard-section">

        <div class="dashboard-container">

            <div class="dashboard-header">
                <div>
                    <h1>Welcome, Admin 👨‍💼</h1>
                    <p>Manage users, donations and the complete Food Donation Management System.</p>
                </div>
            </div>

            <div class="dashboard-grid">

                <!-- Manage Users -->
                <div class="dashboard-card">
                    <h2>👥 Manage Users</h2>
                    <p>View and manage Donors, NGOs and Volunteers.</p>

                    <a href="ManageUsers.aspx"
                        class="dashboard-button">Manage Users
                    </a>
                </div>

                <!-- Manage Donations -->
                <div class="dashboard-card">
                    <h2>🍱 Manage Donations</h2>
                    <p>View and manage all food donations.</p>

                    <a href="ManageDonations.aspx"
                        class="dashboard-button">Manage Donations
                    </a>
                </div>

                <!-- Manage NGOs -->
                <div class="dashboard-card">
                    <h2>🏢 Manage NGOs</h2>
                    <p>View registered NGOs and their details.</p>

                    <a href="ManageNGOs.aspx"
                        class="dashboard-button">Manage NGOs
                    </a>
                </div>

                <!-- Manage Volunteers -->
                <div class="dashboard-card">
                    <h2>🚚 Manage Volunteers</h2>
                    <p>View registered volunteers and their details.</p>

                    <a href="ManageVolunteers.aspx"
                        class="dashboard-button">Manage Volunteers
                    </a>
                </div>

                 <!-- Manage profile -->
                <div class="dashboard-card">
                    <h2>👤 Admin Profile</h2>
                    <p>View and update your admin profile.</p>

                    <a href="AdminProfile.aspx"
                        class="dashboard-button">My Profile
                    </a>
                </div>


            </div>

        </div>

    </section>

</asp:Content>
