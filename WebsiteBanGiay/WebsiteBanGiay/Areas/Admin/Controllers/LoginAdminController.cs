using System.Linq;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class LoginAdminController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Admin/LoginAdmin
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult LoginAdmin()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LoginAdmin(string userName, string passWord)
        {
            User user = db.Users.FirstOrDefault(u => u.TaiKhoan == userName && u.MatKhau == passWord);
            if (user != null)
            {
                Session["Admin"] = user;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.loginFail = "Tên đăng nhập hoặc mật khẩu không đúng";
                return View();
            }
        }
        public ActionResult LogoutAdmin()
        {
            Session["Admin"] = null;
            return RedirectToAction("LoginAdmin");
        }
    }
}