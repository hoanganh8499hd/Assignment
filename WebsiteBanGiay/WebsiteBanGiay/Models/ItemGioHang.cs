using System.Linq;

namespace WebsiteBanGiay.Models
{
    public class ItemGioHang
    {
        public int MaSP { get; set; }
        public string TenSP { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
        public decimal ThanhTien { get; set; }
        public string HinhAnh { get; set; }
        public string Size { get; set; }


        public ItemGioHang(int iMaSP, string size)
        {
            using (QuanLyBanHangEntities db = new QuanLyBanHangEntities()) // để đỡ tốn vùng nhớ
            {
                this.MaSP = iMaSP;
                SanPham sp = db.SanPhams.Single(s => s.MaSP == iMaSP);
                this.TenSP = sp.TenSP;
                this.HinhAnh = sp.HinhAnh;
                this.DonGia = sp.DonGia.Value;
                this.SoLuong = 1;
                this.ThanhTien = DonGia * SoLuong;
                this.Size = size;
            }
        }
        public ItemGioHang(int iMaSP, int sl, string size)
        {
            using (QuanLyBanHangEntities db = new QuanLyBanHangEntities()) // để đỡ tốn vùng nhớ
            {
                this.MaSP = iMaSP;
                SanPham sp = db.SanPhams.Single(s => s.MaSP == iMaSP);
                this.TenSP = sp.TenSP;
                this.HinhAnh = sp.HinhAnh;
                this.DonGia = sp.DonGia.Value;
                this.SoLuong = sl; // để khi nhấn vào nút button tăng số lượng thì sẽ tăng lển 
                this.ThanhTien = DonGia * SoLuong;
                this.Size = size;
            }
        }
        public ItemGioHang()
        {

        }
    }
}