using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.AspNet.Identity.Owin;

namespace hut_website
{
    public partial class Register : System.Web.UI.Page
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

            RequiredFieldValidator4.Visible = true;
            RegularExpressionValidator1.Visible = true;

            RequiredFieldValidator1.Visible = true;

            RequiredFieldValidator2.Visible = true;

            RequiredFieldValidator5.Visible = true;
            CompareValidator2.Visible = true;
            AgeValidator.Visible = true;

            RequiredFieldValidator3.Visible = true;

            CompareValidator1.Visible = true;
            RequiredFieldValidator7.Visible = true;

            RequiredFieldValidator6.Visible = true;
            RegularExpressionValidator2.Visible = true;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                UserStore<IdentityUser> userStore = new UserStore<IdentityUser>();
                UserManager<IdentityUser> manager = new UserManager<IdentityUser>(userStore);

                IdentityUser user = new IdentityUser()
                {
                    UserName = txtEmail.Text
                };

                // DbContext context = HttpContext.Current.GetOwinContext().Get<DbContext>();
                // using (var transaction = context.Database.BeginTransaction())
                {
                    IdentityResult result = manager.Create(user, txtPassword.Text);

                    if (result.Succeeded)
                    {
                        try
                        {
                            new User(txtEmail.Text, txtFirstName.Text, txtLastName.Text, txtPNum.Text, DateTime.Parse(txtDOB.Text), "Customer").Add();
                            var userIdentity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
                            // transaction.Commit();
                            Response.Redirect("~/Login.aspx");
                        }
                        catch (Exception exception)
                        {
                            StatusMessage.Text = exception.ToString();
                            // transaction.Rollback();
                        }
                    }
                    else
                    {
                        StatusMessage.Text = result.Errors.FirstOrDefault();
                    }
                }
            }
        }

        protected void DateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = DateTime.TryParse(args.Value, out dt);
        }

        protected void AgeValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime dt;
            args.IsValid = DateTime.TryParse(args.Value, out dt) && calculateAge(dt) > 18;
        }

        protected int calculateAge(DateTime dob)
        {
            int age = 0;
            age = DateTime.Now.Year - dob.Year;
            if (DateTime.Now.DayOfYear < DateTime.Now.DayOfYear)
            {
                age = age - 1;
            }

            return age;
        }

    }
}
