<%@ Page Title="Manage Volunteers"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ManageVolunteers.aspx.cs"
    Inherits="FoodDonationManagement.ManageVolunteers" %>

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
                <h1>Manage Volunteers 🚚</h1>
                <p>View and manage all registered volunteers.</p>
            </div>
        </div>

        <div class="dashboard-card">

            <asp:GridView
                ID="gvVolunteers"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donation-table"
                EmptyDataText="No volunteers found."
                OnRowCommand="gvVolunteers_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="UserID"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Volunteer Name" />

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
                                CommandName="DeactivateVolunteer"
                                CommandArgument='<%# Eval("UserID") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>