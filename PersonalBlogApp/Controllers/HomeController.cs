using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PersonalBlogApp.Models;

namespace PersonalBlogApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index(int id)
        {
            using (MyPersonalBlogDBContext context = new())
            {
                ViewBag.id = id;
                ViewBag.cates = context.Categories.ToList();
                ViewBag.specialblogs = context.Blogs
                    .Include(b => b.Category)
                    .Where(e => e.Views >= 50)
                    .Take(5).ToList();
                ViewBag.Lastestblogs = context.Blogs
                    .Include(b => b.Comments)
                    .Include(b => b.Category)
                    .Include(b => b.Users)
                    .OrderByDescending(b => b.Id)
                    .Take(8).Select(b => new
                    {
                        b.Id,
                        b.Title,
                        b.shortDescription,
                        b.Category,
                        b.BigImage,
                        b.Views,
                        b.PublishedDate,
                        b.Users,
                        Count = b.Comments.Count(c => c.BlogId == b.Id)
                    })
                    .ToList();
                ViewBag.login = context.Blogs
                    .Include(b => b.Comments)
                    .Include(b => b.Category)
                    .Include(b => b.Users)
                    .OrderByDescending(b => b.Id)
                    .Where(b => b.accessRights == 1).Select(b => new
                    {
                        b.Id,
                        b.Title,
                        b.shortDescription,
                        b.Category,
                        b.BigImage,
                        b.Views,
                        b.PublishedDate,
                        b.Users,
                        Count = b.Comments.Count(c => c.BlogId == b.Id)
                    })
                    .ToList();
                ViewBag.group = context.Blogs
                    .Include(b => b.Comments)
                    .Include(b => b.Category)
                    .Include(b => b.Users)
                    .OrderByDescending(b => b.Id)
                    .Where(b => b.accessRights == 2).Select(b => new
                    {
                        b.Id,
                        b.Title,
                        b.shortDescription,
                        b.Category,
                        b.BigImage,
                        b.Views,
                        b.PublishedDate,
                        b.Users,
                        Count = b.Comments.Count(c => c.BlogId == b.Id)
                    })
                    .ToList();
                Console.WriteLine(ViewBag.Lastestblogs.Count);
            }
            return View();
        }
    }
}
