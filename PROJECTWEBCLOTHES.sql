create database ProjectWebClothes
go
USE ProjectWebClothes
GO


CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[DisplayNumber] [int] NULL,
	[Status] [bit] NULL DEFAULT ((1))
PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[Status] [bit] NULL DEFAULT ((1)),
	[Images] [nvarchar](100) NULL,
	[DisplayNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[CategoryPost](
	[CategoryPostId] [int] IDENTITY(1,1) NOT NULL,
	[PostName] [nvarchar](100) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[CategoryPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	Content [ntext] NULL ,
	[Images] [nvarchar](100) NULL,
	[CategoryPostId] [int] NULL,
	[UserId] [int] NULL,																																											
	[DisplayNumber] [int] NULL,
	[Created] [date] NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](100) NULL,
	[Natation] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[Level](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Phone] [nvarchar](15) NULL,
	[Address] [nvarchar](200) NULL,
	[TotalPrice] [float] NULL,
	[SubTotal] [float] NULL,
	[StatusId] [int] NULL DEFAULT ((1)),
	[UserId] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[CustomerId] [int] NULL,
	[DeliveryId] [int] NULL,
	[CreatedDate] [date] NULL,
	[Description] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[StatusOrder](
	[StatusOrderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[StatusOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ContentDetail] [ntext] NULL,
	[Images] [nvarchar](100) NULL,
	[View] [int] NULL DEFAULT ((0)),
	[BuyItem] [int] NULL DEFAULT ((0)),
	[PriceInput] [float] NULL,
	[PriceOutput] [float] NULL,
	[Quantity] [int] NULL,
	[CategoryId] [int] NULL,
	[Created] [date] NULL,
	[Status] [bit] NULL,
	[ImageHover] [nvarchar](100) NULL,
	[Discount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
CREATE TABLE [dbo].[ProductColor](
	[ProductColorId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ColorId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[ProductSize](
	[ProductSizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[SizeId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[ProductProvider](
	[ProductProviderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ProviderId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](100) NULL,
	[Status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[LevelId] [int] NULL,
	[Status] [bit] NULL,
	[Created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Status] [bit] NULL,
	[Created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveryId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [dbo].[StatusOrder] ([StatusOrderId])
GO



ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO


ALTER TABLE [dbo].[ProductProvider]  WITH CHECK ADD FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProductProvider]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO

ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([CategoryPostId])
REFERENCES [dbo].[CategoryPost] ([CategoryPostId])
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO


ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([LevelId])
REFERENCES [dbo].[Level] ([LevelId])
GO

/*INSERT DATA TO TABLE*/
/*CATEGORY*/
INSERT INTO [dbo].[Category] ([Name], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES
(N'Men', N'Men', 0, 1, null, 1),
(N'Women', N'Women', 0, 1, null, 2),
(N'Children', N'Children', 0, 1, null, 3),
(N'Accessories', N'Accessories', 0, 1, null, 4),
(N'Shoes', N'Shoes', 0, 1, null, 5)
GO
/*PROVIDER*/
INSERT INTO [dbo].[Provider] ([ProviderName], [Address], [Email], [Phone],[Status]) VALUES
(N'H&M', N'USA', N'hm@gmail.com', N'0961114104', 1),
(N'Chanel', N'USA', N'chanel@gmail.com', N'0961567899', 1),
(N'Gucci', N'USA', N'gucci@gmail.com', N'0961111234', 1),
(N'Levis', N'USA', N'levis@gmail.com', N'0923141104', 1),
(N'Balenciaga', N'USA', N'halenciaga@gmail.com', N'0296234104', 1),
(N'Hermès', N'USA', N'hermes@gmail.com', N'0811114104', 1),
(N'Christian Dior', N'USA', N'christian.dior@gmail.com', N'0886860224', 1),
(N'Dolce&Gabbana', N'USA', N'dolce.gabbana@gmail.com', N'0886860222', 1),
(N'Supperme', N'USA', N'supperme@gmail.com', N'0961114104', 1)
GO
/*SIZE*/
INSERT [dbo].[Size] ([SizeName], [Descriptions], [Status]) VALUES
(N'XS', NULL, 1),
(N'S', NULL, 1),
(N'M', NULL, 1),
(N'L', NULL, 1),
(N'1XL', NULL, 1),
(N'2XL', NULL, 1),
(N'3XL', NULL, 1),
(N'4XL', NULL, 1),
(N'29', NULL, 1),
(N'30', NULL, 1),
(N'31', NULL, 1),
(N'32', NULL, 1),
(N'33', NULL, 1),
(N'34', NULL, 1),
(N'35', NULL, 1),
(N'36', NULL, 1),
(N'37', NULL, 1),
(N'38', NULL, 1),
(N'39', NULL, 1),
(N'40', NULL, 1),
(N'41', NULL, 1),
(N'42', NULL, 1),
(N'43', NULL, 1),
(N'44', NULL, 1),
(N'45', NULL, 1)
GO
/*COLOR*/
INSERT [dbo].[Color] ([ColorName], [Status], [Natation]) VALUES
(N'RED', 1, N'red'),
(N'BLACK', 1, N'black'),
(N'Màu đỏ', 1, N'white'),
(N'Màu đỏ', 1, N'blue'),
(N'Màu đỏ', 1, N'green'),
(N'Màu đỏ', 1, N'gray'),
(N'Màu đỏ', 1, N'pink'),
(N'Màu đỏ', 1, N'yellow')
GO
/*CUSTOMER*/
INSERT [dbo].[Customers] ([Name],[UserName], [Password],[Email],[Address],[Phone] , [Status], [Created]) VALUES
(N'Nguyen Thai Hung',N'hungpro',N'hungpro',N'hungpro989.hp95@gmail.com',N'Hai Phong','0886860224', 1, GETDATE()),
(N'Nguyen Van A',N'hung',N'hung',N'hungpro995.hp95@gmail.com',N'Ha Noi','0961114104', 1, GETDATE())
GO
/*PRODUCT*/
INSERT [dbo].[Product] ([Name],[ContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CategoryId], [Created], [Status], [ImageHover], [Discount]) VALUES
(N'Swim Trunks', N'
Long swim trunks in plain canvas (100% polyamide)
- Elastic waistband with drawstring
- Back pocket
- "H" embroidery
Made in Italy
Length: 16.3" | The dimensions indicated correspond to a size Medium.
Model is 1m89 / 6.2" and wearing a size M.', N'product-8.jpg', 100, 16, 23, 70, 20, 1, GETDATE(), 1, N'image4xxl-7.jpg', 65),

(N'T-shirt Embroidery', N'
Short sleeve crewneck t-shirt in cotton with "H 3D" embroidery (100% cotton)

- Mini "H 3D" embroidery

Made in Italy', N'product-1.jpg', 90, 26, 33, 90, 30, 1, GETDATE(), 1, N'product-1.jpg', 85),

(N'Bicolor Jogging Pants', N'
Bicolor jogging pants in cotton with "Run H" detail (100% cotton)

- Reflective Toilovent piping

Made in Italy', N'product-2.jpg', 290, 56, 33, 120, 70, 2, GETDATE(), 1, N'product-2.jpg', null)
GO

/*PROC*/
/*PROC customer*/
create proc [dbo].[getAllCustomer]
as
begin
Select * from [Customers] where Status = 'True'
end
GO

CREATE proc [dbo].[checkLogin]
@name nvarchar(100),
@password nvarchar(100)
as
begin
select * from [Customers] where UserName = @name and [Password] = @password and [Status] = 'True'
end
GO

CREATE proc [dbo].[insertCustomer]
@name nvarchar(100),
@username nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100)
as
begin
Insert into [Customers] ([Name],UserName,[Password],Phone,Email,[Address],[Status],Created)
values (@name,@username,@pass,@phone,@email,@address,'True',getDate())
end
GO

create proc [dbo].[activeCustomer]
@id int
as
begin
update [Customers] set [Status] = 'True' where CustomerId = @id
end
GO

create proc [dbo].[updateCustomer]
@id int,
@name nvarchar(100),
@username nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100),
@status bit
as
begin
Update Customers set
			[Name] = @name,
			UserName = @username,
			[Password] = @pass,
			Phone = @phone,
			Email = @email,
			[Address] = @address,
			[Status] = @status 
			where CustomerId = @id
end
GO

create proc [dbo].[deleteCustomer]
@id int
as
begin
Update Customers set Status = 'False' where CustomerId = @id
end
GO
/* reset password */
create proc [dbo].[recoverPassword]
@id int,
@pas nvarchar(100)
as
begin
Update Customers set 
			 Password = @pas
             where CustomerId = @id
end
GO
 
create proc [dbo].[getCustomerByEmail]
@email nvarchar(100)
as
begin
Select * from Customers where Email = @email
end
GO

create proc [dbo].[getCustomerByUserName]
@username nvarchar(100)
as
begin
Select * from Customers where UserName = @username
end
GO

create proc [dbo].[checkUserName]
@username nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @username FROM Customers where UserName = @username)
      set @re = 'True'
   else 
      set @re = 'False'
end
GO

create proc [dbo].[checkEmail]
@email nvarchar(100),
@re bit output
as
begin
if exists(select @email from Customers where Email = @email)
	set @re = 'True'
else
	set @re = 'False'
end
GO

create proc [dbo].[getUserIdNew]
@id int output
as
begin
Select @id = CustomerId from Customers order by CustomerId desc
end
GO

create proc [dbo].[getCustomerIdNew]
@id int output
as
begin
Select @id = CustomerId from Customers order by CustomerId desc
end
GO

/*CATEGORY*/

 CREATE proc [dbo].[getAllCategory]
 as
 begin
 Select * from Category where Status = 'True'
 end
GO
/*insert*/
CREATE proc [dbo].[insertCategory]
@name nvarchar(100),
@des nvarchar(100),
@pare int = 0,
@img nvarchar(100),
@dis int

as
begin
if @pare != 0
	insert into Category(Name,Descriptions,ParentId,Images,DisplayNumber, [Status]) values(@name,@des,@pare,@img,@dis,'True')
else
   insert into Category(Name,Descriptions,ParentId,Images,DisplayNumber,[Status]) values(@name,@des,0,@img,@dis,'True')
end
GO
/*update*/
CREATE proc [dbo].[updateCategory]
@id int,
@name nvarchar(100),
@des nvarchar(100),
@pare int,
@img nvarchar(100),
@dis int,
@status bit
as
begin
update Category set Name = @name,
				   Descriptions = @des,
				   ParentId = @pare,
				   Images = @img,
				   DisplayNumber = @dis,
				   [Status] = @status
			   where CategoryId = @id
end
GO
/*delete*/
create proc [dbo].[deleteCategory]
@id int
as
begin
delete Category where CategoryId = @id
end
GO
/*get category root*/
CREATE proc [dbo].[getCategoryRoot]
as
begin
Select * from Category where ParentId = 0 and [Status] = 'True' order by DisplayNumber asc
end
GO





/*PROC COLOR*/

/*select*/
 CREATE proc [dbo].[getAllColor]
 as
 begin
 Select * from Color where Status = 'True'
 end
GO

/*insert*/
CREATE proc [dbo].[insertColor]
@name nvarchar(100),
@nat nvarchar(100)
as
begin
insert into Color(ColorName, Natation, [Status]) values(@name, @nat, 'True')   
end
GO

/*update*/
CREATE proc [dbo].[updateColor]
@id int,
@name nvarchar(100),
@nat nvarchar(100),
@status bit
as
begin
update Color set ColorName = @name,
				Natation = @nat,
				   [Status] = @status
			   where ColorId = @id
end
GO
/*delete*/
create proc [dbo].[deleteColor]
@id int
as
begin
delete Color where ColorId = @id
end
GO
/*PROC size*/
/*select*/
 CREATE proc [dbo].[getAllSize]
 as
 begin
 Select * from Size where Status = 'True'
 end
GO
/*insert*/
CREATE proc [dbo].[insertSize]
@name nvarchar(100),
@des nvarchar(100)
as
begin
insert into Size(SizeName, Descriptions, [Status]) values(@name,@des,'True')   
end
GO
/*update*/
CREATE proc [dbo].[updateSize]
@id int,
@name nvarchar(100),
@des nvarchar(100),
@status bit
as
begin
update Size set SizeName = @name,
					Descriptions = @des,
				   [Status] = @status
			   where SizeId = @id
end
GO
/*delete*/
create proc [dbo].[deleteSize]
@id int
as
begin
delete Size where SizeId = @id
end
GO

/*PROC provider*/
/*select*/
 CREATE proc [dbo].[getAllProvider]
 as
 begin
 Select * from Provider where Status = 'True'
 end
GO
/*insert*/
CREATE proc [dbo].[insertProvider]
@name nvarchar(100),
@address nvarchar(100),
@email nvarchar(100),
@phone nvarchar(100)
as
begin
insert into Provider(ProviderName,Address,Email,Phone, [Status]) values(@name, @address,@email,@phone,'True')   
end
GO
/*update*/
CREATE proc [dbo].[updateProvider]
@id int,
@name nvarchar(100),
@address nvarchar(100),
@email nvarchar(100),
@phone nvarchar(100),
@status bit
as
begin
update Provider set ProviderName = @name,
					Address = @address,
					Email = @email,
					Phone = @phone,
				   [Status] = @status
			   where ProviderId = @id
end
GO
/*delete*/
create proc [dbo].[deleteProvider]
@id int
as
begin
delete Provider where ProviderId = @id
end
GO

/*Product*/
/*Hot Product*/
create proc [dbo].[getProductHot]
as
begin
Select top 8 * from Product order by [View] desc
end
GO
/*all product*/
create proc [dbo].[getAllProduct]
as
begin
Select * from Product where Status = 'True'
end
GO
/*Phân trang product*/
CREATE PROCEDURE [dbo].[SP_DisplayPageNo]
@CurrentPage int ,
@PageSize int,
@table nvarchar(200),
@actionName nvarchar(100),
@sql nvarchar(4000) OUTPUT
AS
BEGIN
--Khai báo và lấy tổng số bản ghi lấy về
DECLARE @TotalRecord int;
DECLARE @sqlString nvarchar(200);
SET @sqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
execute sp_executesql @sqlString,N'@TotalRecord int out',@TotalRecord out;
--Khai báo và set tổng số trang cần phân ra dựa vào tổng số bản ghi và số bản ghi trên 1 trang
DECLARE @TotalPage int;
IF @TotalRecord%@PageSize>0
SET @TotalPage=(@TotalRecord/@PageSize)+1;
ELSE
SET @TotalPage=@TotalRecord/@PageSize;
--Xử lý trường hợp nếu trang đang chọn truyền vào nhỏ hơn 1Spring Web MVC
IF @CurrentPage<1
SET @CurrentPage=1;
--Xử lý trường hợp nếu trang đang chọn truyền vào lớn hơn tổng số trang được chia
IF @CurrentPage>@TotalPage
SET @CurrentPage=@TotalPage
--Set nội dung cho link phân trang
SET @sql=''
IF @CurrentPage>1
BEGIN
SET @sql=@sql+ N' <a href="'+@actionName+'?page=1" title="Trang đầu">&lt;&lt;</a>'
SET @sql=@sql+ ' <a href="'+@actionName+'?page='+ Cast((@CurrentPage-1) AS
nvarchar(4))+N'" title="Trang trước">&lt;</a>'
END
DECLARE @i int
SET @i=1
WHILE @i<=@TotalPage
BEGIN
IF @i=@CurrentPage
SET @sql=@sql+'  <a href="'+@actionName+'?page='+Cast(Cast(@i AS int) AS nvarchar(4))+'  class="active">' + Cast(Cast(@i AS int) AS nvarchar(4))+'</a> '
ELSE
SET @sql=@sql+' <a href="'+@actionName+'?page='+Cast(@i AS nvarchar(4))+'">'
+Cast(@i AS nvarchar(4))+'</a> '
SET @i=@i+1
END
IF @CurrentPage<@TotalPage
BEGIN
SET @sql=@sql+ N' <a href="'+@actionName+'?page='+Cast((@CurrentPage+1) AS
nvarchar(4))+N'" title="Trang sau">&gt;</a>'
SET @sql=@sql+ N' <a href="'+@actionName+'?page='+cast(@TotalPage AS nvarchar(6))+ N'"
title="Trang cuối">&gt;&gt;</a>'
END
SELECT @sql AS Paging
END
GO

/*sản phẩm phân trang*/
CREATE PROCEDURE [dbo].[SP_Paging]
@CurrentPage int,
@PageSize int,
@table nvarchar(200),
@tableId nvarchar(100)
AS
Begin
-- Tính tổng số bản ghi
DECLARE @TotalRecord int, @TotalPage int
--khai bao cau lenh va thuc thi cau lenh lay tong so ban ghi cua bang can phan trang
DECLARE @SqlString nvarchar(500);
DECLARE @SqlString1 nvarchar(500);
SET @SqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
execute sp_executesql @SqlString,N'@TotalRecord int out',@TotalRecord out;
-- Tính tổng số trang
IF @TotalRecord%@PageSize>0
SET @TotalPage=(@TotalRecord/@PageSize)+1
ELSE
SET @TotalPage=@TotalRecord/@PageSize
--Xử lý trường hợp @CurrentPage<1
IF @CurrentPage<1
SET @CurrentPage=1
--Xử lý trường hợp @CurrentPage>@Tolal
IF @CurrentPage>@TotalPage
SET @CurrentPage=@TotalPage
--Xử lý lấy dữ liệu của trang hiện tại
SET @SqlString1 = 'Begin WITH temp AS (SELECT ROW_NUMBER() OVER(ORDER BY
'+@tableId+') AS RowNum, * FROM '+@table+') Select * From temp Where RowNum Between
('+CAST(@CurrentPage AS nvarchar(10))+' - 1)*'+CAST(@PageSize AS nvarchar(10))+'+1 AND
'+CAST(@CurrentPage AS nvarchar(10))+'*'+CAST(@PageSize AS nvarchar(10))+' END;'
execute sp_executesql @SqlString1;
END
GO

create proc [dbo].[getProductTotal]
@total int output
as
begin
select @total = count(ProductId) from Product where [Status] ='True'
end
GO