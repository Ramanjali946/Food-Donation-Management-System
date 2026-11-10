<%@ Page Title="Available Donations"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AvailableDonations.aspx.cs"
    Inherits="FoodDonationManagement.AvailableDonations" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>
<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="available-section">

        <div class="available-container">

            <div class="available-header">
                <h1>Available Food Donations</h1>

                <p>
                    View food donations that are currently available
                    for your NGO to accept.
                </p>
            </div>

            <asp:GridView ID="gvDonations"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donation-table"
                EmptyDataText="No food donations are currently available."
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
                        DataField="Description"
                        HeaderText="Description" />

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

                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:Button ID="btnAccept"
                                runat="server"
                                Text="Accept Donation"
                                CssClass="accept-button"
                                CommandName="AcceptDonation"
                                CommandArgument='<%# Eval("DonationID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </section>

</asp:Content>
