using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hut_website
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                User user = new User().Get(User.Identity.Name);
                lblUserEmail.Text = User.Identity.Name;

                if (User.Identity.IsAuthenticated)
                {
                    linkSignInUp.Visible = false;
                    linkUserInfo.Visible = true;
                    List<CartItem> cartItems = new CartItem().List(user.Email);
                    txtCartSize.Text = cartItems.Sum(x => x.Quantity).ToString();
                }
                else
                {
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
        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}