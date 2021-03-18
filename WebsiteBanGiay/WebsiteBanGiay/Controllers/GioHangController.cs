using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Controllers
{
    public class GioHangController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        //Lấy giỏ hàng
        public List<ItemGioHang> LayGioHang()
        {
            //Giỏ hàng đã tồn tại 
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                //Nếu session giỏ hàng chưa tồn tại thì khởi tạo giỏ hàng
                lstGioHang = new List<ItemGioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //Thêm giỏ hàng thông thường (Load lại trang)
        public ActionResult ThemGioHang(int MaSP, string strURL, FormCollection f)
        {
            string m_Size = "";
            m_Size = f["idSize"].ToString();
            //Kiểm tra sản phẩm có tồn tại trong CSDL hay không
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);

            Size size = db.Sizes.FirstOrDefault(s => s.SizeID.ToString() == m_Size);
            Size_SanPham size_SanPham = db.Size_SanPham.FirstOrDefault(s => s.SizeID.ToString() == m_Size);
            if (sp == null)
            {
                //TRang đường dẫn không hợp lệ
                Response.StatusCode = 404;
                return null;
            }
            //Lấy giỏ hàng
            List<ItemGioHang> lstGioHang = LayGioHang();
            //Trường hợp 1 nếu sản phẩm đã tồn tại trong giỏ hàng 
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP && n.Size == size.Number.ToString());
            if (spCheck != null)
            {
                //Kiểm tra số lượng tồn trước khi cho khách hàng mua hàng
                if (size_SanPham.SoLuong <= spCheck.SoLuong)
                {
                    TempData["HetHang"] = "Sản Phẩm Đã Hết Hàng";
                    return RedirectToAction("ChiTietSanPham", "SanPham", new { @id = MaSP });
                }
                spCheck.SoLuong++;
                spCheck.ThanhTien = spCheck.SoLuong * spCheck.DonGia;
                return Redirect(strURL);
            }

            ItemGioHang itemGH = new ItemGioHang(MaSP, size.Number.ToString());
            if ((size_SanPham.SoLuong < itemGH.SoLuong))
            {
                TempData["HetHang"] = "Sản Phẩm Đã Hết Hàng";
                return RedirectToAction("ChiTietSanPham", "SanPham", new { @id = MaSP });
            }

            lstGioHang.Add(itemGH);
            return Redirect(strURL);
        }
        //Tính tổng số lượng
        public double TinhTongSoLuong()
        {
            //Lấy giỏ hàng
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.SoLuong);
        }
        //Tính Tổng tiền 
        public decimal TinhTongTien()
        {
            //Lấy giỏ hàng
            List<ItemGioHang> lstGioHang = Session["GioHang"] as List<ItemGioHang>;
            if (lstGioHang == null)
            {
                return 0;
            }
            return lstGioHang.Sum(n => n.ThanhTien);
        }
        public ActionResult GioHangPartial()
        {
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                ViewBag.TongTien = 0;
                return PartialView();
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            return PartialView();
        }
        // GET: /GioHang/
        public ActionResult XemGioHang()
        {
            string DatHangThanhCong;
            //Lấy giỏ hàng 
            List<ItemGioHang> lstGioHang = LayGioHang();
            if (TinhTongSoLuong() == 0)
            {
                ViewBag.TongSoLuong = 0;
                ViewBag.TongTien = 0;
            }
            ViewBag.TongSoLuong = TinhTongSoLuong();
            ViewBag.TongTien = TinhTongTien();
            if (TempData.ContainsKey("DatHangThanhCong"))
                DatHangThanhCong = TempData["DatHangThanhCong"].ToString(); // returns "Đặt hàng thành công" 
            return View(lstGioHang);
        }
        // GET: GioHang
        public ActionResult Index()
        {
            return View();
        }
        //Chỉnh sửa giỏ hàng
        [HttpPost]
        public ActionResult SuaGioHang(int MaSP, string SizeSP, FormCollection form)
        {
            List<ItemGioHang> lstGioHang = LayGioHang();
            //Size size = db.Sizes.FirstOrDefault(s => s.Number.ToString() == SizeSP);
            Size_SanPham size_SanPham = db.Size_SanPham.FirstOrDefault(s => s.MaSP == MaSP && s.Size.Number.ToString() == SizeSP);
            //Kiểm tra xem sản phẩm đó có tồn tại trong giỏ hàng hay không
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP && n.Size == SizeSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                List<ItemGioHang> lstGH = LayGioHang();
                ItemGioHang itemGHUpdate = lstGH.SingleOrDefault(p => p.MaSP == MaSP && p.Size == SizeSP);
                if (itemGHUpdate != null)
                {
                    int soLuongUpdate = int.Parse(form["txtQuanlity"].ToString());
                    if (size_SanPham.SoLuong < soLuongUpdate)
                    {
                        return RedirectToAction("XemGioHang");
                    }
                    itemGHUpdate.SoLuong = int.Parse(form["txtQuanlity"].ToString());
                    itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.DonGia;
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
                return RedirectToAction("XemGioHang");
            }
        }
        //Xử lý cập nhật giỏ hàng
        //[HttpPost]
        //public ActionResult CapNhatGioHang(int MaSP, string SizeSP, FormCollection form)
        //{
        //    SanPham prd = db.SanPhams.SingleOrDefault(p => p.MaSP == MaSP);
        //    if (prd == null)
        //    {
        //        return RedirectToAction("Index", "Home");
        //    }
        //    else
        //    {
        //        List<ItemGioHang> lstGH = LayGioHang();
        //        ItemGioHang itemGHUpdate = lstGH.SingleOrDefault(p => p.MaSP == MaSP && p.Size == SizeSP);
        //        if (itemGHUpdate != null)
        //        {
        //            itemGHUpdate.SoLuong = int.Parse(form["txtQuanlity"].ToString());
        //            itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.DonGia;
        //        }
        //        else
        //        {
        //            return RedirectToAction("Index", "Home");
        //        }
        //        return RedirectToAction("XemGioHang");
        //    }
        //    ////Bước 1: Lấy List<GioHang> từ session["GioHang"]
        //    //List<ItemGioHang> lstGH = LayGioHang();
        //    ////Bước 2: Lấy sản phẩm cần cập nhật từ trong list<GioHang> ra
        //    //ItemGioHang itemGHUpdate = lstGH.Find(n => n.MaSP == MaSP && n.Size == SizeSP);
        //    ////Kiểm tra số lượng tồn 
        //    //SanPham spCheck = db.SanPhams.Single(n => n.MaSP == MaSP);
        //    //if (spCheck.SoLuongTon < itemGHUpdate.SoLuong)
        //    //{
        //    //    return View("ThongBao");
        //    //}
        //    //else
        //    //{
        //    ////Bước 3: Tiến hành cập nhật lại số lượng cũng thành tiền
        //    //itemGHUpdate.SoLuong = itemGH.SoLuong;
        //    //itemGHUpdate.ThanhTien = itemGHUpdate.SoLuong * itemGHUpdate.DonGia;

        //    //}
        //    //return RedirectToAction("XemGioHang");
        //}
        public ActionResult XoaGioHang(int MaSP, string SizeSP)
        {
            //Kiểm tra session giỏ hàng tồn tại chưa 
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //Kiểm tra sản phẩm có tồn tại trong CSDL hay không
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.MaSP == MaSP);
            if (sp == null)
            {
                //TRang đường dẫn không hợp lệ
                Response.StatusCode = 404;
                return null;
            }
            //Lấy list giỏ hàng từ session
            List<ItemGioHang> lstGioHang = LayGioHang();
            //Kiểm tra xem sản phẩm đó có tồn tại trong giỏ hàng hay không
            ItemGioHang spCheck = lstGioHang.SingleOrDefault(n => n.MaSP == MaSP && n.Size == SizeSP);
            if (spCheck == null)
            {
                return RedirectToAction("Index", "Home");
            }
            //Xóa item trong giỏ hàng
            lstGioHang.Remove(spCheck);
            return RedirectToAction("XemGioHang");
        }
        //Xây dựng chức năng đặt hàng
        public ActionResult DatHang()
        {
            try
            {
                DonDatHang ddh = new DonDatHang();
                ThanhVien tv = Session["TaiKhoan"] as ThanhVien;

                ddh.MaThanhVien = tv.MaThanhVien;
                ddh.NgayDat = DateTime.Now;
                ddh.TinhTrangGiaoHang = false;
                ddh.DaThanhToan = false;
                ddh.UuDai = 0;
                ddh.DaHuy = false;
                ddh.DaXoa = false;
                db.DonDatHangs.Add(ddh);
                db.SaveChanges();


                //Thêm chi tiết đơn đặt hàng
                List<ItemGioHang> lstGH = LayGioHang();
                foreach (var item in lstGH)
                {
                    ChiTietDonDatHang ctdh = new ChiTietDonDatHang();
                    ctdh.MaDDH = ddh.MaDDH;
                    ctdh.MaSP = item.MaSP;
                    ctdh.TenSP = item.TenSP;
                    ctdh.SizeID = db.Sizes.FirstOrDefault(s => s.Number.ToString() == item.Size).SizeID;
                    ctdh.SoLuong = item.SoLuong;
                    Size_SanPham size_SanPham = db.Size_SanPham.SingleOrDefault(s => s.MaSP == item.MaSP && s.SizeID == ctdh.SizeID);
                    size_SanPham.SoLuong -= item.SoLuong;
                    SanPham sp = db.SanPhams.SingleOrDefault(s => s.MaSP == item.MaSP);
                    sp.SoLuongTon -= item.SoLuong;
                    sp.SoLanMua += 1;
                    ctdh.DonGia = sp.DonGia;
                    db.ChiTietDonDatHangs.Add(ctdh);
                }
                db.SaveChanges();
                Session["GioHang"] = null;
                TempData["DatHangThanhCong"] = "Đặt Hàng Thành Công";
                return RedirectToAction("XemGioHang");
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                return null;
            }
        }
    }
}