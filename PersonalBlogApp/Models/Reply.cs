namespace PersonalBlogApp.Models
{
    public class Reply
    {
        public int Id { get; set; }
        public int CommentId { get; set; }
        public string Name { get; set; }
        public string? Image { get; set; }
        public DateTime? PublishedDate { get; set; }
        public string? CmContent { get; set; }
        public virtual Comment? Comments { get; set; }
    }
}
