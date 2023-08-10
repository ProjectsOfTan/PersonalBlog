using Microsoft.AspNetCore.Mvc;

namespace PersonalBlogApp.Controllers
{
    public class RegisterController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
