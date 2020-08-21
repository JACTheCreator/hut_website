<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="hut_website.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 100%">
        <div class="col-md-1" style="background-color: #427597; padding: 25px">
            <img class="horizontal-center" src="images/logo.svg" width="60">
        </div>


        <div class="col-md-4" style="height: 100%; overflow: scroll" >
            
            <div class="center">
                <h1>Sign Up</h1>
                <br />
                <div class="md-input">
                    <asp:TextBox ID="txtEmail" runat="server" class="md-form-control" required=""></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Email</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEmail" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"></asp:RegularExpressionValidator> 


                <div class="md-input">
                    <asp:TextBox ID="txtFirstName" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>First Name</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required"></asp:RequiredFieldValidator>

                <div class="md-input">
                    <asp:TextBox ID="txtLastName" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Last Name</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required"></asp:RequiredFieldValidator>

                <div class="md-input">
                    <asp:TextBox ID="txtDOB" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Date of Birth</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDOB" ErrorMessage="Date of Birth is required"></asp:RequiredFieldValidator>
                <asp:CompareValidator Display="Dynamic" runat="server" ID="CompareValidator2" ControlToValidate="txtDOB" ErrorMessage="Invalid Date" Type="Date" Operator="DataTypeCheck" ValidationGroup="grpDate"></asp:CompareValidator>
                <asp:CustomValidator Display="Dynamic" runat="server" OnServerValidate="AgeValidator_ServerValidate" ID="AgeValidator" ControlToValidate="txtDOB" ErrorMessage="Must be 18 years or over."></asp:CustomValidator>          
           
                <div class="md-input">
                    <asp:TextBox ID="txtPassword" runat="server" class="md-form-control" required="" type="password"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Password</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                <div class="md-input">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" class="md-form-control" required="" type="password"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Confirm Password</label>
                </div>
                <asp:CompareValidator Display="Dynamic" ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ErrorMessage="Passwords do not match"></asp:CompareValidator>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required"></asp:RequiredFieldValidator>

                <div class="md-input">
                    <asp:TextBox ID="txtPNum" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <label>Phone Number</label>
                </div>
                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPNum" ErrorMessage="Phone Number is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPNum" ErrorMessage="Invalid Phone Number Format. The correct format is ### ### ####" ValidationExpression="\d{3}\s\d{3}\s\d{4}"></asp:RegularExpressionValidator>    
                
                <asp:Label runat="server" ID="StatusMessage"></asp:Label>

                <asp:Button Text="Create Account" type="button" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click"/>

                <p class="horizontal-center">
                    Already have an account? <a href="/Login" class="a-primary">SIGN UP</a>
                </p>

                <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" />--%>

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