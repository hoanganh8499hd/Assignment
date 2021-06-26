using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace WebsiteBanGiay
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            Application["PeopleOnline"] = 0;
        }

        protected void Session_Start()
        {
            Application.Lock();
            Application["PeopleOnline"] = (int)Application["PeopleOnline"]+1;
            Application.UnLock();
        }
        protected void Session_End()
        {
            Application.Lock();
            Application["PeopleOnline"] = (int)Application["PeopleOnline"]-1;
            Application.UnLock();
        }
    }
}
