﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace hut_website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    Response.Redirect("~/Products.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var userStore = new UserStore<IdentityUser>();
                var userManager = new UserManager<IdentityUser>(userStore);
                var user = userManager.Find(txtEmail.Text, txtPassword.Text);

                if (user != null)
                {
                    var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                    var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                    authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);
                    if (Session["cart_items"] != null)
                    {
                        List<CartItem> cartItems = (List<CartItem>)Session["cart_items"];
                        foreach (CartItem cartItem in cartItems)
                        {
                            new CartItem()
                            {
                                Email = User.Identity.Name,
                                ProductId = cartItem.ProductId,
                                Quantity = cartItem.Quantity,
                                TotalCost = cartItem.TotalCost
                            }.Add();
                        }

                        Session["cart_items"] = null;
                    }
                    Response.Redirect("~/Login.aspx");
                    lblInvalidCredentials.Text = "Success";
                }
                else
                {
                    lblInvalidCredentials.Text = "Wrong credentials provided";
                }
            }

        }
    }
}