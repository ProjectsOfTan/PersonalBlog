﻿namespace PersonalBlogApp.Models
{
    public class Admin
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public DateTime? DoB { get; set; }
        public bool? Gender { get; set; }

    }
}
