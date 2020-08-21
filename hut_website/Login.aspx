<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="hut_website.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 100%">
        <div class="col-md-1" style="background-color: #427597; padding: 25px">
            <img class="horizontal-center" src="images/logo.svg" width="60">
        </div>


        <div class="col-md-4" style="height: 100%">
            <div class="center">
                <h1>Login</h1>
                <br />
                <div class="md-input">
                    <asp:TextBox ID="txtEmail" runat="server" class="md-form-control" required=""></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Email</label>
                </div>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>--%>
                <%--<asp:RegularExpressionValidator ID="RezgularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator>--%>       

                <div class="md-input">
                    <asp:TextBox ID="txtPassword" runat="server" class="md-form-control" type="password" required=""></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Password</label>
                </div>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>--%>

                <asp:Button Text="Sign In" type="button" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click"/>
                    
                <asp:Label class="horizontal-center" ID="lblInvalidCredentials" runat="server"></asp:Label>

                <p class="horizontal-center">
                    Already have an account? <a href="/register" class="a-primary">SIGN UP</a>
                </p>

                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

            </div>
        </div>


        <div class="col-md-7" style="height: 100%; background-color: #427597">
            <nav class="navbar navbar-expand-lg">
                <button class="navbar-toggler" style="float: right; color: #427597; border-color: #427597; border-style: solid" type="button" data-toggle="collapse" data-target="#navbarText">Menu</button>
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link a-white" href="/">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link a-white" href="/about">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link a-white" href="/contact">Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link a-white" href="/products">Products</a>
                        </li>
                    </ul>
                    <div class="navbar-text">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link a-white">
                                    <i class="fas fa-shopping-cart"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <span class="nav-link">
                                    <a class="a-white" href="/login">Login</a>
                                    &nbsp;<span style="color: white;">|</span>&nbsp;
                                    <a class="a-white" href="/register">Register</a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>

</asp:Content>
