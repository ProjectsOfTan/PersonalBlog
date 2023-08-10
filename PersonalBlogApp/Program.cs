namespace PersonalBlogApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            //Add-start
            builder.Services.AddControllersWithViews();
            builder.Services.AddHttpContextAccessor();
            builder.Services.AddDistributedMemoryCache();
            builder.Services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromSeconds(60*60);
            });
            //Add-end


            var app = builder.Build();

            //Update-start
            //app.MapGet("/", () => "Hello World!");
            
            app.UseStaticFiles();
            app.UseSession();
            app.MapControllerRoute(
                name: "defaut",
                pattern: "{controller=Home}/{action=Index}/{id?}"
                );
            //Update-end


            app.Run();
        }
    }
}