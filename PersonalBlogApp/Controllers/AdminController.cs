using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Newtonsoft.Json;
using PersonalBlogApp.Models;
using System.IO;
using System.Net.Mime;
using System.Net.NetworkInformation;
using System.Reflection.Metadata;
using System.Text.Json.Nodes;

namespace PersonalBlogApp.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index(String key = null, String searchkey = null)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    if (!String.IsNullOrEmpty(key))
                    {
                        ViewBag.blogs = context.Blogs.Include(e => e.Category)
                        .Where(e => (e.Title.Contains(key)))
                            .ToList();
                    }
                    else if (!String.IsNullOrEmpty(searchkey) && !searchkey.Equals("0"))
                    {
                        ViewBag.blogs = context.Blogs.Include(e => e.Category)
                        .Where(e => e.CategoryId == Int32.Parse(searchkey))
                            .ToList();
                    }
                    else
                    {
                        ViewBag.blogs = context.Blogs.Include(e => e.Category).ToList();
                    }
                    ViewBag.searchkey = searchkey;
                    ViewBag.cates = context.Categories.ToList();
                    ViewBag.blogquantity = context.Blogs.Count();
                    ViewBag.commentquantity = context.Comments.Count();
                    ViewBag.viewquantity = context.Blogs.Sum(b => b.Views);
                    ViewBag.key = key;
                }
                return View();
            }
            else
            {
                Console.WriteLine("ok2");
                return Redirect("/Login/Index");
            }

        }

        public IActionResult AddBlog(string success = null)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    ViewBag.cates = context.Categories.ToList();
                    if(success != null)
                    {
                        ViewBag.success = success;
                    }
                }
                return View();
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }

        [HttpPost]
        public async Task<JsonObject> ImageHandle(IFormFile file)
        {
            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\Admin\\img", file.FileName);
            using (var filestream = new FileStream(filepath, FileMode.Create))
            {
                file.CopyTo(filestream);
            };
            JsonObject o = new JsonObject();
            o.Add("location", file.FileName);
            return o;
        }
        [HttpPost]
        public IActionResult AddBlog(Blog blog, IFormFile Img)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    if (ModelState.IsValid)
                    {
                        var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img", Img.FileName);
                        using (var filestream = new FileStream(filepath, FileMode.Create))
                        {
                            Img.CopyTo(filestream);
                        };
                        context.Blogs.Add(blog);
                        context.SaveChanges();
                        ViewBag.success = "ok";
                    }
                    ViewBag.cates = context.Categories.ToList();

                }
                return View();
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }

        public IActionResult DeleteBlog(int id)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    var all = context.Comments.Where(c => c.BlogId == id).ToList();
                    if (all != null && all.Count > 0)
                    {
                        context.Comments.RemoveRange(all);
                        context.SaveChanges();
                    }
                    Blog blog = context.Blogs.FirstOrDefault(b => b.Id == id);
                    context.Blogs.Remove(blog); context.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }

        public IActionResult UpdateBlog(int id)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    ViewBag.cates = context.Categories.ToList();
                    Blog blog = context.Blogs.FirstOrDefault(b => b.Id == id);
                    return View(blog);
                }
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }

        [HttpPost]
        public IActionResult UpdateBlog(Blog newblog, IFormFile? Img)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                using (MyPersonalBlogDBContext context = new())
                {
                    if (ModelState.IsValid)
                    {
                        Blog blog = context.Blogs.FirstOrDefault(b => b.Id == newblog.Id);
                        if (!newblog.BigImage.Equals(blog.BigImage))
                        {
                            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\img", Img.FileName);
                            using (var filestream = new FileStream(filepath, FileMode.Create))
                            {
                                Img.CopyTo(filestream);
                            };
                        }
                        blog.BigImage = newblog.BigImage;
                        blog.CategoryId = newblog.CategoryId;
                        blog.Title = newblog.Title;
                        blog.shortDescription = newblog.shortDescription;
                        Console.WriteLine(newblog.shortDescription);
                        Console.WriteLine(blog.shortDescription);
                        blog.Content = newblog.Content;
                        context.SaveChanges();
                        ViewBag.success = "ok";
                    }
                    ViewBag.cates = context.Categories.ToList();
                }
                return RedirectToAction("Index");
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }
        public IActionResult UpdateUser()
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                return View();
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }
        [HttpPost]
        public IActionResult UpdateUser(User user, IFormFile? img)
        {
            foreach (var i in ModelState.Values)
            {
                Console.WriteLine(i.RawValue+ " "+ i.ValidationState);
            }
            if (HttpContext.Session.GetString("acc") != null)
            {
                if (ModelState.IsValid)
                {
                    using (MyPersonalBlogDBContext context = new())
                    {
                        User u = context.Users.FirstOrDefault(x => x.Id == user.Id);
                        u.Name = user.Name;
                        u.Email = user.Email;
                        u.Password = user.Password;
                        if (!u.Img.Equals(user.Img))
                        {
                            var filepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\assets\\img", img.FileName);
                            using (var filestream = new FileStream(filepath, FileMode.Create))
                            {
                                img.CopyTo(filestream);
                            };
                        }
                        u.Img = user.Img;
                        context.SaveChanges();
                        u = context.Users.FirstOrDefault(x => x.Id == user.Id);
                        if (u != null)
                        {
                            string accSession = JsonConvert.SerializeObject(u);
                            HttpContext.Session.Remove("acc");
                            HttpContext.Session.SetString("acc", accSession);
                        }
                        ViewBag.success = "ok";
                    }
                }
                return View();
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }
        [HttpPost]
        public IActionResult AddCate(string cate)
        {
            if (HttpContext.Session.GetString("acc") != null)
            {
                string success = null;
                using (MyPersonalBlogDBContext context = new())
                {
                    Category category = new();
                    category.Name = cate;
                    context.Categories.Add(category);
                    context.SaveChanges();
                    success = "okcate";
                }
                return RedirectToAction("AddBlog", new { success = success});
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }
    }
}
