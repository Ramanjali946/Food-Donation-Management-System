<%@ Page Title="My Donations"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="MyDonations.aspx.cs"
    Inherits="FoodDonationManagement.MyDonations" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="my-donations-section">

        <div class="my-donations-container">

            <div class="page-header">
                <h1>My Donations 📋</h1>
                <p>View all the food donations you have submitted.</p>
            </div>

            <div class="donations-table-wrapper">

                <asp:GridView ID="gvDonations"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="donations-table"
                    EmptyDataText="You have not submitted any donations yet.">

                    <Columns>

                        <asp:BoundField
                            DataField="DonationID"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="FoodName"
                            HeaderText="Food Name" />

                        <asp:BoundField
                            DataField="FoodType"
                            HeaderText="Food Type" />

                        <asp:BoundField
                            DataField="Quantity"
                            HeaderText="Quantity" />

                        <asp:BoundField
                            DataField="City"
                            HeaderText="City" />

                        <asp:BoundField
                            DataField="PickupDate"
                            HeaderText="Pickup Date"
                            DataFormatString="{0:dd-MM-yyyy}" />

                        <asp:BoundField
                            DataField="Status"
                            HeaderText="Status" />

                        <asp:BoundField
                            DataField="DonationDate"
                            HeaderText="Submitted On"
                            DataFormatString="{0:dd-MM-yyyy}" />

                    </Columns>

                </asp:GridView>

            </div>

            <div class="donation-actions">

                <a href="DonateFood.aspx" class="dashboard-button">
                    + Donate More Food
                </a>

                <a href="DonorDashboard.aspx" class="secondary-dashboard-button">
                    Back to Dashboard
                </a>

            </div>

        </div>

    </section>

</asp:Content>