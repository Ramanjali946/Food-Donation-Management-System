<%@ Page Title="Manage NGOs"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ManageNGOs.aspx.cs"
    Inherits="FoodDonationManagement.ManageNGOs" %>

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
                <h1>Manage NGOs 🏢</h1>
                <p>View and manage all registered NGOs.</p>
            </div>
        </div>

        <div class="dashboard-card">

            <asp:GridView
                ID="gvNGOs"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donation-table"
                EmptyDataText="No NGOs found."
                OnRowCommand="gvNGOs_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="UserID"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="NGO Name" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="Phone"
                        HeaderText="Phone" />

                    <asp:BoundField
                        DataField="Address"
                        HeaderText="Address" />

                    <asp:BoundField
                        DataField="City"
                        HeaderText="City" />

                    <asp:BoundField
                        DataField="Status"
                        HeaderText="Status" />

                    <asp:TemplateField HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button
                                ID="btnDeactivate"
                                runat="server"
                                Text="Deactivate"
                                CssClass="dashboard-button"
                                CommandName="DeactivateNGO"
                                CommandArgument='<%# Eval("UserID") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>