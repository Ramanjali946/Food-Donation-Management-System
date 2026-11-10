<%@ Page Title="NGO Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="NGODashboard.aspx.cs"
    Inherits="FoodDonationManagement.NGODashboard" %>

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
                    <h1>Welcome, NGO 👋</h1>

                    <p>
                        Manage food donations and help connect surplus food
                        with people in need.
                    </p>
                </div>

            </div>


            <div class="dashboard-cards">

                <!-- Available Donations -->

                <div class="dashboard-card">

                    <div class="card-icon">📥</div>

                    <h2>Available Donations</h2>

                    <p>
                        View food donations that are waiting for NGO acceptance.
                    </p>

                    <a href="AvailableDonations.aspx"
                       class="dashboard-button">
                        View Donations
                    </a>

                </div>


                <!-- Accepted Donations -->

                <div class="dashboard-card">

                    <div class="card-icon">✅</div>

                    <h2>Accepted Donations</h2>

                    <p>
                        View the donations accepted by your NGO.
                    </p>

                    <a href="AcceptedDonations.aspx"
                       class="dashboard-button">
                        View Accepted
                    </a>

                </div>


                <!-- Donation Status -->

                <div class="dashboard-card">

                    <div class="card-icon">📊</div>

                    <h2>Donation Status</h2>

                    <p>
                        Track the status of food donations.
                    </p>

                    <a href="DonationStatus.aspx"
                       class="dashboard-button">
                        Check Status
                    </a>

                </div>


                <!-- NGO Profile -->

                <div class="dashboard-card">

                    <div class="card-icon">🏢</div>

                    <h2>NGO Profile</h2>

                    <p>
                        View and manage your NGO account information.
                    </p>

                    <a href="NGOProfile.aspx"
                       class="dashboard-button">
                        View Profile
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>