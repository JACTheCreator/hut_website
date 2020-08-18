using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace hut_website
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            String adminEmail = "admin@admin.com";
            String adminPassword = "12345678";

            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);
            var user = userManager.Find(adminEmail, adminPassword);

            if (new User().Get(adminEmail) == null )
            {
                new User(adminEmail, "Admin", "Admin", "876 123 4572", DateTime.Parse("12/12/12"), "Admin").Add();
            }

            if (user == null)
            {
                UserStore<IdentityUser> adminStore = new UserStore<IdentityUser>();
                UserManager<IdentityUser> manager = new UserManager<IdentityUser>(adminStore);

                IdentityUser adminUser = new IdentityUser()
                {
                    UserName = adminEmail
                };

                IdentityResult result = manager.Create(adminUser, adminPassword);
                if (result.Succeeded)
                {
                    manager.CreateIdentity(adminUser, DefaultAuthenticationTypes.ApplicationCookie);
                }
            }
        }
    }
}