using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Admin/QuanLyDonHang
        public ActionResult Index()
        {
            return View();
        }

        // GET: /QuanLyDonHang/     
        public ActionResult ChuaThanhToan()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Lấy danh Sách các đơn hàng chưa duyệt
            var ds = db.DonDatHangs.Where(s => s.DaThanhToan == false && s.DaThanhToan == false).OrderBy(s => s.NgayDat);
            return View(ds);
        }
        public ActionResult ChuaGiao()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Lấy danh sách đơn hàng chưa giao 
            var lstDSDHCG = db.DonDatHangs.Where(n => n.TinhTrangGiaoHang == false && n.DaThanhToan == true).OrderBy(n => n.NgayGiao);
            return View(lstDSDHCG);
        }
        public ActionResult DaGiaoDaThanhToan()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Lấy danh sách đơn hàng chưa giao 
            var lstDSDHCG = db.DonDatHangs.Where(n => n.TinhTrangGiaoHang == true && n.DaThanhToan == true);
            return View(lstDSDHCG);
        }
        [HttpGet]
        public ActionResult DuyetDonHang(int? id)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Kiểm tra xem id hợp lệ không
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonDatHang model = db.DonDatHangs.SingleOrDefault(n => n.MaDDH == id);
            //Kiểm tra đơn hàng có tồn tại không
            if (model == null)
            {
                return HttpNotFound();
            }
            //Lấy danh sách chi tiết đơn hàng để hiển thị cho người dùng thấy
            var lstChiTietDH = db.ChiTietDonDatHangs.Where(n => n.MaDDH == id);
            ViewBag.ListChiTietDH = lstChiTietDH;
            return View(model);
        }
        [HttpPost]
        public ActionResult DuyetDonHang(DonDatHang ddh)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Truy vấn lấy ra dữ liệu của đơn hàn đó 
            DonDatHang ddhUpdate = db.DonDatHangs.Single(n => n.MaDDH == ddh.MaDDH);
            ddhUpdate.DaThanhToan = ddh.DaThanhToan;
            ddhUpdate.TinhTrangGiaoHang = ddh.TinhTrangGiaoHang;
            db.SaveChanges();

            //Lấy danh sách chi tiết đơn hàng để hiển thị cho người dùng thấy
            var lstChiTietDH = db.ChiTietDonDatHangs.Where(n => n.MaDDH == ddh.MaDDH);
            ViewBag.ListChiTietDH = lstChiTietDH;
            return View(ddhUpdate);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (db != null)
                    db.Dispose();
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}