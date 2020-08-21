using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hut_website
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cardSuccess.Visible = false;
                cardError.Visible = false;
                string action = Request.QueryString["action"];
                switch (action)
                {
                    case "success":
                        cardSuccess.Visible = true;
                        List<CartItem> cartItems = new CartItem().List(User.Identity.Name);
                        foreach (CartItem cartItem in cartItems)
                        {
                            Product product = new Product().Get(cartItem.ProductId);
                            new Order()
                            {
                                Email = User.Identity.Name,
                                Quantity = cartItem.Quantity,
                                ProductId = product.Id,
                                TotalCost = cartItem.TotalCost
                            }.Add();
                        }
                        new CartItem().DeleteAll(User.Identity.Name);
                        break;

                    case "error":
                        cardError.Visible = true;
                        break;

                    case "cancel":
                        break;

                    default:
                        cardSuccess.Visible = false;
                        break;
                }
                SubTotal = 0;
                PayPalUrl = "";
                User user = new User().Get(User.Identity.Name);
                lblUserEmail.Text = User.Identity.Name;

                if (User.Identity.IsAuthenticated)
                {

                    linkSignInUp.Visible = false;
                    linkUserInfo.Visible = true;
                    List<CartItem> cartItems = new CartItem().List(user.Email);
                    txtCartSize.Text = cartItems.Sum(x => x.Quantity).ToString();
                    ShowCheckOutButton = true;
                }
                else
                {
                    ShowCheckOutButton = false;
                    linkSignInUp.Visible = true;
                    linkUserInfo.Visible = false;
                    if (Session["cart_items"] != null)
                    {
                        List<CartItem> cartItems = (List<CartItem>)Session["cart_items"];
                        txtCartSize.Text = cartItems.Sum(x => x.Quantity).ToString();
                    }
                    else
                    {
                        List<CartItem> cartItems = new List<CartItem>();
                        Session["cart_items"] = cartItems;
                        txtCartSize.Text = "0";
                    }
                }
            }
            PopulateCart();
        }

        public string PayPalUrl { get; set; }
        public bool ShowCheckOutButton { get; set; }

        public class TableItems
        {
            public int Id { get; set; }
            public String Image { get; set; }
            public String Name { get; set; }
            public float Price { get; set; }
            public int Quantity { get; set; }
            public float TotalCost  { get; set; }
        }

        public float SubTotal { get; set; }

        protected void RemoveFromCart(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandName);

            if (User.Identity.IsAuthenticated)
            {
                new CartItem().Delete(id);
            }
            else
            {
                List<CartItem> cartItems = (List<CartItem>)Session["cart_items"];
                cartItems.RemoveAt(id);
            }
            Response.Redirect("~/Cart.aspx");
        }

        protected void CheckOut(object sender, CommandEventArgs e)
        {

        }

        protected void PopulateCart()
        {
            string redirectUrl = "";

            //Mention URL to redirect content to paypal site
            redirectUrl += "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_cart&upload=1";

            //Business contact paypal EmailID
            redirectUrl += "&business=sb-uy0qr2953972@business.example.com";

            //First name I assign static based on login details assign this value
            redirectUrl += "&first_name=John";

            //Shipping charges if any, or available or using shopping cart system
            redirectUrl += "&shipping=5";

            //Handling charges if any, or available or using shopping cart system
            redirectUrl += "&handling=5";

            //Tax charges if any, or available or using shopping cart system
            redirectUrl += "&tax=0";

            //If transactioin has been successfully performed, redirect SuccessURL page- this page will be designed by developer
            redirectUrl += "&return=" + "https://localhost:44395/Cart?action=success";

            //If transactioin has been failed, redirect FailedURL page- this page will be designed by developer
            redirectUrl += "&cancel_return=" + "https://localhost:44395/Cart";

            List<CartItem> cartItems = new List<CartItem>();
            String email = User.Identity.Name;

            if (User.Identity.IsAuthenticated)
            {
                cartItems = new CartItem().List(email);
            }
            else
            {
                if (Session["cart_items"] != null)
                {
                    cartItems = (List<CartItem>)Session["cart_items"];
                }
            }
            List<TableItems> tableItems = new List<TableItems>();
            float subTotal = 0;
            int index = 1;
            foreach(CartItem cartItem in cartItems)
            {
                Product product = new Product().Get(cartItem.ProductId);
                tableItems.Add(new TableItems()
                {
                    Id = cartItem.Id,
                    Image = product.Image,
                    Name = product.Name,
                    Price = product.Price,
                    Quantity = cartItem.Quantity,
                    TotalCost = cartItem.TotalCost
                });
                subTotal = subTotal + cartItem.TotalCost;
                
                //Product Name
                redirectUrl += "&item_name_" + index + "=" + product.Name;

                //Product Amount
                redirectUrl += "&amount_" + index + "=" + product.Price;

                //Quantiy of product, Here statically added quantity 1
                redirectUrl += "&quantity_"  + index + "=" + cartItem.Quantity;

                index = index + 1;
            }

            if (cartItems.Count == 0)
            {
                Repeater1.Visible = false;
                lblCartEmpty.Visible = true;
            }
            else
            {
                Repeater1.Visible = true;
                lblCartEmpty.Visible = false;
            }

            PayPalUrl = redirectUrl;
            SubTotal = subTotal;
            Repeater1.DataSource = tableItems;
            Repeater1.DataBind();
        }

        protected void PayPalCheckOut(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect(PayPalUrl);
            }
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}