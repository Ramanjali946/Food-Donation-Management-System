<%@ Page Title="Available Deliveries"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AvailableDeliveries.aspx.cs"
    Inherits="FoodDonationManagement.AvailableDeliveries" %>

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
                    <h1>Available Deliveries 🚚</h1>

                    <p>
                        View accepted food donations and choose a delivery
                        that you would like to handle.
                    </p>
                </div>
            </div>

            <div class="dashboard-card">

                <asp:GridView ID="gvDeliveries"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="donation-table"
                    OnRowCommand="gvDeliveries_RowCommand"
                    EmptyDataText="No deliveries are currently available.">

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

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:Button ID="btnAcceptDelivery"
                                    runat="server"
                                    Text="Accept Delivery"
                                    CssClass="dashboard-button"
                                    CommandName="AcceptDelivery"
                                    CommandArgument='<%# Eval("DonationID") %>' />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </section>

</asp:Content>