using CaptchaMvc.HtmlHelpers;
using System;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Controllers
{
    public class HomeController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        public ActionResult Index()
        {
            var NewProduct = db.SanPhams.Where(n => n.Moi == 1);
            ViewBag.SanPhamMoi = NewProduct;
            return View();
        }
        public ActionResult MenuPartial()
        {
            var danhsachmenu = db.SanPhams;
            return PartialView(danhsachmenu);
        }
        [HttpGet]
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(ThanhVien tv, FormCollection f)
        {
            try
            {
                System.Threading.Thread.Sleep(200);
                var x = db.ThanhViens.Where(n => n.TaiKhoan == tv.TaiKhoan || n.Email == tv.Email).SingleOrDefault();
                if (x != null)
                {
                    ViewBag.ThongBao = "Người dùng đã tồn tại";
                    return View();
                }
                else
                {
                    //Kiểm tra captcha hợp lệ
                    if (this.IsCaptchaValid("Captcha is not valid"))
                    {
                        var keyNew = Helper.GeneratePassword(10);
                        var password = Helper.EncodePassword(tv.MatKhau, keyNew);
                        tv.MatKhau = password;
                        tv.vCode = keyNew;
                        if (ModelState.IsValid)
                        {
                            ViewBag.ThongBao = "Success";
                            db.ThanhViens.Add(tv);
                            db.SaveChanges();
                            return View();
                        }
                        else
                        {
                            ViewBag.ThongBao = "Fail";
                        }
                        return View();

                    }
                    ViewBag.ThongBao = "Sai mã captcha";

                    return View();
                }
            }
            catch (Exception e)
            {
                ViewBag.ErrorMessage = "Some exception occured" + e;
                return View();
            }

        }
        //Xây dựng action đăng nhập
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            //Kiểm tra tên đăng nhập và mật khẩu
            string TaiKhoan = f["txtTenDangNhap"].ToString();
            string MatKhau = f["txtMatKhau"].ToString();
            ThanhVien tv = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == TaiKhoan);
            if (tv != null)
            {
                var hashCode = tv.vCode;
                //Password Hasing Process Call Helper Class Method    
                var encodingPasswordString = Helper.EncodePassword(MatKhau, hashCode);
                ThanhVien thanhVien = db.ThanhViens.SingleOrDefault(n => n.TaiKhoan == TaiKhoan && n.MatKhau.Equals(encodingPasswordString));
                if (thanhVien != null)
                {
                    Session["TaiKhoan"] = thanhVien;
                    return RedirectToAction("Index");
                }
                ViewBag.ThongBao = "Sai tên đăng Nhập Hoặc Mật Khẩu";
                return RedirectToAction("Index");
            }
            ViewBag.ThongBao = "Sai tên đăng Nhập Hoặc Mật Khẩu";
            return RedirectToAction("Index");
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Index");
        }
    }
}