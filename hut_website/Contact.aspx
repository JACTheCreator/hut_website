<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="hut_website.Contact" %>

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
                <h3>Contact</h3>
            </div>

            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-8">
                        <div style="width: 95%">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3794.17579347681!2d-76.74609118590448!3d18.01704348908336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8edb3ed77252d65f%3A0xbe483695dda08fef!2sUniversity%20of%20Technology%2C%20Jamaica!5e0!3m2!1sen!2sus!4v1568930174057!5m2!1sen!2sus" width="100%" height="400" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <p>
                            237, 6 Old Hope Road
                            <br /> Kingston
                            <br /> Jamaica
                            <br>
                        </p>
                        <p>
                            <abbr title="Phone">P</abbr>: (123) 456-7890
                        </p>
                        <p>
                            <abbr title="Email">E</abbr>:
                            <a style="color: white; text-decoration: underline" href="mailto:shop@hut.com">shop@hut.com
                            </a>
                        </p>
                        <p>
                            <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
                        </p>
                    </div>
                </div>

            </div>

        </div>
    </div>
</asp:Content>