using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class QuanLySanPhamController : BaseController
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();


        // GET: Admin/QuanLySanPham
        public ActionResult Index(int? page)
        {
            int pageSize = 6;
            int pageNumber = page ?? 1;
            ViewBag.LoaiSanPham = db.LoaiSanPhams.ToList();
            List<SanPham> lstSanPham = db.SanPhams.ToList();
            return View("~/Areas/Admin/Views/QuanLySanPham/Index.cshtml", db.SanPhams.OrderBy(x => x.MaSP).ToPagedList(pageNumber, pageSize));
        }
        [HttpGet]
        public ActionResult ThemSanPham()
        {
            ViewBag.NhaCungCap = new SelectList(db.NhaCungCaps.OrderBy(s => s.MaNCC), "MaNCC", "TenNCC");
            ViewBag.LoaiSanPham = new SelectList(db.LoaiSanPhams.OrderBy(s => s.MaLoaiSP), "MaLoaiSP", "TenLoai");
            ViewBag.NhaSanXuat = new SelectList(db.NhaSanXuats.OrderBy(s => s.MaNSX), "MaNSX", "TenNSX");
            //ViewBag.Size = new SelectList(db.Sizes.OrderBy(n => n.SizeID), "SizeID", "Number");
            return View();
        }
        [HttpPost]
        public ActionResult ThemSanPham(SanPham sp, HttpPostedFileBase HinhAnh)
        {
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

        /*GetSearchingData 06/05/2021*/
        public JsonResult GetSearchingData(string SearchBy, string SearchValue)
        {
            //db.Configuration.ProxyCreationEnabled = false;
            List<SanPham> sanPhams = db.SanPhams.ToList();
            if (SearchBy == "ID")
            {
                try
                {
                    int Id = Convert.ToInt32(SearchValue);
                    sanPhams = db.SanPhams.Where(x => x.MaSP == Id || SearchValue == null).ToList();
                    foreach (var item in sanPhams)
                    {
                        item.NhaSanXuat.SanPhams.Clear();
                        item.LoaiSanPham.SanPhams.Clear();
                        item.Size_SanPham.Clear();
                        item.ChiTietDonDatHangs.Clear();
                        item.ChiTietPhieuNhaps.Clear();
                        if (item.NhaCungCap != null)
                        {
                            item.NhaCungCap.SanPhams.Clear();

                        }
                    }
                    return Json(sanPhams, JsonRequestBehavior.AllowGet);
                }
                catch (System.Exception)
                {
                    Console.WriteLine("{0} is not a ID", SearchValue);
                    throw;
                }
            }
            else
            {
                sanPhams = db.SanPhams.Where(x => x.TenSP.StartsWith(SearchValue) || SearchValue == null)
                .ToList();
                foreach (var item in sanPhams)
                {
                    item.NhaSanXuat.SanPhams.Clear();
                    item.LoaiSanPham.SanPhams.Clear();
                    item.Size_SanPham.Clear();
                    item.ChiTietDonDatHangs.Clear();
                    item.ChiTietPhieuNhaps.Clear();
                    if (item.NhaCungCap != null)
                    {
                        item.NhaCungCap.SanPhams.Clear();

                    }
                }
                return Json(sanPhams, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult SearchingData(string SearchBy, string SearchValue, Decimal? PriceFrom, Decimal? PriceTo, int? CategorySearch)
        {
            db.Configuration.ProxyCreationEnabled = false;
            int pageSize = 6;
            int pageNumber = 1;
            ViewBag.LoaiSanPham = db.LoaiSanPhams.ToList();

            //List<SanPham> sanPhams = db.SanPhams.ToList();
            //if (SearchBy == "ID")
            //{
            //    try
            //    {
            //        int Id = Convert.ToInt32(SearchValue);
            //        sanPhams = db.SanPhams.Where(x => x.MaSP == Id || SearchValue == null).ToList();
            //        foreach (var item in sanPhams)
            //        {
            //            //item.NhaSanXuat.SanPhams.Clear();
            //            //item.LoaiSanPham.SanPhams.Clear();
            //            //item.Size_SanPham.Clear();
            //            //item.ChiTietDonDatHangs.Clear();
            //            //item.ChiTietPhieuNhaps.Clear();
            //            if (item.NhaCungCap != null)
            //            {
            //                item.NhaCungCap.SanPhams.Clear();

            //            }
            //        }

            //        return PartialView("~/Areas/Admin/Views/QuanLySanPham/ListSanPham.cshtml", db.SanPhams.Where(x => x.TenSP.Contains(SearchValue)).OrderBy(x => x.MaSP).ToPagedList(pageNumber, pageSize));
            //    }
            //    catch (System.Exception)
            //    {
            //        Console.WriteLine("{0} is not a ID", SearchValue);
            //        throw;
            //    }
            //}

            //Searching 01
            //List<SanPham> sanPhams = new List<SanPham>();
            //if (SearchValue == null || SearchValue == "")
            //{
            //    if (PriceFrom == null && PriceTo != null)
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia <= PriceTo
            //                    select sp).ToList();
            //    }
            //    else if (PriceTo == null && PriceFrom != null)
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia >= PriceFrom
            //                    select sp).ToList();
            //    }
            //    else
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia >= PriceFrom && sp.DonGia <= PriceTo
            //                    select sp).ToList();
            //    }
            //}
            //else if (PriceFrom == null && PriceTo != null)
            //{
            //    sanPhams = (from sp in db.SanPhams
            //                where sp.DonGia <= PriceTo && sp.TenSP.StartsWith(SearchValue)
            //                select sp).ToList();
            //}
            //else if (PriceTo == null && PriceFrom != null)
            //{
            //    sanPhams = (from sp in db.SanPhams
            //                where sp.DonGia >= PriceFrom && sp.TenSP.StartsWith(SearchValue)
            //                select sp).ToList();
            //}
            //else
            //{
            //    sanPhams = db.SanPhams.Where(x => x.TenSP.StartsWith(SearchValue) || SearchValue == null).ToList();
            //}  


            //Searching 02
            if (CategorySearch==0)
            {
                CategorySearch = null;
            }
            List<SanPham> sanPhams = new List<SanPham>();
            sanPhams = db.SanPhams.Where(x => x.TenSP.StartsWith(SearchValue) || SearchValue == null)
                        .Where(x => x.DonGia <= PriceTo || PriceTo == null)
                        .Where(x => x.DonGia >= PriceFrom || PriceFrom == null)
                        .Where(x => x.LoaiSanPham.MaLoaiSP == CategorySearch || CategorySearch == null)
                        .ToList();


            //if (SearchValue == null || SearchValue == "")
            //{
            //    if (PriceFrom == null && PriceTo != null)
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia <= PriceTo
            //                    select sp).ToList();
            //    }
            //    else if (PriceTo == null && PriceFrom != null)
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia >= PriceFrom
            //                    select sp).ToList();
            //    }
            //    else
            //    {
            //        sanPhams = (from sp in db.SanPhams
            //                    where sp.DonGia >= PriceFrom && sp.DonGia <= PriceTo
            //                    select sp).ToList();
            //    }
            //}
            //else if (PriceFrom == null && PriceTo != null)
            //{
            //    sanPhams = (from sp in db.SanPhams
            //                where sp.DonGia <= PriceTo && sp.TenSP.StartsWith(SearchValue)
            //                select sp).ToList();
            //}
            //else if (PriceTo == null && PriceFrom != null)
            //{
            //    sanPhams = (from sp in db.SanPhams
            //                where sp.DonGia >= PriceFrom && sp.TenSP.StartsWith(SearchValue)
            //                select sp).ToList();
            //}
            //else
            //{
            //    sanPhams = db.SanPhams.Where(x => x.TenSP.StartsWith(SearchValue) || SearchValue == null).ToList();
            //}


            //foreach (var item in sanPhams)
            //{
            //    //item.NhaSanXuat.SanPhams.Clear();
            //    //item.LoaiSanPham.SanPhams.Clear();
            //    //item.Size_SanPham.Clear();
            //    //item.ChiTietDonDatHangs.Clear();
            //    //item.ChiTietPhieuNhaps.Clear();
            //    //if (item.NhaCungCap != null)
            //    //{
            //    //    item.NhaCungCap.SanPhams.Clear();

            //    //}
            //}

            return View("~/Areas/Admin/Views/QuanLySanPham/Index.cshtml", sanPhams.OrderBy(x => x.MaSP).ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ListSanPham(string SearchValue)
        {
            db.Configuration.ProxyCreationEnabled = false;
            int pageSize = 6;
            int pageNumber = 1;
            List<SanPham> sanPhams = db.SanPhams.ToList();

            //foreach (var item in sanPhams)
            //{
            //    item.NhaSanXuat.SanPhams.Clear();
            //    item.LoaiSanPham.SanPhams.Clear();
            //    item.Size_SanPham.Clear();
            //    item.ChiTietDonDatHangs.Clear();
            //    item.ChiTietPhieuNhaps.Clear();
            //    if (item.NhaCungCap != null)
            //    {
            //        item.NhaCungCap.SanPhams.Clear();
            //    }
            //}


            return PartialView("~/Areas/Admin/Views/QuanLySanPham/ListSanPham.cshtml", db.SanPhams.Where(x => x.TenSP.Contains(SearchValue)).OrderBy(x => x.MaSP).ToPagedList(pageNumber, pageSize));
        }
    }
}