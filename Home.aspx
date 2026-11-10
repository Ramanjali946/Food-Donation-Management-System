<%@ Page Title="Home"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Home.aspx.cs"
    Inherits="FoodDonationManagement.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet" />

    <link href="~/Content/Home.css" rel="stylesheet" runat="server" />

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="home-page">

    <!-- HERO SECTION -->
    <section class="home-hero">
        <div class="home-container hero-grid">

            <div class="hero-content">
                <h1>Share Food,<br />Spread Hope</h1>
                <p>
                    Don't waste food. Donate surplus food and help people in need
                    through our Food Donation Management System.
                </p>
                <div class="hero-buttons">
                    <a href="Register.aspx" class="primary-button">Get Started</a>
                    <a href="DonateFood.aspx" class="secondary-button">Donate Food</a>
                </div>
            </div>

            <div class="hero-image-wrap">
                <svg viewBox="0 0 520 440" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="A box of donated food with a heart">
                    <circle cx="260" cy="220" r="190" fill="#ffffff" opacity=".07" />
                    <circle cx="260" cy="220" r="140" fill="#ffffff" opacity=".07" />

                    <!-- bread -->
                    <ellipse cx="160" cy="170" rx="62" ry="38" fill="#e8a94d" />
                    <ellipse cx="160" cy="160" rx="56" ry="28" fill="#f4c46e" />
                    <path d="M130 152 q10 -14 20 0 M158 148 q10 -14 20 0 M184 156 q8 -12 16 0" stroke="#c98a2e" stroke-width="4" fill="none" stroke-linecap="round" />

                    <!-- apple -->
                    <circle cx="262" cy="145" r="42" fill="#e5483f" />
                    <path d="M262 108 q4 -22 24 -26" stroke="#5b3a1f" stroke-width="6" fill="none" stroke-linecap="round" />
                    <path d="M270 100 q22 -18 38 -4 q-18 18 -38 4z" fill="#3fae6a" />
                    <ellipse cx="248" cy="132" rx="8" ry="14" fill="#fff" opacity=".28" />

                    <!-- carrot -->
                    <path d="M332 112 l60 70 q8 10 -4 14 q-14 4 -26 -6 z" fill="#f08a24" transform="rotate(-18 360 150)" />
                    <path d="M326 100 q-6 -26 8 -34 M336 104 q4 -28 22 -30 M320 108 q-22 -14 -18 -30" stroke="#3fae6a" stroke-width="7" fill="none" stroke-linecap="round" />

                    <!-- crate -->
                    <path d="M92 210 h336 l-26 160 q-2 14 -16 14 H134 q-14 0 -16 -14 z" fill="#c98a4b" />
                    <path d="M92 210 h336 l-4 24 H96 z" fill="#a86f35" />
                    <rect x="130" y="258" width="260" height="14" rx="7" fill="#a86f35" opacity=".7" />
                    <rect x="136" y="300" width="248" height="14" rx="7" fill="#a86f35" opacity=".7" />
                    <rect x="142" y="342" width="236" height="14" rx="7" fill="#a86f35" opacity=".7" />

                    <!-- heart badge -->
                    <circle cx="260" cy="300" r="46" fill="#ffffff" />
                    <path d="M260 326 c-34 -22 -34 -52 -12 -56 c10 -2 18 4 12 14 c-6 -10 2 -16 12 -14 c22 4 22 34 -12 56z"
                          fill="#e5483f" transform="translate(0,2)" />

                    <!-- sparkles -->
                    <path d="M440 90 l6 16 l16 6 l-16 6 l-6 16 l-6 -16 l-16 -6 l16 -6z" fill="#f5a524" />
                    <path d="M70 80 l4 10 l10 4 l-10 4 l-4 10 l-4 -10 l-10 -4 l10 -4z" fill="#f5a524" opacity=".8" />
                </svg>
            </div>

        </div>
    </section>


    <!-- STATS STRIP -->
    <section class="stats-strip">
        <div class="home-container stats-grid">

            <div class="stat-item">
                <i class="bi bi-box-seam"></i>
                <div><h3>500+</h3><p>Meals Donated</p></div>
            </div>

            <div class="stat-item">
                <i class="bi bi-people"></i>
                <div><h3>120+</h3><p>Active Donors</p></div>
            </div>

            <div class="stat-item">
                <i class="bi bi-building"></i>
                <div><h3>30+</h3><p>Partner NGOs</p></div>
            </div>

            <div class="stat-item">
                <i class="bi bi-truck"></i>
                <div><h3>60+</h3><p>Volunteers</p></div>
            </div>

        </div>
    </section>


    <!-- ABOUT SECTION -->
    <section class="about-section">
        <div class="home-container about-grid">

            <div class="about-image-wrap">
                <svg viewBox="0 0 480 400" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="A plate of fresh food ready for pickup">
                    <!-- plate -->
                    <ellipse cx="240" cy="250" rx="200" ry="110" fill="#ffffff" />
                    <ellipse cx="240" cy="250" rx="160" ry="84" fill="#f1f7f3" />

                    <!-- rice bowl -->
                    <path d="M150 230 h110 q-6 60 -55 60 q-49 0 -55 -60z" fill="#2f9e5b" />
                    <ellipse cx="205" cy="230" rx="55" ry="16" fill="#fdfaf0" />
                    <g fill="#ffffff"><circle cx="185" cy="226" r="4"/><circle cx="200" cy="222" r="4"/><circle cx="216" cy="227" r="4"/><circle cx="230" cy="223" r="4"/><circle cx="195" cy="232" r="4"/><circle cx="222" cy="233" r="4"/></g>

                    <!-- curry bowl -->
                    <path d="M270 236 h96 q-5 52 -48 52 q-43 0 -48 -52z" fill="#f5a524" />
                    <ellipse cx="318" cy="236" rx="48" ry="13" fill="#e2701f" />
                    <circle cx="304" cy="234" r="5" fill="#f7d58a" /><circle cx="326" cy="238" r="5" fill="#f7d58a" /><circle cx="316" cy="231" r="4" fill="#8fd1a4" />

                    <!-- steam -->
                    <path d="M190 200 q-8 -14 0 -26 q8 -12 0 -26 M216 204 q-8 -14 0 -26 q8 -12 0 -26 M310 206 q-8 -14 0 -26 q8 -12 0 -26"
                          stroke="#2f9e5b" stroke-width="5" fill="none" stroke-linecap="round" opacity=".5" />

                    <!-- location pin -->
                    <g transform="translate(360 40)">
                        <path d="M40 0 C14 0 -2 20 -2 42 C-2 70 40 110 40 110 C40 110 82 70 82 42 C82 20 66 0 40 0z" fill="#0f3d2e" />
                        <circle cx="40" cy="42" r="18" fill="#f5a524" />
                    </g>
                    <path d="M40 90 q60 -10 120 30" stroke="#0f3d2e" stroke-width="4" stroke-dasharray="2 10" stroke-linecap="round" fill="none" opacity=".5" />
                </svg>
            </div>

            <div class="hero-content">
                <h2>About Our System</h2>
                <p>
                    Our Food Donation Management System connects food donors,
                    NGOs and volunteers to make sure surplus food reaches
                    people who need it.
                </p>
                <ul class="about-list">
                    <li><i class="bi bi-check-circle-fill"></i> Easy food donation posting</li>
                    <li><i class="bi bi-check-circle-fill"></i> Verified NGOs and receivers</li>
                    <li><i class="bi bi-check-circle-fill"></i> Volunteer-managed delivery</li>
                </ul>
            </div>

        </div>
    </section>


    <section class="how-section">
        <div class="home-container">

            <h2 class="section-title">How It Works</h2>

            <div class="how-grid">

                <div class="how-card">
                    <i class="bi bi-person-plus"></i>
                    <h4>1. Register</h4>
                    <p>Sign up as a Donor, NGO, or Volunteer.</p>
                </div>

                <div class="how-card">
                    <i class="bi bi-basket"></i>
                    <h4>2. Donate</h4>
                    <p>Post details of surplus food available for pickup.</p>
                </div>

                <div class="how-card">
                    <i class="bi bi-truck"></i>
                    <h4>3. Deliver</h4>
                    <p>Volunteers pick up and deliver food to NGOs.</p>
                </div>

                <div class="how-card">
                    <i class="bi bi-heart"></i>
                    <h4>4. Impact</h4>
                    <p>Families in need receive fresh, safe meals.</p>
                </div>

            </div>

        </div>
    </section>


    <!-- CALL TO ACTION -->
    <section class="cta-section">
        <div class="home-container cta-box">
            <h2>Every meal counts. Be the reason someone smiles today.</h2>
            <a href="Register.aspx" class="primary-button">Join Now</a>
        </div>
    </section>

</div>

</asp:Content>
