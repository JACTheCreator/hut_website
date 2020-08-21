<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hut_website._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="row" style="height: 100%">
        <div class="col-md-1" style="background-color: #427597; padding: 25px">
            <img class="horizontal-center" src="Images/logo.svg" width="60">
        </div>

        <div class="col-md-11" style="min-height: 100%; padding: 0">
            <nav class="navbar navbar-expand-lg" style="background-color: #e9ecef">
                <button class="navbar-toggler" style="float: right; color: #427597; border-color: #427597; border-style: solid" type="button" data-toggle="collapse" data-target="#navbarText">Menu</button>                
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/products">Products</a>
                        </li>
                    </ul>
                    <div class="navbar-text">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </li>
                            <li class="nav-item" style="display: inline">
                                <div class="nav-link">
                                    <a href="/cart">Cart <span class="badge badge-warning"><asp:Literal ID="txtCartSize" runat="server"></asp:Literal></span></a>

                                    <asp:Panel style="display:inline" id="linkSignInUp" runat="server">
                                        &nbsp;
                                        <a href="/login">Login</a>
                                        &nbsp;<span style="color: blue;">|</span>&nbsp;
                                        <a href="/register">Register</a>
                                    </asp:Panel>

                                    <asp:Panel style="display:inline" id="linkUserInfo" runat="server" class="nav-link">
                                        <a><asp:Literal id="lblUserEmail" runat="server"/></a>
                                        &nbsp;
                                        <a href="/register"><asp:LinkButton Font-Size="Small" Text="Sign Out" OnClick="SignOut" runat="server"></asp:LinkButton></a>
                                    </asp:Panel>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="jumbotron" style="border-radius: 0">
                <h1>Hut Shop</h1>
                <p class="lead">The best smart products on the market that are energy efficient, easy to use and you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.</p>
                <hr class="my-4">
                <p>Shop now to make your home smart.</p>
                <p class="lead">
                <a class="btn btn-primary btn-lg" href="#" role="button">Shop now</a>
              </p>
            </div>

            <div class="col-md-12">
                <h4>New Products</h4>
                <div class="card-deck">
                    <div class="card text-center" style="width: 18rem;">
                        <div class="card-header">
                            <img class="card-img-top" src="Images/smart-bulb.png" style="width: 50%">
                        </div>
                        <div class="card-body">
                            <h3 class="card-title">Smart Bulb</h3>
                            <h6 class="card-subtitle mb-2 text-muted">Bulb - bulb_zas1</h6>
                            <p class="card-subtitle mb-2 text-muted">A bulb that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.</p>
                            <h2 class="card-text"> $3,300.00</h2> 
                        </div>
                        <div class="card-footer" style="padding: 0; background-color: #427597">
                            <asp:Button style="width: 100%" Text="Add to cart" type="button" class="btn btn-primary" runat="server"/>
                        </div>
                    </div>

                    <div class="card text-center" style="width: 18rem;">
                        <div class="card-header">
                            <img class="card-img-top" src="Images/apf.png" style="width: 77.5%">
                        </div>
                        <div class="card-body">
                            <h3 class="card-title">Automatic Pet Feeder</h3>
                            <h6 class="card-subtitle mb-2 text-muted">Feeder - fed_w3s1</h6>
                            <p class="card-subtitle mb-2 text-muted">A pet feeder that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.</p>
                            <h2 class="card-text"> $36,700.00</h2> 
                        </div>
                        <div class="card-footer" style="padding: 0; background-color: #427597">
                            <asp:Button style="width: 100%" Text="Add to cart" type="button" class="btn btn-primary" runat="server"/>
                        </div>
                    </div>

                    <div class="card text-center" style="width: 18rem;">
                        <div class="card-header">
                            <img class="card-img-top" src="Images/smart-hub.png" style="width: 63.5%">
                        </div>
                        <div class="card-body">
                            <h3 class="card-title">Smart Hub</h3>
                            <h6 class="card-subtitle mb-2 text-muted">hub - hub_zas1</h6>
                            <p class="card-subtitle mb-2 text-muted">A hub that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.</p>
                            <h2 class="card-text"> $6,000.00</h2> 
                        </div>
                        <div class="card-footer" style="padding: 0; background-color: #427597">
                            <asp:Button style="width: 100%" Text="Add to cart" type="button" class="btn btn-primary" runat="server"/>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>