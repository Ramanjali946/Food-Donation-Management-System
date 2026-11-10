<%@ Page Title="Login"
    Language="C#" ClientIDMode="Static"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="FoodDonationManagement.Login" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="login-section">

        <div class="login-container">

            <div class="login-header">
                <h1>Welcome Back 👋</h1>
                <p>Login to your Food Donation account</p>
            </div>

            <div class="login-form">

                <!-- EMAIL -->

                <div class="form-group">

                    <label>Email Address</label>

                    <asp:TextBox ID="txtLoginEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter your email">
                    </asp:TextBox>

                </div>


                <!-- PASSWORD -->

                <div class="form-group">

                    <label>Password</label>

                    <div class="password-wrapper">

                        <asp:TextBox ID="txtLoginPassword"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Password"
                            placeholder="Enter your password">
                        </asp:TextBox>

                        <button type="button"
                            class="password-toggle"
                            onclick="togglePassword()">
                            👁️
                        </button>

                    </div>

                </div>


                <!-- LOGIN BUTTON -->

                <asp:Button ID="btnLogin"
                    runat="server"
                    Text="Login"
                    CssClass="login-submit"
                    CausesValidation="false"
                    OnClick="btnLogin_Click"
                    OnClientClick="return validateLoginForm();" />


                <!-- REGISTER LINK -->

                <div class="register-link">

                    Don't have an account?

                    <a href="Register.aspx">
                        Register here
                    </a>

                </div>

            </div>

        </div>

    </section>

</asp:Content>