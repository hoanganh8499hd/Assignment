using PagedList;
using System.Linq;
using System.Web.Mvc;
using WebsiteBanGiay.Models;

namespace WebsiteBanGiay.Controllers
{
    public class TimKiemController : Controller
    {
        QuanLyBanHangEntities db = new QuanLyBanHangEntities();
        // GET: TimKiem
        public ActionResult Index(string sTuKhoa, int? page)
        {
            //tìm kiếm theo Tên sản phẩm
            var lstsanpham = db.SanPhams.Where(s => s.TenSP.Contains(sTuKhoa));

            if (Request.HttpMethod != "GET")
            {
                page = 1;
            }
            //Thực hiện chức năng phân trang
            //Tạo biến số sản phẩm trên trang
            int PageSize = 6;
            //Tạo biến thứ 2: Số trang hiện tại
            int PageNumber = (page ?? 1);
            ViewBag.TuKhoa = sTuKhoa;
            return View(lstsanpham.OrderBy(n => n.TenSP).ToPagedList(PageNumber, PageSize));
        }
        [HttpPost]
        public ActionResult TimKiem(string sTuKhoa)
        {
            //Gọi về hàm get tìm kiếm cho nó tìm kiếm...
            return RedirectToAction("Index", new { @sTuKhoa = sTuKhoa });
        }
    }
}