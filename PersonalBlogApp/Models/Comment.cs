namespace PersonalBlogApp.Models
{
    public class Comment
    {
        public int Id { get; set; }
        public int BlogId { get; set; }
        public string Name { get; set; }
        public string? Image { get; set; }
        public bool? Status { get; set; }
        public DateTime? PublishedDate { get; set; }
        public string? CmContent { get; set; }
        public virtual Blog? Blogs { get; set; }
        public virtual List<Reply>? Replies { get; set; }

    }
}
