using Microsoft.AspNetCore.Mvc;
using PersonalBlogApp.Models;
using System.Text.Json.Serialization;
using Newtonsoft.Json;

namespace PersonalBlogApp.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(User user)
        {
            if (ModelState.IsValid)
            {
                bool check = false;
                User u = null;
                using (MyPersonalBlogDBContext context = new MyPersonalBlogDBContext())
                {
                    u = context.Users
                        .FirstOrDefault(a => (a.Email.Equals(user.Email.Trim()) && a.Password.Equals(user.Password)));
                    if (u != null)
                    {
                        string accSession = JsonConvert.SerializeObject(u);
                        HttpContext.Session.SetString("acc", accSession);
                        check = true;
                    }
                }
                if (check)
                {
                    if(u.Role == 1)
                        return Redirect("Admin/Index");
                    else
                        return Redirect("Home/Index");
                }
                else
                {
                    ViewBag.error = "Tài khoản không tồn tại";
                    return View();
                }
            }
            return View();
        }
    }
}
