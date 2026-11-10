<%@ Page Title="Register"
    Language="C#" ClientIDMode="Static"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Register.aspx.cs"
    Inherits="FoodDonationManagement.Register" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="register-section">

        <div class="register-container">

            <div class="register-header">
                <h1>Create Your Account</h1>
                <p>Join us and help make a difference.</p>
            </div>

            <div class="register-form">

                <div class="form-row">

                    <div class="form-group">
                        <label>Full Name</label>

                        <asp:TextBox ID="txtFullName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter your full name">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="txtEmail"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Email"
                            placeholder="Enter your email"
                            autocomplete="email">
                        </asp:TextBox>
                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group">
                        <label>Phone Number</label>

                        <asp:TextBox ID="txtPhone"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter 10-digit phone number"
                            MaxLength="10"
                            inputmode="numeric"
                            autocomplete="tel">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Role</label>

                        <asp:DropDownList ID="ddlRole"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Text="Select Role"
                                Value="">
                            </asp:ListItem>

                            <asp:ListItem Text="Donor"
                                Value="Donor">
                            </asp:ListItem>

                            <asp:ListItem Text="NGO"
                                Value="NGO">
                            </asp:ListItem>

                            <asp:ListItem Text="Volunteer"
                                Value="Volunteer">
                            </asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="txtPassword"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Password"
                            placeholder="Create password"
                            autocomplete="new-password">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Password"
                            placeholder="Confirm password"
                            autocomplete="new-password">
                        </asp:TextBox>
                    </div>

                </div>


                <div class="form-group">
                    <label>Address</label>

                    <asp:TextBox ID="txtAddress"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="3"
                        placeholder="Enter your address">
                    </asp:TextBox>
                </div>


                <div class="form-group">
                    <label>City</label>

                    <asp:TextBox ID="txtCity"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter your city">
                    </asp:TextBox>
                </div>


                <div class="register-buttons">

                    <asp:Button ID="btnRegister"
                        runat="server"
                        Text="Create Account"
                        CssClass="register-submit"
                        CausesValidation="false"
                        OnClick="btnRegister_Click"
                        OnClientClick="return validateRegisterForm();" />

                    <asp:Button ID="btnReset"
                        runat="server"
                        Text="Reset"
                        CssClass="register-reset"
                        CausesValidation="false" />

                </div>


                <div class="login-link">
                    Already have an account?
                    <a href="Login.aspx">Login here</a>
                </div>

            </div>

        </div>

    </section>

</asp:Content>
