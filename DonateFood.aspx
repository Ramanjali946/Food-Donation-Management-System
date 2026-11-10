<%@ Page Title="Donate Food"
    Language="C#" ClientIDMode="Static"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="DonateFood.aspx.cs"
    Inherits="FoodDonationManagement.DonateFood" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="donate-section">

        <div class="donate-container">

            <div class="donate-header">
                <h1>Donate Food 🍱</h1>
                <p>Share your surplus food with people in need.</p>
            </div>

            <div class="donate-form">

                <div class="form-row">

                    <div class="form-group">
                        <label>Food Name</label>

                        <asp:TextBox ID="txtFoodName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter food name">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Food Type</label>

                        <asp:DropDownList ID="ddlFoodType"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem Value="">Select Food Type</asp:ListItem>
                            <asp:ListItem Value="Veg">Vegetarian</asp:ListItem>
                            <asp:ListItem Value="Non-Veg">Non-Vegetarian</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>


                <div class="form-row">

                    <div class="form-group">
                        <label>Quantity</label>

                        <asp:TextBox ID="txtQuantity"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Number"
                            placeholder="Enter quantity">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>City</label>

                        <asp:TextBox ID="txtCity"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter city">
                        </asp:TextBox>
                    </div>

                </div>


                <div class="form-group">
                    <label>Description</label>

                    <asp:TextBox ID="txtDescription"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="4"
                        placeholder="Describe the food">
                    </asp:TextBox>
                </div>


                <div class="form-group">
                    <label>Pickup Address</label>

                    <asp:TextBox ID="txtPickupAddress"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="3"
                        placeholder="Enter pickup address">
                    </asp:TextBox>
                </div>


                <div class="form-row">

                    <div class="form-group">
                        <label>Pickup Date</label>

                        <asp:TextBox ID="txtPickupDate"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Date">
                        </asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Pickup Time</label>

                        <asp:TextBox ID="txtPickupTime"
                            runat="server"
                            CssClass="form-control"
                            TextMode="Time">
                        </asp:TextBox>
                    </div>

                </div>


                <asp:Button ID="btnDonate"
                    runat="server"
                    Text="Submit Donation"
                    CssClass="donate-submit"
                    CausesValidation="false"
                    OnClick="btnDonate_Click"
                    OnClientClick="return validateDonationForm();" />

            </div>

        </div>

    </section>

</asp:Content>