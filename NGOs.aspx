<%@ Page Title="NGOs"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="NGOs.aspx.cs"
    Inherits="FoodDonationManagement.NGOs" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="ngo-section">

        <div class="ngo-container">

            <div class="page-header">
                <h1>Our NGO Partners 🤝</h1>

                <p>
                    NGOs help collect donated food and distribute it
                    to people who are in need.
                </p>
            </div>

            <div class="ngo-cards">

                <div class="ngo-card">

                    <div class="ngo-icon">🏢</div>

                    <h2>Helping Hands NGO</h2>

                    <p>
                        Helping communities by providing food and essential
                        support to people in need.
                    </p>

                    <span class="ngo-location">
                        📍 Ahmedabad
                    </span>

                </div>


                <div class="ngo-card">

                    <div class="ngo-icon">❤️</div>

                    <h2>Care & Share Foundation</h2>

                    <p>
                        Working towards reducing food waste and supporting
                        underprivileged communities.
                    </p>

                    <span class="ngo-location">
                        📍 Rajkot
                    </span>

                </div>


                <div class="ngo-card">

                    <div class="ngo-icon">🍲</div>

                    <h2>Food For All</h2>

                    <p>
                        Connecting surplus food with organizations and
                        people who need it.
                    </p>

                    <span class="ngo-location">
                        📍 Hyderabad
                    </span>

                </div>

            </div>

        </div>

    </section>

</asp:Content>