using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PersonalBlogApp.Models;

namespace PersonalBlogApp.Controllers
{
    public class CategoryController : Controller
    {
        public IActionResult Index(int id, string key = null)
        {
            using (MyPersonalBlogDBContext context = new MyPersonalBlogDBContext())
            {
                Console.WriteLine(key);
                ViewBag.cates = context.Categories.ToList();
                ViewBag.showCate = context.Categories.FirstOrDefault(c => c.Id == id);
                ViewBag.specialblogs = context.Blogs
                    .Include(b => b.Category)
                    .Where(e => e.Views >= 50)
                    .Take(5).ToList();
                Console.WriteLine(id);
                if (id == -1)
                {
                    ViewBag.listcate = context.Blogs
                    .Include(b => b.Comments)
                                    .Include(b => b.Category)
                                    .Include(b => b.Users)
                                    .OrderByDescending(b => b.Id)
                                    .Select(b => new
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
                                    .Where(e => e.Views >= 50)
                                    .ToList();
                }
                else if (id == 0)
                {
                    if (key == null)
                    {
                        ViewBag.listcate = context.Blogs
                                            .Include(b => b.Comments)
                                            .Include(b => b.Category)
                                            .Include(b => b.Users)
                                            .OrderByDescending(b => b.Id)
                                            .Select(b => new
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
                    }
                    else
                    {
                        ViewBag.listcate = context.Blogs.Where(e => e.Title.Contains(key.Trim()))
                                        .Include(b => b.Comments)
                                        .Include(b => b.Category)
                                        .Include(b => b.Users)
                                        .OrderByDescending(b => b.Id)
                                        .Select(b => new
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
                    }
                    ViewBag.key = key;
                    Console.WriteLine(id);
                }
                else if (id != 0)
                {
                    Console.WriteLine("ok");
                    ViewBag.listcate = context.Blogs
                                        .Include(b => b.Comments)
                                        .Include(b => b.Category)
                                        .Include(b => b.Users)
                                        .OrderByDescending(b => b.Id)
                                        .Where(b => b.CategoryId == id).Select(b => new
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
                }
                ViewBag.id = id;
            }
            return View();
        }
    }
}
