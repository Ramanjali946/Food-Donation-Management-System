<%@ Page Title="Donor Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="DonorDashboard.aspx.cs"
    Inherits="FoodDonationManagement.DonorDashboard" %>

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
                    <h1>Welcome, <asp:Label ID="lblDonorName" runat="server"></asp:Label> 👋</h1>
                    <p>Thank you for helping reduce food waste and support people in need.</p>
                </div>
            </div>


            <div class="dashboard-cards">

                <!-- Donate Food -->

                <div class="dashboard-card">

                    <div class="card-icon">🍱</div>

                    <h2>Donate Food</h2>

                    <p>
                        Share your surplus food with people who need it.
                    </p>

                    <a href="DonateFood.aspx" class="dashboard-button">
                        Donate Now
                    </a>

                </div>


                <!-- My Donations -->

                <div class="dashboard-card">

                    <div class="card-icon">📋</div>

                    <h2>My Donations</h2>

                    <p>
                        View and manage the food donations you have submitted.
                    </p>

                    <a href="MyDonations.aspx" class="dashboard-button">
                        View Donations
                    </a>

                </div>


                <!-- Donation Status -->

                <div class="dashboard-card">

                    <div class="card-icon">📊</div>

                    <h2>Donation Status</h2>

                    <p>
                        Track the current status of your food donations.
                    </p>

                    <a href="DonationStatus.aspx" class="dashboard-button">
                        Check Status
                    </a>

                </div>


                <!-- Profile -->

                <div class="dashboard-card">

                    <div class="card-icon">👤</div>

                    <h2>My Profile</h2>

                    <p>
                        View and update your personal account information.
                    </p>

                    <a href="DonorProfile.aspx" class="dashboard-button">
                        View Profile
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>