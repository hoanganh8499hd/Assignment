using PagedList;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Areas.Admin.Controllers
{
    public class QuanLyPhieuNhapController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: Admin/QuanLyPhieuNhap
        public ActionResult Index(int? page)
        {
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 6;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            return View(db.PhieuNhaps.OrderBy(n => n.MaPN).ToPagedList(PageNumber, PageSize));
        }
        [HttpGet]
        public ActionResult NhapHang()
        {
            ViewBag.ListNhaCungCap = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;
            ViewBag.ListSize = db.Sizes;

            return View();
        }
        [HttpPost]
        public ActionResult NhapHang(PhieuNhap model, IEnumerable<ChiTietPhieuNhap> lstCTPhieuNhap)
        {
            ViewBag.ListNhaCungCap = db.NhaCungCaps;
            ViewBag.ListSanPham = db.SanPhams;
            ViewBag.ListSize = db.Sizes;
            model.DaXoa = false;
            db.PhieuNhaps.Add(model);
            db.SaveChanges();
            SanPham sp;
            // Save change để lấy mã phiếu nhập gán cho Chi Tiếp Phiếu nhập
            foreach (var item in lstCTPhieuNhap)
            {
                // Gán mã phiếu nhập cho tất cả các chi tiết phiếu nhập
                item.MaPN = model.MaPN;

                //Cập nhập số lượng tồn 
                sp = db.SanPhams.SingleOrDefault(s => s.MaSP == item.MaSP);
                sp.SoLuongTon += item.SoLuongNhap;

                Size_SanPham size_SanPham = db.Size_SanPham.SingleOrDefault(s => s.MaSP == item.MaSP && s.SizeID == item.SizeID);
                size_SanPham.SoLuong += item.SoLuongNhap;
            }
            db.ChiTietPhieuNhaps.AddRange(lstCTPhieuNhap);// Phương thức Add một list 
            db.SaveChanges();
            ViewBag.NhapThanhCong = "Thêm Hoá Đơn Nhập Thành Công";
            return View();
        }
        //Giải phóng biến cho vùng nhớ

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