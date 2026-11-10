<%@ Page Title="Admin Profile"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="FoodDonationManagement.AdminProfile" %>

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
                    <h1>Admin Profile 👤</h1>
                    <p>View and update your administrator profile.</p>
                </div>
            </div>

            <div class="dashboard-card">

                <div class="form-group">
                    <label>Full Name</label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Email</label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Phone</label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Role</label>

                    <asp:TextBox
                        ID="txtRole"
                        runat="server"
                        CssClass="form-control"
                        ReadOnly="true">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>Address</label>

                    <asp:TextBox
                        ID="txtAddress"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="3">
                    </asp:TextBox>
                </div>

                <div class="form-group">
                    <label>City</label>

                    <asp:TextBox
                        ID="txtCity"
                        runat="server"
                        CssClass="form-control">
                    </asp:TextBox>
                </div>

                <br />

                <asp:Button
                    ID="btnUpdate"
                    runat="server"
                    Text="Update Profile"
                    CssClass="dashboard-button"
                    OnClick="btnUpdate_Click" />

            </div>

        </div>

    </section>

</asp:Content>