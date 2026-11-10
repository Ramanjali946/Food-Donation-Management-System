<%@ Page Title="Manage Users"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="ManageUsers.aspx.cs"
    Inherits="FoodDonationManagement.ManageUsers" %>

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
                <h1>Manage Users 👥</h1>
                <p>View and manage all registered users.</p>
            </div>
        </div>

        <div class="dashboard-card">

            <asp:GridView ID="gvUsers"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="donation-table"
                EmptyDataText="No users found."
                OnRowCommand="gvUsers_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="UserID"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Full Name" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="Phone"
                        HeaderText="Phone" />

                    <asp:BoundField
                        DataField="Role"
                        HeaderText="Role" />

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
                                CommandName="Deactivate"
                                CommandArgument='<%# Eval("UserID") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</section>

</asp:Content>