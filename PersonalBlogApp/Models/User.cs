using System.ComponentModel.DataAnnotations;

namespace PersonalBlogApp.Models
{
    public class User
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Email đang để trống")]
        [MinLength(6, ErrorMessage = "Email không hợp lệ")]
        [RegularExpression("[a-zA-Z_\\-]+@[a-z]+\\.[a-z]+"
            , ErrorMessage = "Email không hợp lệ")]
        public string Email { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Password đang để trống")]
        [MaxLength(15, ErrorMessage = "Mật khẩu phải có độ dài từ 6 đến 15 ký tự"),MinLength(6, ErrorMessage = "Password phải có độ dài từ 6 đến 15 ký tự")]
        [RegularExpression("(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[^0-9a-zA-Z]).{6,15}"
            ,ErrorMessage = "Mật khẩu chứa ít nhất 1 chữ số, 1 chữ cái viết hoa, 1 chữ cái viết thường và 1 ký tự đặc biệt")]
        public string Password { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "* Ảnh nội dung chưa được chọn đang để trống")]
        public string Img { get; set; }
        public int Role { get; set; }
        public DateTime? DoB { get; set; }
        public bool? Gender { get; set; }
        public virtual List<Blog>? Blogs { get; set; }
    }
}
