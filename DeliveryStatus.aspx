<%@ Page Title="Delivery Status"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="DeliveryStatus.aspx.cs"
    Inherits="FoodDonationManagement.DeliveryStatus" %>

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
                    <h1>Delivery Status 📦</h1>

                    <p>
                        Track and update the status of your assigned food deliveries.
                    </p>
                </div>
            </div>

            <div class="dashboard-card">

                <asp:GridView ID="gvDeliveryStatus"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="donation-table"
                    OnRowCommand="gvDeliveryStatus_RowCommand"
                    EmptyDataText="You have no assigned deliveries.">

                    <Columns>

                        <asp:BoundField
                            DataField="DonationID"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="FoodName"
                            HeaderText="Food Name" />

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
                            DataField="DeliveryStatus"
                            HeaderText="Delivery Status" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:Button ID="btnPickedUp"
                                    runat="server"
                                    Text="Picked Up"
                                    CssClass="dashboard-button"
                                    CommandName="PickedUp"
                                    CommandArgument='<%# Eval("DonationID") %>' />

                                <asp:Button ID="btnDelivered"
                                    runat="server"
                                    Text="Delivered"
                                    CssClass="dashboard-button"
                                    CommandName="Delivered"
                                    CommandArgument='<%# Eval("DonationID") %>' />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </section>

</asp:Content>