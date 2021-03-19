using PagedList;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class QuanLySanPhamController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Admin/QuanLySanPham
        public ActionResult Index(int? page)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            int pageSize = 6;
            int pageNumber = page ?? 1;
            List<SanPham> lstSanPham = db.SanPhams.ToList();
            return View(db.SanPhams.OrderBy(x => x.MaSP).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult ThemSanPham()
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            ViewBag.NhaCungCap = new SelectList(db.NhaCungCaps.OrderBy(s => s.MaNCC), "MaNCC", "TenNCC");
            ViewBag.LoaiSanPham = new SelectList(db.LoaiSanPhams.OrderBy(s => s.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.NhaSanXuat = new SelectList(db.NhaSanXuats.OrderBy(s => s.MaNSX), "MaNSX", "TenNSX");
            //ViewBag.Size = new SelectList(db.Sizes.OrderBy(n => n.SizeID), "SizeID", "Number");
            return View();
        }
        [HttpPost]
        public ActionResult ThemSanPham(SanPham sp, HttpPostedFileBase HinhAnh)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Load dropdownlist nhà cung cấp và dropdownlist loại sp, mã nhà sản xuất
            ViewBag.NhaCungCap = new SelectList(db.NhaCungCaps.OrderBy(n => n.MaNCC), "MaNCC", "TenNCC");
            ViewBag.LoaiSanPham = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.NhaSanXuat = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX");
            //ViewBag.Size = new SelectList(db.Sizes.OrderBy(n => n.SizeID), "SizeID", "Number");

            string filename = "";
            if (HinhAnh != null && HinhAnh.ContentLength > 0)
            {

                filename = Path.GetFileName(HinhAnh.FileName);

                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh/SanPham/"), filename);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.UploadError = "Hình Ảnh Đã Tồn Tại";
                    return View(sp);
                }
                HinhAnh.SaveAs(path);
            }
            sp.SoLuongTon = 0;
            sp.HinhAnh = filename;
            sp.SoLanMua = 0;
            db.SanPhams.Add(sp);

            List<Size> sizeList = db.Sizes.OrderBy(x => x.SizeID).ToList();

            for (int i = 0; i < sizeList.Count(); i++)
            {
                Size_SanPham size_SanPham = new Size_SanPham();
                size_SanPham.SizeID = sizeList[i].SizeID;
                size_SanPham.MaSP = sp.MaSP;
                size_SanPham.SoLuong = 0;
                db.Size_SanPham.Add(size_SanPham);
            }
            db.SaveChanges();
            ViewBag.ThongBao = "Thêm Sản Phẩm Thành Công";
            return View();
        }
        [HttpGet]
        public ActionResult ChinhSuaSanPham(int? id)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            //Lấy sản phẩm  cần chỉnh sửa dựa vào id
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(s => s.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();// không tìm thấy
            }
            // Load Dropdow list  nhà cung cấp
            ViewBag.NhaCungCap = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sp.MaNCC);
            ViewBag.LoaiSanPham = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            ViewBag.NhaSanXuat = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX", sp.MaNSX);
            return View(sp);
        }
        [HttpPost]
        public ActionResult ChinhSuaSanPham(SanPham sp, HttpPostedFileBase HinhAnh)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            ViewBag.NhaCungCap = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "MaNCC", "TenNCC", sp.MaNCC);
            ViewBag.LoaiSanPham = new SelectList(db.LoaiSanPhams.OrderBy(n => n.MaLoaiSP), "MaLoaiSP", "TenLoai", sp.MaLoaiSP);
            ViewBag.NhaSanXuat = new SelectList(db.NhaSanXuats.OrderBy(n => n.MaNSX), "MaNSX", "TenNSX", sp.MaNSX);
            // do chưa kiểm tra validtion nên tạm thời cho nó đúng 
            //if (ModelState.IsValid)
            //{
            string filename = "";
            if (HinhAnh != null && HinhAnh.ContentLength > 0)
            {

                filename = Path.GetFileName(HinhAnh.FileName);

                var path = Path.Combine(Server.MapPath("~/Content/HinhAnh/SanPham/"), filename);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.UploadError = "Hình Ảnh Đã Tồn Tại";
                    return View(sp);
                }
                HinhAnh.SaveAs(path);
            }

            sp.HinhAnh = filename;

            db.Entry(sp).State = System.Data.Entity.EntityState.Modified;
            //Size_SanPham size_SanPham=db.Size_SanPham.SingleOrDefault
            db.SaveChanges();
            ViewBag.ThongBao = "Sửa Thành Công";
            return RedirectToAction("Index");
            //}
            //ViewBag.ThongBao = "Sửa thất bại";
            //return View(sp);
        }
        [HttpGet]
        public ActionResult XoaSanPham(int? id)
        {
            if (Session["Admin"] == null)
            {
                return RedirectToAction("LoginAdmin", "LoginAdmin");
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sp = db.SanPhams.SingleOrDefault(s => s.MaSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            return View(sp);
        }
        [HttpPost, ActionName("XoaSanPham")]
        [ValidateAntiForgeryToken]
        public ActionResult XacNhanXoa(int id)
        {
            SanPham sp = db.SanPhams.SingleOrDefault(s => s.MaSP == id);
            if (sp == null)
            {

                return HttpNotFound();
            }
            db.SanPhams.Remove(sp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}