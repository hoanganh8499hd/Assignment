using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class ThongKeController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Admin/ThongKe
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            ViewBag.PeopleOnline = HttpContext.Application["PeopleOnline"].ToString();
            //ViewBag.TongDoangThu = ThongKeTongDoanhThu();
            return View();
        }
        public decimal ThongKeTongDoanhThu()
        {
            decimal TongDoanhThu = db.ChiTietDonDatHangs.Sum(s => s.DonGia * s.SoLuong).Value;
            return TongDoanhThu;
        }
        public ActionResult DoanhThuTheoThang(DateTime? moneyByDate)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            int thang, nam;
            if (moneyByDate.HasValue)
            {
                thang = moneyByDate.Value.Month;
                nam = moneyByDate.Value.Year;
            }
            else
            {
                thang = DateTime.Now.Month;
                nam = DateTime.Now.Year;
            }

            List<DonDatHang> listDonDatHang = db.DonDatHangs.Where(s => s.NgayDat.Value.Month == thang && s.NgayDat.Value.Year == nam && s.DaThanhToan == true && s.TinhTrangGiaoHang == true).ToList();
            decimal TongDoanhThuTheoThang = 0;
            foreach (var item in listDonDatHang)
            {
                TongDoanhThuTheoThang += item.ChiTietDonDatHangs.Sum(s => s.SoLuong * s.DonGia).Value;
            }
            ViewBag.TongDoangThuTheoThang = TongDoanhThuTheoThang;
            return View(listDonDatHang);
        }
        public ActionResult ThongKeNhapHangTheoThang(DateTime? moneyByDate, int? page)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            int thang, nam;
            if (moneyByDate.HasValue)
            {
                thang = moneyByDate.Value.Month;
                nam = moneyByDate.Value.Year;
            }
            else
            {
                thang = DateTime.Now.Month;
                nam = DateTime.Now.Year;
            }

            List<PhieuNhap> listPhieuNhap = db.PhieuNhaps.Where(s => s.NgayNhap.Value.Month == thang && s.NgayNhap.Value.Year == nam).ToList();
            decimal TongTienNhap = 0;
            foreach (var item in listPhieuNhap)
            {
                TongTienNhap += item.ChiTietPhieuNhaps.Sum(s => s.DonGiaNhap * s.SoLuongNhap).Value;
            }
            ViewBag.TongTienNhap = TongTienNhap;


            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 1;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            return View(listPhieuNhap.OrderBy(n => n.MaPN).ToPagedList(PageNumber, PageSize));
        }
    }
}