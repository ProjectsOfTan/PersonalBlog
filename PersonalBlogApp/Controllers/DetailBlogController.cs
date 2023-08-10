using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using PersonalBlogApp.Models;

namespace PersonalBlogApp.Controllers
{
    public class DetailBlogController : Controller
    {
        public IActionResult Index(int id, string comment = null)
        {
            using (MyPersonalBlogDBContext context = new())
            {
                ViewBag.specialblogs = context.Blogs.Include(b => b.Category).Where(e => e.Views >= 50).Take(5).ToList();
                ViewBag.cates = context.Categories.ToList();
                Blog b = context.Blogs
                    .Include(b => b.Users)
                    .Include(b => b.Comments)
                    .FirstOrDefault(b => b.Id == id);
                if(b.accessRights == 0)
                {
                    if (comment == null)
                    {
                        Blog up = context.Blogs.FirstOrDefault(b => b.Id == id);
                        up.Views = up.Views + 1;
                        context.SaveChanges();
                    }
                    var cmt = context.Comments
                                     .Include(c => c.Replies)
                                     .Where(c => c.BlogId == id)
                                     .ToList();
                    return View(b);
                }
                else if(b.accessRights == 1)
                {
                    if(HttpContext.Session.GetString("acc") != null)
                    {
                        if (comment == null)
                        {
                            Blog up = context.Blogs.FirstOrDefault(b => b.Id == id);
                            up.Views = up.Views + 1;
                            context.SaveChanges();
                        }
                        var cmt = context.Comments
                                         .Include(c => c.Replies)
                                         .Where(c => c.BlogId == id)
                                         .ToList();
                        return View(b);
                    }
                    else
                    {
                        return Redirect("/Home/Index/1");
                    }
                }
                else
                {
                    if (HttpContext.Session.GetString("acc") != null)
                    {
                        string session = HttpContext.Session.GetString("acc");
                        User user = JsonConvert.DeserializeObject<User>(session);
                        if (b.Group.Contains(user.Email) || user.Role == 1)
                        {
                            if (comment == null)
                            {
                                Blog up = context.Blogs.FirstOrDefault(b => b.Id == id);
                                up.Views = up.Views + 1;
                                context.SaveChanges();
                            }
                            var cmt = context.Comments
                                             .Include(c => c.Replies)
                                             .Where(c => c.BlogId == id)
                                             .ToList();
                            return View(b);
                        }
                        else
                        {
                            return Redirect("/Home/Index/1");
                        }
                    }
                    else
                    {
                        return Redirect("/Home/Index/1");
                    }
                }
            }
        }
        [HttpPost]
        public IActionResult PostComment(string Comment, int id, string name = "")
        {
            string comment = null;
            using (MyPersonalBlogDBContext context = new())
            {
                if (HttpContext.Session.GetString("acc") == null)
                {
                    Comment cmt = new Comment();
                    cmt.Name = name;
                    cmt.CmContent = Comment;
                    cmt.Image = "default-avatar.png";
                    cmt.PublishedDate = DateTime.Now;
                    cmt.BlogId = id;
                    cmt.Status = false;
                    context.Comments.Add(cmt);
                    context.SaveChanges();
                    comment = "ok";
                }
                else
                {
                    string session = HttpContext.Session.GetString("acc");
                    User u = JsonConvert.DeserializeObject<User>(session);
                    Comment cmt = new Comment();
                    cmt.Name = u.Name;
                    cmt.CmContent = Comment;
                    cmt.Image = u.Img;
                    cmt.PublishedDate = DateTime.Now;
                    cmt.BlogId = id;
                    context.Comments.Add(cmt);
                    context.SaveChanges();
                    comment = "ok";
                }
            }
            return RedirectToAction("Index", new { id = id, comment = comment });
        }

        public IActionResult OkComment(int id,int bid, string comment)
        {
            using (MyPersonalBlogDBContext context = new())
            {
                Comment cmt = context.Comments.FirstOrDefault(c => c.Id == id);
                cmt.Status = true;
                context.SaveChanges();
            }
            return RedirectToAction("Index", new { id = bid, comment = "ok"});
        }

        public IActionResult DeleteComment(int id, int bid, string comment)
        {
            using (MyPersonalBlogDBContext context = new())
            {
                Comment cmt = context.Comments.FirstOrDefault(c => c.Id == id);
                context.Comments.Remove(cmt);
                context.SaveChanges();
            }
            return RedirectToAction("Index", new { id = bid, comment = "ok" });
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
                return Redirect("/Home/Index");
            }
            else
            {
                return Redirect("/Login/Index");
            }
        }

    }
}
