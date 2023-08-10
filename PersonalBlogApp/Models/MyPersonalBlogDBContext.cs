using Microsoft.EntityFrameworkCore;

namespace PersonalBlogApp.Models
{
    public class MyPersonalBlogDBContext: DbContext
    {
        public MyPersonalBlogDBContext()
        {
            
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Admin> Admins { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Comment> Comments { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var buider = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json",optional:true,reloadOnChange:true);
            IConfigurationRoot configuration = buider.Build();
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("MyCnn"));

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>(e =>
            {
                e.Property(pe=>pe.Name).HasMaxLength(50);
                e.Property(pe=>pe.Email).HasMaxLength(80);
                e.Property(pe => pe.Password).HasMaxLength(20);
            });
            modelBuilder.Entity<Admin>(e =>
            {
                e.Property(pe => pe.Name).HasMaxLength(50);
                e.Property(pe => pe.Email).HasMaxLength(80);
                e.Property(pe => pe.Password).HasMaxLength(20);
            });
            modelBuilder.Entity<Category>(e =>
            {
                e.Property(pe => pe.Name).HasMaxLength(150);
            });
            modelBuilder.Entity<Blog>(blog =>
            {
                blog.Property(b=>b.Title).HasMaxLength(200);
                blog.Property(b=>b.BigImage).HasMaxLength(150);
                blog.HasOne(c => c.Category)
                    .WithMany(b => b.Blogs)
                    .HasForeignKey(b => b.CategoryId)
                    .HasConstraintName("FK_Blogs_Categories");
                blog.HasMany(b => b.Comments)
                 .WithOne(c => c.Blogs);
                blog.HasOne(b => b.Users)
                    .WithMany(u => u.Blogs)
                    .HasForeignKey(b => b.UserId).HasConstraintName("FK_user_id");
            });
            modelBuilder.Entity<Comment>(comment =>
            {
                comment.HasOne(b => b.Blogs)
                       .WithMany(c => c.Comments)
                       .HasForeignKey(c => c.BlogId)
                       .HasConstraintName("FK_Comments_Blogs");
                comment.Property(c => c.CmContent).HasMaxLength(300);
            });
            modelBuilder.Entity<Reply>(re =>
            {
                re.HasOne(r => r.Comments)
                  .WithMany(c => c.Replies)
                  .HasForeignKey(r => r.CommentId)
                  .HasConstraintName("FK_Comments_Replies");
            });
        }
    }
}
