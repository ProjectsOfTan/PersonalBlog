USE [MyPersonalBlog]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](80) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[DoB] [datetime2](7) NULL,
	[Gender] [bit] NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[BigImage] [nvarchar](150) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PublishedDate] [datetime2](7) NOT NULL,
	[Views] [int] NOT NULL,
	[shortDescription] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[Group] [nvarchar](max) NULL,
	[accessRights] [int] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[PublishedDate] [datetime2](7) NULL,
	[CmContent] [nvarchar](300) NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reply]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[PublishedDate] [datetime2](7) NULL,
	[CmContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/24/2023 2:46:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](80) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[DoB] [datetime2](7) NULL,
	[Gender] [bit] NULL,
	[Img] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230706094110_Initial', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711021235_update-cmt-user', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230711021801_up-all', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230719024158_add_desInBlogs', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230719105315_user_update', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230719155345_new_up', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230720005953_n_i_cmt', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230720080011_add_reply', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230720090947_add_status', N'6.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230720142313_update_blog_user', N'6.0.1')
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [Name], [Email], [Password], [DoB], [Gender]) VALUES (2, N'Nguyen Van A', N'admin', N'123456', CAST(N'2023-10-11T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [Content], [BigImage], [CategoryId], [PublishedDate], [Views], [shortDescription], [UserId], [Group], [accessRights]) VALUES (15, N'REVIEW NHẸ CÁC NGÔN NGỮ, CÔNG NGHỆ, FRAMEWORK MÀ MÌNH ĐÃ VÀ ĐANG DÙNG KIẾM CƠM – PHẦN 2', N'<p>Sau gần 2 năm l&agrave;m việc ở VN, m&igrave;nh&nbsp;<a href="https://toidicodedao.com/2016/04/07/du-hoc-nuoc-ngoai-co-gi-dzui/">l&ecirc;n đường qua UK du học</a>. May mắn l&agrave; cũng c&oacute; việc l&agrave;m tại ph&ograve;ng IT trong trường n&ecirc;n kh&ocirc;ng bị lụt nghề.</p>
<p>K&igrave; n&agrave;y, m&igrave;nh sẽ chia sẻ về c&ocirc;ng nghệ m&igrave;nh đ&atilde; d&ugrave;ng hồi ở UK, v&agrave; khi mới qua Sing đi l&agrave;m nh&eacute;</p>
<p>Đ&acirc;y l&agrave; series b&agrave;i viết 4 phần:</p>
<ul>
<li>Phần 1 &ndash; C&ocirc;ng nghệ m&igrave;nh d&ugrave;ng hồi c&ograve;n ở VN</li>
<li>Phần 2 &ndash; Đi du học UK v&agrave; l&agrave;m startup Algomerchant</li>
<li>Phần 3- Học qu&aacute; trời c&ocirc;ng nghệ mới tại 90Seconds</li>
<li>Phần 4 &ndash; C&aacute;c c&ocirc;ng nghệ hiện tại m&igrave;nh đang d&ugrave;ng</li>
</ul>
<p><span id="more-9423"></span></p>
<h3><strong>L&agrave;m front-end &ndash; Học React trong 2 ng&agrave;y</strong></h3>
<p>V&agrave;o ISS, ph&ograve;ng IT của Đại Học Lancaster, c&ocirc;ng việc của m&igrave;nh l&agrave;&nbsp;<a href="https://toidicodedao.com/2016/09/06/tam-biet-lancaster-iss-tam-ket-thuc-kiep-code-dao-noi-xu-nguoi/">code c&aacute;i app iLancaster</a>, ứng dụng cho sinh vi&ecirc;n của trường d&ugrave;ng. App được x&acirc;y dựng bằng platform của thằng n&agrave;o m&igrave;nh kh&ocirc;ng nhớ, nhưng b&ecirc;n trong l&agrave; n<strong>hiều web app nhỏ</strong>, mỗi app nhỏ được viết bằng React.</p>
<p><a href="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png"><img class="size-full wp-image-9400 alignleft" src="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108" srcset="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108&amp;zoom=2 1.5x" alt="" width="108" height="99" data-attachment-id="9400" data-permalink="https://toidicodedao.com/2021/03/09/review-ngon-ngu-cong-nghe-framework/pngegg_3/" data-orig-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png" data-orig-size="108,99" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="pngegg_(3)" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108" data-large-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108"></a>Thuở đ&oacute;, React vẫn c&ograve;n kh&aacute; mới,&nbsp;<a href="https://toidicodedao.com/2018/08/21/series-luoc-su-lap-trinh-web-phan-4-1-reactjs-ngang-troi-xuat-the/">chưa phổ biến như b&acirc;y giờ</a>. M&igrave;nh ban đầu cũng&nbsp;<strong>kh&ocirc;ng ưa React lắm</strong>&nbsp;v&igrave; thấy n&oacute; &hellip; k&igrave; k&igrave;, tự dưng&nbsp;<strong>gom cả HTML lẫn JavaScript</strong>&nbsp;v&agrave;o chung 1 file JSX. Thế nhưng v&igrave; y&ecirc;u cầu c&ocirc;ng việc n&ecirc;n cũng phải học để code th&ocirc;i!</p>
<p>Code 1 thời gian th&igrave; m&igrave;nh thấy&nbsp;<em>React</em>&nbsp;cũng tạm ổn, thay v&igrave; d&ugrave;ng view/controller như Angular th&igrave; t&aacute;ch l&agrave;m nhiều component, t&aacute;i sử dụng component cũng kh&aacute; l&agrave; tiện. Số lượng c&aacute;c thư viện/component đ&atilde; c&oacute; sẵn cũng kh&aacute; l&agrave; nhiều.</p>
<figure id="attachment_1953" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-1953"><a href="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg"><img class="wp-image-1953" src="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=367&amp;h=285" sizes="(max-width: 367px) 100vw, 367px" srcset="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=367&amp;h=285 367w, https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=150&amp;h=116 150w, https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=300&amp;h=233 300w, https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg 701w" alt="" width="367" height="285" data-attachment-id="1953" data-permalink="https://toidicodedao.com/2016/05/05/mot-lan-theo-chan-team-di-tiep-thi-quang-cao-va-code-dao/abc-3/" data-orig-file="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg" data-orig-size="701,544" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;Pham, Hoang&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="abc" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2016/03/abc1.jpg?w=474"></a>
<figcaption id="caption-attachment-1953" class="wp-caption-text">Đ&acirc;y l&agrave; m&igrave;nh c&aacute;i thời c&ograve;n chẻ ch&acirc;u</figcaption>
</figure>
<p>Điểm m&igrave;nh kh&ocirc;ng th&iacute;ch React chắc l&agrave; &hellip;&nbsp;<strong>code 1 dự &aacute;n kh&aacute; tuỳ tiện, chả c&oacute; chuẩn g&igrave;!</strong>&nbsp;Nếu cả team kh&ocirc;ng c&oacute; chuẩn chung, code ẩu th&igrave; code sẽ rất nhanh trở th&agrave;nh 1 đống b&ugrave;i nh&ugrave;i (đấy l&agrave; chưa lỗi Redux v&hellip;v v&agrave;o đấy).</p>
<div class="wordads-ad-wrapper">
<div id="atatags-819766751-741518"></div>
</div>
<p>React theo m&igrave;nh cho tới tận b&acirc;y giờ (v&agrave; chắc sẽ c&ograve;n theo m&igrave;nh&nbsp;<strong>v&agrave;i ba năm nữa</strong>), n&ecirc;n m&igrave;nh sẽ chia sẽ&nbsp;kĩ hơn về React hiện tại ở b&agrave;i sau!</p>
<h3><strong>Tạm biệt UK, về Singapore &ndash; Gặp lại Angular, lần đầu được đụng Cloud</strong></h3>
<p>Sau đ&oacute;, m&igrave;nh về Singapore, l&agrave;m việc cho&nbsp;<a href="https://toidicodedao.com/2019/05/07/tam-biet-algomerchant-startup-dau-tien/">startup Algomerchant</a>. C&ocirc;ng ty nhỏ (Tầm 4-5 &ocirc;ng dev), nhưng dự &aacute;n l&agrave; bự n&ecirc;n m&igrave;nh được&nbsp;<a href="https://toidicodedao.com/2019/05/28/hoc-hoi-tu-dong-nghiep-phan-2/">&ocirc;m kh&aacute; l&agrave; nhiều thứ</a>.</p>
<p>Back-end của hệ thống viết theo&nbsp;<a href="https://toidicodedao.com/2017/02/21/tong-quan-micro-service/">kiến tr&uacute;c Microservice</a>, d&ugrave;ng&nbsp;<strong>ASP.NET Web API</strong>&nbsp;n&ecirc;n m&igrave;nh cũng kh&ocirc;ng cần tốn qu&aacute; nhiều thời gian để tiếp cận. Front-end th&igrave; m&igrave;nh lại may mắn được d&ugrave;ng &hellip; Angular 1 cũ m&egrave;m, do dự &aacute;n của c&ocirc;ng ty đ&atilde; chạy được v&agrave;i năm.</p>
<p>Đ&acirc;y cũng l&agrave; lần đầu ti&ecirc;n m&igrave;nh được d&ugrave;ng c&aacute;c&nbsp;<a href="https://toidicodedao.com/2018/10/30/gioi-thieu-series-cung-hoc-co-lao-tim-hieu-ve-cloud-computing/">dịch vụ Cloud Computing</a>. Thay v&igrave; thu&ecirc; server, to&agrave;n bộ hạ tầng của c&ocirc;ng ty, từ&nbsp;<em>Web App, Database, Redis</em>&hellip; đều&nbsp;<strong>sử dụng dịch vụ của Microsoft Azure</strong>&nbsp;cả! Cảm nhận của m&igrave;nh l&agrave; d&ugrave;ng kh&aacute; l&agrave; sướng:</p>
<ul>
<li>Kh&ocirc;ng cần quản l&yacute; server g&igrave; phức tạp, muốn scale cho API chạy nhanh hơn cũng rất dễ</li>
<li>Chỉ cần setup 1 ch&uacute;t l&agrave; đ&atilde; c&oacute; nguy&ecirc;n hệ thống dashboard/analytics (CPU/RAM load thế n&agrave;o, API n&agrave;o gọi nhiều, API n&agrave;o chậm), notification qua tin nhắn/email khi c&oacute; service bị chết hay bị chậm.</li>
<li>D&ugrave;ng Azure SQL Database l&acirc;u l&acirc;u hệ thống c&ograve;n th&ocirc;ng b&aacute;o<strong>&nbsp;query n&agrave;o chậm, cần th&ecirc;m index n&agrave;o</strong>, optimize ra sao</li>
</ul>
<figure id="attachment_9456" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-9456"><a href="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png"><img class=" wp-image-9456" style="height: auto; max-width: 100%; border: 0px; vertical-align: middle; display: block; margin: 0px;" src="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=396&amp;h=224" sizes="(max-width: 396px) 100vw, 396px" srcset="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=396&amp;h=224 396w, https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=792&amp;h=448 792w, https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=150&amp;h=85 150w, https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=300&amp;h=170 300w, https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=768&amp;h=434 768w" alt="" width="396" height="224" data-attachment-id="9456" data-permalink="https://toidicodedao.com/2021/03/16/review-nhe-cac-ngon-ngu-cong-nghe-framework-ma-minh-da-va-dang-dung-kiem-com-phan-2/dashboard-3/" data-orig-file="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png" data-orig-size="1100,622" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="dashboard" data-image-description="" data-image-caption="&lt;p&gt;Azure c&oacute; những dashboard rất mạnh, đủ mọi th&ocirc;ng tin về service đang chạy&lt;/p&gt;
" data-medium-file="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2021/02/dashboard-e1612861065184.png?w=474"></a>
<figcaption id="caption-attachment-9456" class="wp-caption-text">Azure c&oacute; những dashboard rất mạnh, đủ mọi th&ocirc;ng tin về service đang chạy</figcaption>
</figure>
<p>Nhược điểm l&agrave; mỗi tội&hellip; gi&aacute; hơi cao, lại phải trả h&agrave;ng th&aacute;ng. Tuy nhi&ecirc;n, nếu so với tiền tự mua server, tự host, th&ecirc;m tiền&nbsp;<strong>thu&ecirc; mấy &ocirc;ng operation vận h&agrave;nh</strong>&nbsp;th&igrave; chắc cũng kh&ocirc;ng qu&aacute; cao!</p>
<h3><strong>ElectronJS &ndash; Viết Code 1 lần chạy t&ugrave;m lum&hellip; chỗ</strong></h3>
<p>Tiếp theo, c&ocirc;ng ty c&oacute; dự &aacute;n viết app t&ecirc;n AutoInvest, kết nối với broker để trading (mua/b&aacute;n cổ phiếu).</p>
<div class="wordads-ad-wrapper">
<div id="atatags-819766751-297497"></div>
</div>
<p>Khổ nỗi, broker m&agrave; c&ocirc;ng ty muốn d&ugrave;ng (<a href="https://www.interactivebrokers.com/en/home.php">Interactive Brokers &ndash; IB</a>) lại &hellip;.&nbsp;<strong>m&eacute;o hỗ trợ Web API</strong>, hoặc chỉ support với chức năng cực k&igrave; c&oacute; hạn. Do vậy, hệ thống phải chạy tr&ecirc;n m&aacute;y t&iacute;nh, kết nối với app của Interactive Broker chứ kh&ocirc;ng l&agrave;m web được.</p>
<p>Do đ&atilde; ớn WinForm v&agrave; WPF, m&igrave;nh quyết định d&ugrave;ng&nbsp;<a href="https://www.electronjs.org/">ElectronJS</a>&nbsp;để l&agrave;m app n&agrave;y!</p>
<p><a href="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png"><img class="size-full wp-image-9397 alignleft" src="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png?w=111" srcset="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png?w=111&amp;zoom=2 1.5x" alt="" width="111" height="110" data-attachment-id="9397" data-permalink="https://toidicodedao.com/2021/03/09/review-ngon-ngu-cong-nghe-framework/pinclipart/" data-orig-file="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png" data-orig-size="111,110" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="PinClipart" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png?w=111" data-large-file="https://toidicodedao.files.wordpress.com/2021/02/pinclipart.png?w=111"></a></p>
<p>N&oacute;i đơn giản,&nbsp;<em>Electron</em>&nbsp;l&agrave; sự kết hợp của&nbsp;<em>Chromium</em>&nbsp;v&agrave;&nbsp;<em>NodeJS</em>, cho ph&eacute;p bạn tạo&nbsp;<a href="https://toidicodedao.com/2017/08/17/lam-the-nao-de-tro-thanh-web-developer-phan-1/">giao diện như web bằng HTML/CSS/JS</a>, d&ugrave;ng&nbsp;<em>NodeJS</em>&nbsp;để l&agrave;m c&aacute;c t&aacute;c vụ li&ecirc;n quan tới phần cứng, mạng, database&hellip; C&aacute;c ứng dụng lớn như&nbsp;<em>Atom, VSCode, Slack, Figma</em>,&hellip; đều viết bằng&nbsp;<em>Electron</em>&nbsp;cả.</p>
<p>Sau 1 thời gian d&ugrave;ng, m&igrave;nh nhận ra Electron kh&aacute; l&agrave; b&aacute; đạo:</p>
<ul>
<li>Viết code 1 lần,&nbsp;<strong>chạy được tr&ecirc;n cả Window, Linux, Mac</strong>&nbsp;(mỗi tội setup build hơi rườm ra). Nhờ vậy, sau n&agrave;y m&igrave;nh migrate app qua Linux cũng kh&aacute; nhanh, chỉnh nửa buổi l&agrave; xong.</li>
<li>D&ugrave;ng&nbsp;<em>HTML/CSS/JS</em>&nbsp;để l&agrave;m giao diện, n&ecirc;n&nbsp;<a href="https://toidicodedao.com/2015/08/18/nhung-ki-nang-can-co-cua-mot-web-developer/">d&acirc;n web developer</a>&nbsp;như m&igrave;nh bay qua ph&aacute;t l&agrave; code được ngay</li>
<li>T&aacute;i sử dụng được qu&aacute; trời thư viện của JavaScript v&agrave; NodeJS</li>
</ul>
<figure id="attachment_9458" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-9458"><a href="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg"><img class=" wp-image-9458" style="height: auto; max-width: 100%; border: 0px; vertical-align: middle; display: block; margin: 0px;" src="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=449&amp;h=164" sizes="(max-width: 449px) 100vw, 449px" srcset="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=449&amp;h=164 449w, https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=898&amp;h=328 898w, https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=150&amp;h=55 150w, https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=300&amp;h=109 300w, https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=768&amp;h=280 768w" alt="" width="449" height="164" data-attachment-id="9458" data-permalink="https://toidicodedao.com/2021/03/16/review-nhe-cac-ngon-ngu-cong-nghe-framework-ma-minh-da-va-dang-dung-kiem-com-phan-2/screenshot-2021-02-09-at-4-58-59-pm/" data-orig-file="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg" data-orig-size="1200,437" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="Screenshot 2021-02-09 at 4.58.59 PM" data-image-description="" data-image-caption="&lt;p&gt;Rất nhiều ứng dụng cross-platform lớn được viết bằng Electron&lt;/p&gt;
" data-medium-file="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2021/02/screenshot-2021-02-09-at-4.58.59-pm-e1612861165633.jpg?w=474"></a>
<figcaption id="caption-attachment-9458" class="wp-caption-text">Rất nhiều ứng dụng cross-platform lớn được viết bằng Electron</figcaption>
</figure>
<p>B&ecirc;n cạnh đ&oacute;, Electron c&oacute; 1 số khuyến điểm nho nhỏ, c&aacute;c bạn cần lưu &yacute;:</p>
<ul>
<li>Build ra file c&agrave;i đặt hơi bự (V&agrave;i chục tới v&agrave;i trăm MB), v&igrave; phải chức Chromium Core v&agrave; NodeJS</li>
<li>Giao diện hiển thị bằng Chromium Core n&ecirc;n c&oacute; thể sẽ &hellip; tốn RAM, chạy chậm nếu kh&ocirc;ng biết c&aacute;ch optimize</li>
</ul>
<h3><strong>Tạm kết</strong></h3>
<p>Về sau, khi hệ thống c&oacute; nhiều người d&ugrave;ng, m&igrave;nh bắt đầu sử dụng&nbsp;<a href="https://toidicodedao.com/2018/03/20/elk-stack-logging/">bộ ba ELK (ElasticSearch &ndash; LogStask &ndash; Kibana)</a>&nbsp;để quản l&yacute; log. Do m&igrave;nh đ&atilde; giới thiệu trong b&agrave;i viết ri&ecirc;ng rồi n&ecirc;n c&aacute;c bạn đọc lại nha!</p>
<div class="wordads-ad-wrapper">
<div id="atatags-819766751-682162"></div>
</div>
<p>Sau 1 thời gian, m&igrave;nh&nbsp;<a href="https://toidicodedao.com/2019/05/07/tam-biet-algomerchant-startup-dau-tien/">lại rời Algomerchant</a>&nbsp;&ndash; startup đầu ti&ecirc;n, nhảy đi tới ch&acirc;n trời mới v&igrave; &hellip; lương cao hơn. May thay, c&ocirc;ng ty mới d&ugrave;ng kh&aacute; nhiều c&ocirc;ng nghệ mới, m&igrave;nh lại tiếp tục được học v&agrave; d&ugrave;ng c&ocirc;ng nghệ mới!</p>
<p>Tất cả m&igrave;nh sẽ chia sẻ ở phần sau của blog nh&eacute;!</p>', N'download (2).jpg', 1, CAST(N'2023-07-19T16:51:44.0000000' AS DateTime2), 68, N'<p>Sau gần 2 năm l&agrave;m việc ở VN, m&igrave;nh&nbsp;<a href="https://toidicodedao.com/2016/04/07/du-hoc-nuoc-ngoai-co-gi-dzui/">l&ecirc;n đường qua UK du học</a>. May mắn l&agrave; cũng c&oacute; việc l&agrave;m tại ph&ograve;ng IT trong trường n&ecirc;n kh&ocirc;ng bị lụt nghề.</p>', 1, NULL, 0)
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [BigImage], [CategoryId], [PublishedDate], [Views], [shortDescription], [UserId], [Group], [accessRights]) VALUES (18, N'NGƯỜI TA KHÔNG ĐÁNH GIÁ BẠN QUA KĨ NĂNG, MÀ ĐÁNH GIÁ', N'<p>Mấy h&ocirc;m nay, trong 1 lần ngồi lai rai nhậu nhẹt, ch&eacute;m gi&oacute; với mấy &ocirc;ng bạn, tụi m&igrave;nh c&oacute; b&agrave;n đến một chủ đề kh&aacute; vui:</p>
<pre>L&agrave;m sao biết đ&aacute;nh gi&aacute; được tr&igrave;nh độ của một &ocirc;ng developer? L&agrave;m sao biết ổng giỏi hay th&agrave;nh c&ocirc;ng?</pre>
<p>C&aacute;c anh em mỗi người n&oacute;i 1 kiểu:</p>
<ul>
<li>Lương cao, title khủng (Manager, Director) l&agrave; dev th&agrave;nh c&ocirc;ng</li>
<li>V&agrave;o được c&aacute;c c&ocirc;ng ty lớn, đầu v&agrave;o kh&oacute; (như Google, Netflix, Facebook..) l&agrave; dev giỏi</li>
<li>X&acirc;y dựng được 1 hệ thống lớn, 1 product xịn &hellip; l&agrave; dev giỏi</li>
<li>C&oacute; tiếng n&oacute;i, được nhiều anh em trong ng&agrave;nh biết v&agrave; nể&hellip; l&agrave; dev th&agrave;nh c&ocirc;ng</li>
</ul>
<p>Hmm, nghĩ lại th&igrave; cũng thấy c&oacute; phần đ&uacute;ng. M&agrave; lạ nhỉ, kh&ocirc;ng &ocirc;ng n&agrave;o bảo dev giỏi l&agrave;&nbsp;<a href="https://toidicodedao.com/2016/11/24/fight-with-code-the-hien-trinh-do/">phải code giỏi</a>, phải&nbsp;<strong>giỏi to&aacute;n</strong>, phải&nbsp;<a href="https://toidicodedao.com/2016/10/06/hoc-thuat-toan-de-lam-gi/">thuật to&aacute;n giỏi</a>&nbsp;cả&hellip;</p>
<p>Nghe n&oacute;i mấy c&aacute;i đấy quan trọng lắm cơ m&agrave;! Tại sao&nbsp;<strong>lạ vậy nhỉ?</strong>&nbsp;C&aacute;c bạn đọc b&agrave;i n&agrave;y sẽ r&otilde; nh&eacute;.</p>
<p><span id="more-7196"></span></p>
<h3><strong>Trường học hay trường đời, cũng đều nh&igrave;n điểm m&agrave; đ&aacute;nh gi&aacute;</strong></h3>
<p>Thời c&ograve;n học trong trường, c&aacute;c thầy sẽ đ&aacute;nh gi&aacute; khả năng của học sinh&nbsp;<strong>dựa tr&ecirc;n b&agrave;i tập, dựa tr&ecirc;n điểm số</strong>. Khi đi l&agrave;m, kh&ocirc;ng c&ograve;n chấm điểm, người ta sẽ đ&aacute;nh gi&aacute; bạn dựa theo&nbsp;<strong>những g&igrave; m&agrave; bạn show ra</strong>.</p>
<p>Ngẫm lại, bạn sẽ thấy, những thứ như: Code nhanh, code giỏi, giỏi to&aacute;n, giỏi thuật to&aacute;n, &hellip; tất cả đều l&agrave; khả năng của ch&iacute;nh bạn.</p>
<p>C&ograve;n những thứ như:&nbsp;<a href="https://toidicodedao.com/2017/06/22/tro-thanh-lap-trinh-vien-luong-cao-co-gia/">lương cao</a>, title khủng, l&agrave;m dev c&ocirc;ng ty lớn,&nbsp;<a href="https://toidicodedao.com/2017/08/01/thiet-ke-he-thong-trieu-nguoi-dung-high-scalability/">x&acirc;y dựng hệ thống bự</a>,&hellip; l&agrave;&nbsp;<strong>th&agrave;nh tựu m&agrave; bạn đạt được</strong>, dựa tr&ecirc;n kĩ năng sẵn c&oacute; của m&igrave;nh.</p>
<p>Kĩ năng của bạn giỏi hay dở tới đ&acirc;u, chỉ c&oacute; m&igrave;nh bạn biết. Nhưng th&agrave;nh tựu bạn đạt được th&igrave; người ngo&agrave;i ai cũng nh&igrave;n thấy! Do vậy, người ta chỉ đ&aacute;nh gi&aacute; bạn giỏi hay kh&ocirc;ng, bạn th&agrave;nh c&ocirc;ng hay kh&ocirc;ng, dựa tr&ecirc;n&nbsp;<strong>những th&agrave;nh tựu bạn l&agrave;m ra</strong>.</p>
<figure id="attachment_4194" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-4194"><a href="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg"><img class="wp-image-4194 " src="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=402&amp;h=270" sizes="(max-width: 402px) 100vw, 402px" srcset="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=402&amp;h=270 402w, https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=150&amp;h=101 150w, https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=300&amp;h=201 300w, https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg 590w" alt="" width="402" height="270" data-attachment-id="4194" data-permalink="https://toidicodedao.com/2017/06/22/tro-thanh-lap-trinh-vien-luong-cao-co-gia/andevcon_featureimage-2/" data-orig-file="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg" data-orig-size="590,396" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;5.6&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;Canon EOS 60D&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;1319638682&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;37&quot;,&quot;iso&quot;:&quot;100&quot;,&quot;shutter_speed&quot;:&quot;0.01&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="AnDevCon_FeatureImage" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2017/05/andevcon_featureimage.jpg?w=474"></a>
<figcaption id="caption-attachment-4194" class="wp-caption-text">Người ta chỉ đ&aacute;nh gi&aacute; bạn giỏi hay kh&ocirc;ng, bạn th&agrave;nh c&ocirc;ng hay kh&ocirc;ng, dựa tr&ecirc;n những th&agrave;nh tựu bạn l&agrave;m ra.</figcaption>
</figure>
<h3><strong>Tự tạo ra th&agrave;nh tựu cho m&igrave;nh</strong></h3>
<p>V&igrave; l&yacute; do đ&oacute;, m&igrave;nh thường hay khuy&ecirc;n c&aacute;c bạn&nbsp;<a href="https://toidicodedao.com/2015/07/16/muon-neo-duong-tim-viec-phan-1-viet-cv-ro-rang-va-chuyen-nghiep/">kh&ocirc;ng n&ecirc;n viết v&agrave;o CV</a>&nbsp;những c&acirc;u như: Th&agrave;nh thạo C, C++; hoặc master ng&ocirc;n ngữ/framework A, B, C&hellip;.</p>
<p>Những điều n&agrave;y thực sự &hellip;&nbsp;<strong>rất kh&oacute; chứng minh</strong>. Chẳng phải bạn n&oacute;i m&igrave;nh&nbsp;<a href="https://toidicodedao.com/tag/javascript-sida/">th&agrave;nh thạo JavaScript</a>&nbsp;th&igrave; người tuyển dụng sẽ tin ngay được, m&agrave; họ sẽ bắt bạn l&agrave;m test, phỏng vấn&hellip; để chứng minh điều đ&oacute;.</p>
<p>Thay v&agrave;o đ&oacute;, h&atilde;y&nbsp;<strong>show ra những th&agrave;nh tựu m&agrave; bạn đạt được</strong>, l&agrave;m được dựa tr&ecirc;n những kĩ năng m&igrave;nh c&oacute;. Những thứ n&agrave;y dễ show hơn v&agrave; cũng dễ x&aacute;c nhận hơn:</p>
<ul>
<li>Đạt chứng chỉ YYY cho ng&ocirc;n ngữ/ c&ocirc;ng nghệ n&agrave;o đ&oacute;</li>
<li>Build những&nbsp;<strong>module n&agrave;o quan trọng</strong>&nbsp;trong hệ thống, bằng ng&ocirc;n ngữ XXX</li>
<li>Thuật to&aacute;n tr&acirc;u n&ecirc;n&nbsp;<strong>account đạt top 1000</strong>&nbsp;tr&ecirc;n hacker*nk hay topcod*r hay g&igrave; đấy</li>
</ul>
<figure id="attachment_9194" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-9194"><a href="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png"><img class="wp-image-9194" src="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=387&amp;h=239" sizes="(max-width: 387px) 100vw, 387px" srcset="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=387&amp;h=239 387w, https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=772&amp;h=478 772w, https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=150&amp;h=93 150w, https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=300&amp;h=186 300w, https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=768&amp;h=475 768w" alt="" width="387" height="239" data-attachment-id="9194" data-permalink="https://toidicodedao.com/2021/02/02/ngam-nguoi-ta-khong-danh-gia-ban-qua-ki-nang-ma-danh-gia-theo-thanh-tuu/topcoder/" data-orig-file="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png" data-orig-size="1176,728" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="topcoder" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2020/12/topcoder.png?w=474"></a>
<figcaption id="caption-attachment-9194" class="wp-caption-text">Lấy c&aacute;i ranking tr&ecirc;n TopCoder đi kh&egrave; cho người kh&aacute;c nể n&egrave;!</figcaption>
</figure>
<p>&nbsp;</p>
<p>L&uacute;c cần&nbsp;<a href="https://toidicodedao.com/2017/06/22/tro-thanh-lap-trinh-vien-luong-cao-co-gia/">performance review, đ&ograve;i tăng lương</a>&nbsp;cũng vậy. Thay v&igrave; n&oacute;i em giỏi, em c&oacute; khả năng l&agrave;m c&aacute;i n&agrave;y c&aacute;i nọ; h&atilde;y cho sếp/manager thấy&nbsp;<strong>những th&agrave;nh tựu c&aacute;c bạn đ&atilde; đạt được</strong>&nbsp;trong thời gian qua:</p>
<ul>
<li>Build được module X, Y, Z mang lại XX% lợi nhuận cho c&ocirc;ng ty</li>
<li>Review code, tạo CI/CD Pipeline gi&uacute;p tiết kiệm XX% thời gian của c&aacute;c &ocirc;ng dev</li>
<li>Phỏng vấn, onboarding, mentoring 2,3 bạn, gi&uacute;p mở rộng team v&hellip;v</li>
</ul>
<p>Nhớ nh&eacute;! Thay v&igrave; n&oacute;i những c&aacute;i chung chung như khả năng, h&atilde;y tập trung v&agrave;o th&agrave;nh tựu, những thứ dễ nh&igrave;n, dễ thấy, dễ kiểm chứng.</p>
<h3><strong>Đừng buồn hay bực v&igrave; m&igrave;nh &hellip; c&oacute; t&agrave;i m&agrave; kh&ocirc;ng gặp thời</strong></h3>
<p>M&igrave;nh cũng từng gặp nhiều bạn nghĩ rằng m&igrave;nh&hellip; c&oacute; t&agrave;i m&agrave; kh&ocirc;ng gặp thời:</p>
<ul>
<li>Em&nbsp;<strong>giỏi thuật to&aacute;n</strong>&nbsp;hơn thằng H, thằng K, nhưng tụi n&oacute; mới ra trường&nbsp;<a href="https://toidicodedao.com/2017/12/14/cam-xuc-tieu-cuc-sinh-vien-lap-trinh-vien/">lại c&oacute; lương cao hơn em</a></li>
<li>Em&nbsp;<strong>code nhanh code giỏi</strong>&nbsp;hơn thằng B, thằng M, nhưng sếp lại&nbsp;<a href="https://toidicodedao.com/2015/11/19/mat-toi-cua-nganh-cong-nghiep-it-phan-2/">th&iacute;ch tụi n&oacute; hơn, tụi n&oacute; mau l&ecirc;n chức</a>&nbsp;hơn</li>
<li>Anh code v&agrave; thiết kế hệ thống rất tr&acirc;u, nhưng sau 4, 5 năm anh vẫn l&agrave;m dev, c&ograve;n bọn bạn anh&nbsp;<a href="https://toidicodedao.com/2015/06/18/con-duong-phat-trien-su-nghiep-career-path-cho-developer/">đ&atilde; l&ecirc;n Manager, l&ecirc;n Director</a>.</li>
</ul>
<p>Như m&igrave;nh đ&atilde; n&oacute;i, th&agrave;nh tựu thường đi c&ugrave;ng với khả năng. Phải c&oacute; khả năng cao th&igrave; mới c&oacute; th&agrave;nh tựu xuất sắc được.</p>
<p>Tuy nhi&ecirc;n, điều n&agrave;y&nbsp;<strong>kh&ocirc;ng hẳn l&uacute;c n&agrave;o cũng đ&uacute;ng!</strong>&nbsp;C&aacute;c cụ c&oacute; c&acirc;u l&agrave; &ldquo;Qu&acirc;n tử thất thời, tiểu nh&acirc;n đắc ch&iacute;&rdquo;. Người giỏi cũng c&oacute; l&uacute;c&nbsp;<a href="https://toidicodedao.com/2020/11/03/du-an-cong-nghe-thanh-cong-nho-ki-thuat/">gặp xui n&ecirc;n thất bại</a>, kẻ bất t&agrave;i đ&ocirc;i khi&nbsp;<a href="https://toidicodedao.com/2016/07/06/that-bai-va-thanh-cong/">nhờ may mắn n&ecirc;n th&agrave;nh c&ocirc;ng</a>.</p>
<figure id="attachment_9196" class="wp-caption aligncenter" data-shortcode="caption" aria-describedby="caption-attachment-9196"><a href="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg"><img class="wp-image-9196 " src="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=429&amp;h=201" sizes="(max-width: 429px) 100vw, 429px" srcset="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=429&amp;h=201 429w, https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=150&amp;h=70 150w, https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=300&amp;h=140 300w, https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg 710w" alt="" width="429" height="201" data-attachment-id="9196" data-permalink="https://toidicodedao.com/2021/02/02/ngam-nguoi-ta-khong-danh-gia-ban-qua-ki-nang-ma-danh-gia-theo-thanh-tuu/nguoi-xua-5/" data-orig-file="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg" data-orig-size="710,332" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="nguoi-xua-5" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=300" data-large-file="https://toidicodedao.files.wordpress.com/2020/12/nguoi-xua-5.jpg?w=474"></a>
<figcaption id="caption-attachment-9196" class="wp-caption-text">C&aacute;c cụ cũng c&oacute; c&acirc;u &ldquo;Qu&acirc;n tử thất thời, tiểu nh&acirc;n đắc ch&iacute;&rdquo;</figcaption>
</figure>
<p>&nbsp;</p>
<p>Do vậy, nếu bạn nghĩ m&igrave;nh c&oacute; t&agrave;i thật, nhưng vẫn chưa c&oacute; th&agrave;nh tựu thật th&igrave; cũng đừng buồn:</p>
<ul>
<li>C&oacute; thể l&agrave;&nbsp;<strong>bạn gặp xui</strong>, c&ograve;n những đứa kia do may mắn, biết chớp thời cơ n&ecirc;n n&oacute; th&agrave;nh c&ocirc;ng hơn th&ocirc;i</li>
<li>Hoặc l&agrave; do thật sự &hellip;&nbsp;<a href="https://toidicodedao.com/2018/05/17/hieu-ung-dunning-kruger-va-ao-tuong-suc-manh/">tr&igrave;nh độ bạn kh&ocirc;ng c&oacute;</a>, n&ecirc;n&nbsp;<strong>kh&ocirc;ng nh&igrave;n ra được l&yacute; do</strong>&nbsp;tại sao người ta th&agrave;nh c&ocirc;ng th&ocirc;i
<ul>
<li>V&iacute; dụ thằng H, thằng K lương cao v&igrave; n&oacute; c&oacute; kinh nghiệm, n&oacute; đi thực tập l&acirc;u hơn.</li>
<li>Hoặc thằng B, thằng M code chậm nhưng &iacute;t bug, viết test v&agrave; document kĩ c&agrave;ng hơn chẳng hạn</li>
</ul>
</li>
</ul>
<h3><strong>Tạm kết</strong></h3>
<p>Đấy, đến đ&acirc;y th&igrave; b&agrave;i viết cũng d&agrave;i rồi. T&uacute;m c&aacute;i v&aacute;y lại, người đời sẽ kh&ocirc;ng đ&aacute;nh gi&aacute; bạn qua khả năng, m&agrave; chỉ&nbsp;<strong>đ&aacute;nh gi&aacute; bạn qua th&agrave;nh tựu</strong>, qua những điều bạn đ&atilde; đạt được.</p>
<p>Do vậy, đừng đi gato hay so đo tr&igrave;nh độ với đồng nghiệp:&nbsp; Tao code giỏi hơn, tao học nhanh hơn, trym tao d&agrave;i hơn&hellip; m&agrave; h&atilde;y tạo ra th&agrave;nh tựu, tạo ra sản phẩm cho tụi n&oacute; nể nh&eacute;!</p>', N'download (5).jpg', 1, CAST(N'2023-07-19T22:03:48.0000000' AS DateTime2), 93, N'<p>Mấy h&ocirc;m nay, trong 1 lần ngồi lai rai nhậu nhẹt, ch&eacute;m gi&oacute; với mấy &ocirc;ng bạn, tụi m&igrave;nh c&oacute; b&agrave;n đến một chủ đề kh&aacute; vui</p>', 1, NULL, 0)
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [BigImage], [CategoryId], [PublishedDate], [Views], [shortDescription], [UserId], [Group], [accessRights]) VALUES (26, N'REVIEW NHẸ CÁC NGÔN NGỮ, CÔNG NGHỆ, FRAMEWORK MÀ MÌNH ĐÃ VÀ ĐANG DÙNG KIẾM CƠM – PHẦN CUỐI', N'<p>K&igrave; n&agrave;y, m&igrave;nh sẽ chia sẻ về c&ocirc;ng nghệ m&igrave;nh đ&atilde; d&ugrave;ng hồi ở UK, v&agrave; khi mới qua Sing đi l&agrave;m nh&eacute;</p>
<p>Đ&acirc;y l&agrave; series b&agrave;i viết 4 phần:</p>
<ul>
<li>Phần 1 &ndash; C&ocirc;ng nghệ m&igrave;nh d&ugrave;ng hồi c&ograve;n ở VN</li>
<li>Phần 2 &ndash; Đi du học UK v&agrave; l&agrave;m startup Algomerchant</li>
<li>Phần 3- Học qu&aacute; trời c&ocirc;ng nghệ mới tại 90Seconds</li>
<li>Phần 4 &ndash; C&aacute;c c&ocirc;ng nghệ hiện tại m&igrave;nh đang d&ugrave;ng</li>
</ul>
<p><span id="more-9423"></span></p>
<h3><strong>L&agrave;m front-end &ndash; Học React trong 2 ng&agrave;y</strong></h3>
<p>V&agrave;o ISS, ph&ograve;ng IT của Đại Học Lancaster, c&ocirc;ng việc của m&igrave;nh l&agrave;&nbsp;<a href="https://toidicodedao.com/2016/09/06/tam-biet-lancaster-iss-tam-ket-thuc-kiep-code-dao-noi-xu-nguoi/">code c&aacute;i app iLancaster</a>, ứng dụng cho sinh vi&ecirc;n của trường d&ugrave;ng. App được x&acirc;y dựng bằng platform của thằng n&agrave;o m&igrave;nh kh&ocirc;ng nhớ, nhưng b&ecirc;n trong l&agrave; n<strong>hiều web app nhỏ</strong>, mỗi app nhỏ được viết bằng React.</p>
<p><a href="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png"><img class="size-full wp-image-9400 alignleft" src="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108" srcset="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108&amp;zoom=2 1.5x" alt="" width="108" height="99" data-attachment-id="9400" data-permalink="https://toidicodedao.com/2021/03/09/review-ngon-ngu-cong-nghe-framework/pngegg_3/" data-orig-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png" data-orig-size="108,99" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="pngegg_(3)" data-image-description="" data-image-caption="" data-medium-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108" data-large-file="https://toidicodedao.files.wordpress.com/2021/02/pngegg_3.png?w=108"></a>Thuở đ&oacute;, React vẫn c&ograve;n kh&aacute; mới,&nbsp;<a href="https://toidicodedao.com/2018/08/21/series-luoc-su-lap-trinh-web-phan-4-1-reactjs-ngang-troi-xuat-the/">chưa phổ biến như b&acirc;y giờ</a>. M&igrave;nh ban đầu cũng&nbsp;<strong>kh&ocirc;ng ưa React lắm</strong>&nbsp;v&igrave; thấy n&oacute; &hellip; k&igrave; k&igrave;, tự dưng&nbsp;<strong>gom cả HTML lẫn JavaScript</strong>&nbsp;v&agrave;o chung 1 file JSX. Thế nhưng v&igrave; y&ecirc;u cầu c&ocirc;ng việc n&ecirc;n cũng phải học để code th&ocirc;i!</p>
<p>Code 1 thời gian th&igrave; m&igrave;nh thấy&nbsp;<em>React</em> cũng tạm ổn, thay v&igrave; d&ugrave;ng view/controller như Angular th&igrave; t&aacute;ch l&agrave;m nhiều component, t&aacute;i sử dụng component cũng kh&aacute; l&agrave; tiện. Số lượng c&aacute;c thư viện/component đ&atilde; c&oacute; sẵn cũng kh&aacute; l&agrave; nhiều.</p>', N'download (4).jpg', 1, CAST(N'2023-07-20T21:53:02.0000000' AS DateTime2), 3, N'<p>Sau gần 2 năm l&agrave;m việc ở VN, m&igrave;nh&nbsp;<a href="https://toidicodedao.com/2016/04/07/du-hoc-nuoc-ngoai-co-gi-dzui/">l&ecirc;n đường qua UK du học</a>. May mắn l&agrave; cũng c&oacute; việc l&agrave;m tại ph&ograve;ng IT trong trường n&ecirc;n kh&ocirc;ng bị lụt nghề.</p>', 1, NULL, 1)
INSERT [dbo].[Blogs] ([Id], [Title], [Content], [BigImage], [CategoryId], [PublishedDate], [Views], [shortDescription], [UserId], [Group], [accessRights]) VALUES (27, N'KHI CODE MÀ BÍ THÌ PHẢI LÀM SAO? 5 KINH NGHIỆM SIÊU HAY ĐỂ GIẢI QUYẾT VẤN ĐỀ', N'<p>Với những bạn đang bắt đầu học lập tr&igrave;nh hoặc vừa mới đi l&agrave;m, đ&ocirc;i khi c&aacute;c bạn sẽ bị&hellip; b&iacute;,&nbsp;<strong>kh&ocirc;ng biết code</strong>&nbsp;hoặc giải quyết vấn đề như thế n&agrave;o (Thật ra m&igrave;nh đi l&agrave;m l&acirc;u rồi nhiều khi cũng bị).</p>
<p>Cảm gi&aacute;c &hellip; kh&ocirc;ng biết code như thế n&agrave;o, kh&ocirc;ng biết giải quyết vấn đề ra sao&nbsp;<strong>rất l&agrave; kh&oacute; chịu</strong>. Gặp nhiều bạn sẽ&nbsp;<a href="https://toidicodedao.com/2017/12/14/cam-xuc-tieu-cuc-sinh-vien-lap-trinh-vien/">dễ nản, ch&aacute;n code, ch&aacute;n ng&agrave;nh.</a></p>', N'download (3).jpg', 2, CAST(N'2023-07-21T13:54:31.0000000' AS DateTime2), 2, N'<p>Với những bạn đang bắt đầu học lập tr&igrave;nh hoặc vừa mới đi l&agrave;m, đ&ocirc;i khi c&aacute;c bạn sẽ bị&hellip; b&iacute;,&nbsp;<strong>kh&ocirc;ng biết code</strong>&nbsp;hoặc giải quyết vấn đề như thế n&agrave;o (Thật ra m&igrave;nh đi l&agrave;m l&acirc;u rồi nhiều khi cũng bị).</p>
<p>Cảm gi&aacute;c &hellip; kh&ocirc;ng biết code như thế n&agrave;o, kh&ocirc;ng biết giải quyết vấn đề ra sao&nbsp;<strong>rất l&agrave; kh&oacute; chịu</strong>. Gặp nhiều bạn sẽ&nbsp;<a href="https://toidicodedao.com/2017/12/14/cam-xuc-tieu-cuc-sinh-vien-lap-trinh-vien/">dễ nản, ch&aacute;n code, ch&aacute;n ng&agrave;nh.</a></p>', 1, N'vanb@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Lập trình')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Cuộc sống')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Kinh doanh')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Giải trí')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'moi')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [BlogId], [PublishedDate], [CmContent], [Image], [Name], [Status]) VALUES (5, 15, CAST(N'2023-07-20T00:00:00.0000000' AS DateTime2), N'ok', N'default-avatar.png', N'Nguyen Van B', 1)
INSERT [dbo].[Comments] ([Id], [BlogId], [PublishedDate], [CmContent], [Image], [Name], [Status]) VALUES (6, 15, CAST(N'2023-07-20T00:00:00.0000000' AS DateTime2), N'haha', N'default-avatar.png', N'Nguyen Van C', 0)
INSERT [dbo].[Comments] ([Id], [BlogId], [PublishedDate], [CmContent], [Image], [Name], [Status]) VALUES (14, 18, CAST(N'2023-07-20T16:02:16.0018641' AS DateTime2), N'fhsadkfsdhf', N'download.png', N'Nguyen Van A', 1)
INSERT [dbo].[Comments] ([Id], [BlogId], [PublishedDate], [CmContent], [Image], [Name], [Status]) VALUES (15, 18, CAST(N'2023-07-20T16:05:46.4376453' AS DateTime2), N'dfbe fe', N'default-avatar.png', N'cd fd ', 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [DoB], [Gender], [Img], [Role]) VALUES (1, N'Nguyen Van A', N'adm@gmail.com', N'Tan@123456', NULL, NULL, N'download.png', 1)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [DoB], [Gender], [Img], [Role]) VALUES (2, N'Nguyen Van B', N'vanb@gmail.com', N'Be@123456', NULL, NULL, N'default-avatar.png', 0)
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [DoB], [Gender], [Img], [Role]) VALUES (3, N'Nguyen Van C', N'vanc@gmail.com', N'Ce@123456', NULL, NULL, N'default-avatar.png', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT (N'') FOR [shortDescription]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ((0)) FOR [accessRights]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Img]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Role]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Categories]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_user_id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_user_id]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Blogs] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blogs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Blogs]
GO
ALTER TABLE [dbo].[Reply]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Replies] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reply] CHECK CONSTRAINT [FK_Comments_Replies]
GO
