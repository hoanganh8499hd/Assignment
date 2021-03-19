using System.Web.Mvc;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            return View();
        }
    }
}