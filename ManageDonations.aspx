<%@ Page Title="Manage Donations"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ManageDonations.aspx.cs"
    Inherits="FoodDonationManagement.ManageDonations" %>

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
                <h1>Manage Donations 🍱</h1>
                <p>View and manage all food donations in the system.</p>
            </div>
        </div>

        <div class="dashboard-card">

            <asp:GridView
                ID="gvDonations"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donation-table"
                EmptyDataText="No donations found."
                OnRowCommand="gvDonations_RowCommand">

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

                    <asp:BoundField
                        DataField="DeliveryStatus"
                        HeaderText="Delivery Status" />

                    <asp:TemplateField HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button
                                ID="btnCancel"
                                runat="server"
                                Text="Cancel"
                                CssClass="dashboard-button"
                                CommandName="CancelDonation"
                                CommandArgument='<%# Eval("DonationID") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>