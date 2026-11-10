<%@ Page Title="NGO Profile"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="NGOProfile.aspx.cs"
    Inherits="FoodDonationManagement.NGOProfile" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="profile-section">

        <div class="profile-container">

            <div class="profile-header">
                <h1>NGO Profile</h1>
                <p>View and manage your account information.</p>
            </div>

            <div class="profile-card">

                <div class="profile-icon">
                    🏢
                </div>

                <div class="profile-form">

                    <div class="profile-group">
                        <label>Full Name</label>

                        <asp:TextBox ID="txtFullName"
                            runat="server"
                            CssClass="profile-control">
                        </asp:TextBox>
                    </div>

                    <div class="profile-group">
                        <label>Email</label>

                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            CssClass="profile-control"
                            TextMode="Email">
                        </asp:TextBox>
                    </div>

                    <div class="profile-group">
                        <label>Phone Number</label>

                        <asp:TextBox ID="txtPhone"
                            runat="server"
                            CssClass="profile-control">
                        </asp:TextBox>
                    </div>

                    <div class="profile-group">
                        <label>Role</label>

                        <asp:TextBox ID="txtRole"
                            runat="server"
                            CssClass="profile-control"
                            ReadOnly="true">
                        </asp:TextBox>
                    </div>

                    <div class="profile-group">
                        <label>Address</label>

                        <asp:TextBox ID="txtAddress"
                            runat="server"
                            CssClass="profile-control"
                            TextMode="MultiLine"
                            Rows="3">
                        </asp:TextBox>
                    </div>

                    <div class="profile-group">
                        <label>City</label>

                        <asp:TextBox ID="txtCity"
                            runat="server"
                            CssClass="profile-control">
                        </asp:TextBox>
                    </div>

                    <div class="profile-buttons">

                        <asp:Button ID="btnUpdate"
                            runat="server"
                            Text="Update Profile"
                            CssClass="profile-update"
                            OnClick="btnUpdate_Click" />

                    </div>

                </div>

            </div>

        </div>

    </section>

</asp:Content>