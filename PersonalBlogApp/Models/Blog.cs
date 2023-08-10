using System.ComponentModel.DataAnnotations;

namespace PersonalBlogApp.Models
{
    public class Blog
    {
        public int Id { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "* Tiêu đề đang để trống")]
        public string Title { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "* Mô tả ngắn đang để trống")]
        public string shortDescription { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "* Nội dung đang để trống")]
        public string? Content { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "* Ảnh nội dung chưa được chọn đang để trống")]
        public string BigImage { get; set; }
        [RegularExpression("[^0]"
            , ErrorMessage = "* Hãy chọn thể loại của blog")]
        public int CategoryId { get; set; }
        public DateTime PublishedDate { get; set; }
        public int UserId { get; set; }
        public int Views { get; set; }
        public int accessRights { get; set; }
        public string? Group { get; set; }

        public virtual User? Users { get; set; }
        public virtual List<Comment>? Comments { get; set; }
        public virtual Category? Category { get; set; }
    }
}
