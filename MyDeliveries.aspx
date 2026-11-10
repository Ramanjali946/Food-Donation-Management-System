<%@ Page Title="My Deliveries"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="MyDeliveries.aspx.cs"
    Inherits="FoodDonationManagement.MyDeliveries" %>

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
                    <h1>My Deliveries 🚚</h1>

                    <p>
                        View the food deliveries assigned to you.
                    </p>
                </div>
            </div>

            <div class="dashboard-card">

                <asp:GridView ID="gvMyDeliveries"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="donation-table"
                    EmptyDataText="You have no assigned deliveries yet.">

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
                            DataField="PickupAddress"
                            HeaderText="Pickup Address" />

                        <asp:BoundField
                            DataField="City"
                            HeaderText="City" />

                        <asp:BoundField
                            DataField="PickupDate"
                            HeaderText="Pickup Date"
                            DataFormatString="{0:dd-MM-yyyy}" />

                        <asp:BoundField
                            DataField="PickupTime"
                            HeaderText="Pickup Time" />

                        <asp:BoundField
                            DataField="Status"
                            HeaderText="Status" />

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </section>

</asp:Content>