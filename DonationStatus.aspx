<%@ Page Title="Donation Status"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="DonationStatus.aspx.cs"
    Inherits="FoodDonationManagement.DonationStatus" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="status-section">

        <div class="status-container">

            <div class="status-header">

                <h1>Donation Status</h1>

                <p>
                    Track the current status of food donations.
                </p>

            </div>

            <asp:GridView ID="gvDonationStatus"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="status-table"
                EmptyDataText="No donations found.">

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
                        DataField="PickupTime"
                        HeaderText="Pickup Time" />

                    <asp:BoundField
                        DataField="Status"
                        HeaderText="Status" />

                </Columns>

            </asp:GridView>

        </div>

    </section>

</asp:Content>