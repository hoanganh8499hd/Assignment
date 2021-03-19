using PagedList;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Controllers
{
    public class SanPhamController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: SanPham
        public ActionResult Index()
        {
            return View();
        }
        //Chỉ action chưa partial view chạy được
        [ChildActionOnly]
        public ActionResult SanPhamMoiPartial()
        {
            var sanpham = db.SanPhams.Where(x => x.Moi == 1).ToList();
            ViewBag.SanPhamMoi = sanpham;
            return PartialView();
        }
        public ActionResult PhanLoaiSanPham()
        {
            var sanPham = db.SanPhams;
            return PartialView(sanPham);
        }
        public ActionResult ChiTietSanPham(int? id)
        {
            //Kiểm tra tham số
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Lấy dữ liệu tương ứng
            var sanpham = db.SanPhams.SingleOrDefault(s => s.MaSP == id && s.DaXoa == false);
            if (sanpham == null)
            {
                return HttpNotFound();
            }
            List<Size_SanPham> lstProductSize = db.Size_SanPham.Where(p => p.MaSP == id).ToList();
            ViewBag.lstProductSize = lstProductSize;
            return View(sanpham);
        }
        //Danh sach san pham (menu)
        public ActionResult SanPham(int? MaLoaiSP, int? MaNSX, int? page)
        {
            if (MaLoaiSP == null || MaNSX == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lstSP = db.SanPhams.Where(n => n.MaLoaiSP == MaLoaiSP && n.MaNSX == MaNSX);
            if (lstSP.Count() == 0)
            {
                //Thông báo nếu như không có sản phẩm đó
                return HttpNotFound();
            }

            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 6;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.MaLoaiSP = MaLoaiSP;
            ViewBag.MaNSX = MaNSX;
            return View(lstSP.OrderBy(n => n.MaSP).ToPagedList(PageNumber, PageSize));
        }
        public ActionResult SanPhamTheoNhaSanXuat(int? MaNSX, int? page)
        {
            if (MaNSX == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lstSP = db.SanPhams.Where(n => n.MaNSX == MaNSX);
            if (lstSP.Count() == 0)
            {
                //Thông báo nếu như không có sản phẩm đó
                return HttpNotFound();
            }
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 6;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.MaNSX = MaNSX;
            return View(lstSP.OrderBy(n => n.MaSP).ToPagedList(PageNumber, PageSize));
        }
        public ActionResult SanPhamTheoLoaiSanPham(int? MaLoaiSP, int? page)
        {
            if (MaLoaiSP == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var lstSP = db.SanPhams.Where(n => n.MaLoaiSP == MaLoaiSP);
            if (lstSP.Count() == 0)
            {
                //Thông báo nếu như không có sản phẩm đó
                return HttpNotFound();
            }
            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 6;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.MaLoaiSP = MaLoaiSP;
            return View(lstSP.OrderBy(n => n.MaSP).ToPagedList(PageNumber, PageSize));
        }
    }
}