using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hut_website
{
    public partial class Products : System.Web.UI.Page
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
                }
                else
                {
                    linkSignInUp.Visible = true;
                    linkUserInfo.Visible = false;
                }
                PopulateProducts();
            }
        }

        protected void PopulateProducts()
        {

            List<Product> products = new List<Product>();

            // string description1 = "A bulb that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.";
            // string description2 = "A pet feeder that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.";
            // string description3 = "A hub that you can control from an app on a mobile phone or by Siri, Cortona, Alexa and more.";
            // products.Add(new Product(1, "Smart Bulb", description1, "Bulb", 3300, "Images/smart-bulb.png"));
            // products.Add(new Product(2, "Automatic Pet Feeder", description2, "Feeder", 36700, "Images/apf.png"));
            // products.Add(new Product(3, "Smart Hub", description3, "hub", 6000, "Images/smart-hub.png"));

            Repeater1.DataSource = new Product().GetAllProducts();
            Repeater1.DataBind();
        }

        protected void DeleteProduct(object sender, CommandEventArgs e)
        {
            int id = int.Parse(e.CommandName);
            new Product().Delete(id);
            Response.Redirect("~/Products.aspx");
        }

        protected void EditProduct(object sender, EventArgs e)
        {
            int id = 1;
            Product product = new Product().Get(id);
            txtId.Text = id.ToString();
            txtUpdateName.Text = product.Name;
            txtUpdateCategory.Text = product.Category;
            txtUpdateDescription.Text = product.Description;
            txtUpdatePrice.Text = product.Price.ToString();
            txtUpdateImage.Text = product.Image;
        }

        protected void UpdateProduct(object sender, EventArgs e)
        {
            int id = int.Parse(txtUpdateId.Text);
            Product product = new Product().Get(id);
            product.Name = txtUpdateName.Text;
            product.Category = txtUpdateCategory.Text;
            product.Description = txtUpdateDescription.Text;
            product.Price = float.Parse(txtUpdatePrice.Text);
            product.Image = txtUpdateImage.Text;
            product.Update();
            Response.Redirect("~/Products.aspx");

        }

        protected void AddProduct(object sender, EventArgs e)
        {
            Product product = new Product();
            product.Name = txtProductName.Text;
            product.Category = txtCategory.Text;
            product.Description = txtDescription.Text;
            product.Price = float.Parse(txtUnitPrice.Text);
            product.Image = txtImage.Text;
            product.Add();
            Response.Redirect("~/Products.aspx");
        }

        protected void AddToCart(object sender, CommandEventArgs e)
        {

        }

        protected void SignOut(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("~/Login.aspx");
        }

        protected void Edit(object sender, ListViewEditEventArgs e)
        {
            Repeater1.EditIndex = e.NewEditIndex;
            Repeater1.DataBind();
        }
    }
}