<%@ Page Title="Volunteers"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Volunteer.aspx.cs"
    Inherits="FoodDonationManagement.Volunteer" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="volunteer-section">

        <div class="volunteer-container">

            <div class="volunteer-header">

                <h1>Become a Volunteer 🚚</h1>

                <p>
                    Be a part of our mission to reduce food waste
                    and help people in need.
                </p>

            </div>


            <div class="volunteer-content">

                <div class="volunteer-card">

                    <div class="volunteer-icon">
                        🚚
                    </div>

                    <h2>Help Deliver Food</h2>

                    <p>
                        Volunteers collect accepted food donations
                        from donors and help deliver them to NGOs
                        and people in need.
                    </p>

                </div>


                <div class="volunteer-card">

                    <div class="volunteer-icon">
                        🤝
                    </div>

                    <h2>Support the Community</h2>

                    <p>
                        Your time and effort can make a meaningful
                        difference in the lives of people who need
                        food and support.
                    </p>

                </div>


                <div class="volunteer-card">

                    <div class="volunteer-icon">
                        🌱
                    </div>

                    <h2>Reduce Food Waste</h2>

                    <p>
                        Help ensure that surplus food reaches people
                        instead of being wasted.
                    </p>

                </div>

            </div>


            <div class="how-volunteer-works">

                <h2>How Volunteering Works</h2>

                <div class="volunteer-steps">

                    <div class="volunteer-step">

                        <span>1</span>

                        <h3>Register</h3>

                        <p>
                            Create your volunteer account.
                        </p>

                    </div>


                    <div class="volunteer-step">

                        <span>2</span>

                        <h3>Login</h3>

                        <p>
                            Login using your volunteer account.
                        </p>

                    </div>


                    <div class="volunteer-step">

                        <span>3</span>

                        <h3>Accept Delivery</h3>

                        <p>
                            Choose an available food delivery.
                        </p>

                    </div>


                    <div class="volunteer-step">

                        <span>4</span>

                        <h3>Deliver Food</h3>

                        <p>
                            Pick up and deliver the donated food.
                        </p>

                    </div>

                </div>

            </div>


            <div class="volunteer-bottom">

                <h2>Ready to Make a Difference? ❤️</h2>

                <p>
                    Join us and help us spread food, kindness and hope.
                </p>

                <a href="Register.aspx"
                   class="volunteer-button">
                    Join as a Volunteer
                </a>

            </div>

        </div>

    </section>

</asp:Content>