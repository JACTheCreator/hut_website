<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="hut_website.Products" %>

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
                <h3>Products</h3>
                <br />
                <button ID="btnAdd" type="button" class="btn btn-primary" data-toggle="modal" runat="server" data-target="#exampleModal">Add A Product</button>
                <button ID="btnEdit" style="color: #427597; background-color: white; border-color: #427597; border-bottom-width: 0" Text="Edit" type="button" class="btn btn-primary" runat="server" data-toggle="modal" data-target="#exampleModal1">Edit</button>                
            </div>

            <div runat="server" class="col-md-12">
                <div>
                    <div class="card-deck">
                    <asp:ListView id="Repeater1" autogenerateeditbutton="true" runat="server">
                        <ItemTemplate>
                            <div class="card text-center" style="width: 18rem;">
                                <div class="card-header">
                                    <img class="card-img-top" src="<%# DataBinder.Eval(Container.DataItem, "Image") %>" style="width: 50%">
                                </div>
                                <div class="card-body">
                                    <h3 class="card-title"> <%# DataBinder.Eval(Container.DataItem, "Name") %> </h3>
                                    <h6 class="card-subtitle mb-2 text-muted"> <%# DataBinder.Eval(Container.DataItem, "Category") %> - <%# DataBinder.Eval(Container.DataItem, "Id") %> </h6>
                                    <p class="card-subtitle mb-2 text-muted"> <%# DataBinder.Eval(Container.DataItem, "Description") %> </p>
                                    <h2 class="card-text"> <%# DataBinder.Eval(Container.DataItem, "Price") %> </h2> 
                                </div>
                                <div class="card-footer" style="padding: 0; margin: 0; background-color: #427597">
                                    <asp:Button style="max-width: 100%; width: 100%" Text="Add to cart" type="button" class="btn btn-primary"  runat="server" OnCommand="AddToCart" CommandName='<%# DataBinder.Eval(Container.DataItem, "Id") %>'/>
                                    <asp:Button ID="btnDel" Visible='<%# ShowDeleteButton %>'  runat="server" style="max-width: 100%; width: 100%; background-color: red" Text="Delete" type="button" class="btn btn-primary" OnCommand="DeleteProduct" CommandName='<%# DataBinder.Eval(Container.DataItem, "Id") %>'/>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Update Product - <asp:Literal ID="txtId" runat="server"></asp:Literal></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="md-input">
                        <asp:TextBox ID="txtUpdateId" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Product ID</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtUpdateName" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Product Name</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtUpdateCategory" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Category</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtUpdateDescription" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Description</label>
                    </div>
           
                    <div class="md-input">
                        <asp:TextBox ID="txtUpdatePrice" runat="server" class="md-form-control" required="" type="number"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Unit Price</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtUpdateImage" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Image</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button style="max-width: 100%; width: 100%;" Text="Update Product" type="button" class="btn btn-primary" OnClick="UpdateProduct" runat="server"/>
                    <asp:Button style="max-width: 100%; width: 100%; background-color: white; border-color: #427597; color: #427597" Text="Close" type="button" class="btn btn-primary" runat="server" data-dismiss="modal"/>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="md-input">
                        <asp:TextBox ID="txtProductName" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Product Name</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtCategory" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Category</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtDescription" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Description</label>
                    </div>
           
                    <div class="md-input">
                        <asp:TextBox ID="txtUnitPrice" runat="server" class="md-form-control" required="" type="number"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Unit Price</label>
                    </div>

                    <div class="md-input">
                        <asp:TextBox ID="txtImage" runat="server" class="md-form-control" required="" type="text"></asp:TextBox>
                        <span class="highlight"></span>
                        <span class="bar"></span>
                        <label>Image</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button style="max-width: 100%; width: 100%;" Text="Add Product" type="button" class="btn btn-primary" OnClick="AddProduct" runat="server"/>
                    <asp:Button style="max-width: 100%; width: 100%; background-color: white; border-color: #427597; color: #427597" Text="Close" type="button" class="btn btn-primary" runat="server" data-dismiss="modal"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>