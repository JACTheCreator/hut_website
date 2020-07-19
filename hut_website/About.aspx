<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="hut_website.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="row" style="height: 100%">
        <div class="col-md-1" style="min-height: 100%; background-color: #427597; padding: 25px">
            <img class="horizontal-center" src="Images/logo.svg" width="60">
        </div>

        <div class="col-md-11" style="min-height: 100%; padding: 0">
            <nav class="navbar navbar-expand-lg" style="background-color: #e9ecef">
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
                            <li class="nav-item">
                                <span class="nav-link">
                                    <a href="/login">Login</a>
                                    &nbsp;<span style="color: blue;">|</span>&nbsp;
                                    <a href="/register">Register</a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="jumbotron" style="border-radius: 0">
                <h3>About</h3>
            </div>

            <div class="col-md-12">
                Hut is an online store that sells smart appliances to turn any home into a SMART HOME. Hut was founded by Jermaine Coates, a student of The University of Technology , Jamaica in 2005. The aim of hut is make the ordinary home smart. 
            </div>

        </div>
    </div>
</asp:Content>