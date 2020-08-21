<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="hut_website.Cart" %>

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

                                    <asp:Panel style="display:inline"  id="linkSignInUp" runat="server">
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
                <h3>Cart</h3>

            </div>
            <div runat="server" class="col-md-12">
                <div>
                    <div id="cardSuccess" runat="server" class="container alert alert-success" role="alert">
                        <h4 class="alert-heading">Purchase successfully Made!</h4>
                        <p>Please see your order <a href="/Orders">here</a></p>
                    </div>

                    <div id="cardError" runat="server" class="container alert alert-danger" role="alert">
                        <h4 class="alert-heading">Purchase Error!</h4>
                        <p>An error has occured. Please try at a later time or <a href="/Contact">contact us</a></p>
                    </div>

                    <div class="container">
                        <asp:Label ID="lblCartEmpty" Text="Cart is Empty" runat="server"></asp:Label>
                    </div>

                    <div class="card-deck">
                    <asp:Repeater id="Repeater1" runat="server"> 
                        <HeaderTemplate>
                            <div class="container">
                                <div class="row">
                                    <div class="col-sm">
                                        Product
                                    </div>
                                    <div class="col-sm">
                                    </div>
                                    <div class="col-sm">
                                        Price
                                    </div>
                                    <div class="col-sm">
                                        Quantity
                                    </div>
                                    <div class="col-sm">
                                        Total Cost
                                    </div>
                                </div>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="container">
                                <hr />
                                <div class="row align-items-center">
                                    <div class="col-sm">
                                        <img src="<%# DataBinder.Eval(Container.DataItem, "Image") %>" style="width: 50px">
                                    </div>
                                    <div class="col-sm">
                                        <%# DataBinder.Eval(Container.DataItem, "Name") %> <br />
                                        <asp:LinkButton ID="btnRemoveFromCart" runat="server" Text="Remove" OnCommand="RemoveFromCart" CommandName='<%# DataBinder.Eval(Container.DataItem, "Id") %>'></asp:LinkButton>

                                    </div>
                                    <div class="col-sm">
                                        <%# DataBinder.Eval(Container.DataItem, "Price") %>
                                    </div>
                                    <div class="col-sm">
                                        <%# DataBinder.Eval(Container.DataItem, "Quantity") %>
                                    </div>
                                    <div class="col-sm">
                                        <%# DataBinder.Eval(Container.DataItem, "TotalCost") %>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <div class="container">
                                <hr />
                                <div class="row">
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm">
                                        Sub Total
                                    </div>
                                    <div class="col-sm">
                                        <%= SubTotal %>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm">
                                        <asp:LinkButton Enabled='<%# ShowCheckOutButton %>' style="width: 70%" CssClass="btn btn-primary" ID="btnCheckOut" runat="server" Text="Check Out" OnClick="PayPalCheckOut"></asp:LinkButton>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm"></div>
                                    <div class="col-sm">
                                        <asp:Literal Visible='<%# !ShowCheckOutButton %>' runat="server">You must <a href="/Login">login</a> before checking out!</asp:Literal>
                                    </div>
                                </div>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
