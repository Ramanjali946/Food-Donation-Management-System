<%@ Page Title="Volunteer Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="VolunteerDashboard.aspx.cs"
    Inherits="FoodDonationManagement.VolunteerDashboard" %>

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
                    <h1>
                        Welcome, <asp:Label ID="lblVolunteerName"
                            runat="server"></asp:Label> 👋
                    </h1>

                    <p>
                        Help collect and deliver food donations
                        to people in need.
                    </p>
                </div>

            </div>


            <div class="dashboard-cards">

                <!-- Available Deliveries -->

                <div class="dashboard-card">

                    <div class="card-icon">
                        🚚
                    </div>

                    <h2>
                        Available Deliveries
                    </h2>

                    <p>
                        View food donations that are ready
                        for volunteer delivery.
                    </p>

                    <a href="AvailableDeliveries.aspx"
                       class="dashboard-button">
                        View Deliveries
                    </a>

                </div>


                <!-- My Deliveries -->

                <div class="dashboard-card">

                    <div class="card-icon">
                        📦
                    </div>

                    <h2>
                        My Deliveries
                    </h2>

                    <p>
                        View the deliveries accepted by you.
                    </p>

                    <a href="MyDeliveries.aspx"
                       class="dashboard-button">
                        My Deliveries
                    </a>

                </div>


                <!-- Delivery Status -->

                <div class="dashboard-card">

                    <div class="card-icon">
                        📊
                    </div>

                    <h2>
                        Delivery Status
                    </h2>

                    <p>
                        Track the status of your food deliveries.
                    </p>

                    <a href="DeliveryStatus.aspx"
                       class="dashboard-button">
                        Check Status
                    </a>

                </div>


                <!-- My Profile -->

                <div class="dashboard-card">

                    <div class="card-icon">
                        👤
                    </div>

                    <h2>
                        My Profile
                    </h2>

                    <p>
                        View and manage your volunteer
                        account information.
                    </p>

                    <a href="VolunteerProfile.aspx"
                       class="dashboard-button">
                        View Profile
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>