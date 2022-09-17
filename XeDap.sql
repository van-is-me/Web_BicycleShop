CREATE DATABASE DBDESING_XEDAP
USE DBDESING_XEDAP

CREATE TABLE ProductCategory
(
	PCID char(8) PRIMARY KEY,
	TypeName nvarchar(20) NOT NULL, 
)

CREATE TABLE Customer 
(
	CustomerID char(8) PRIMARY KEY,
	LastName nvarchar(10) NOT NULL,
	FristName nvarchar(20) NOT NULL,
	Phone char(11) NOT NULL,
	ShippingAddress nvarchar(50) NULL
)

CREATE TABLE Employee
(
	EmployeeID char(8) PRIMARY KEY,
	LastName nvarchar(10) NOT NULL,
	FristName nvarchar(20) NOT NULL,
	Sex nvarchar(5) NOT NULL,
	Phone char(11) NOT NULL,
	DOB date NOT NULL
)

CREATE TABLE Product 
(
	ProductID char(8) PRIMARY KEY,
	Brand char(10) NOT NULL,
	Name char(40) NOT NULL,
	Size char(10) NOT NULL,
	FrameMaterial nvarchar(40) NOT NULL,
	Price int NOT NULL,
	PCID char(8) FOREIGN KEY REFERENCES ProductCategory(PCID),
	GuaranteeID char(8) UNIQUE
)

CREATE TABLE Images
(
	ImageID INT IDENTITY(1, 1) PRIMARY KEY,
	Url text NOT NULL,
	ProductID char(8) FOREIGN KEY REFERENCES Product(ProductID)
)

CREATE TABLE Accessory 
(
	AccessoryID char(8) PRIMARY KEY,
	Name nvarchar(50) NOT NULL,
	ProductID char(8) FOREIGN KEY REFERENCES Product(ProductID)
)

CREATE TABLE Bill
(
	BillID char(8) PRIMARY KEY,
	Hotline char(11) NOT NULL,
	StoreAddress nvarchar(100) NOT NULL,
	Date date NOT NULL,
	CustomerID char(8) FOREIGN KEY REFERENCES Customer(CustomerID),
	EmployeeID char(8) FOREIGN KEY REFERENCES Employee(EmployeeID)
)


CREATE TABLE OrderDetails
(
	BillID char(8) FOREIGN KEY REFERENCES Bill(BillID),
	ProductID char(8) FOREIGN KEY REFERENCES Product(ProductID),
	Price int NOT NULL,
	Quantity TINYINT NOT NULL,
	Discount INT,
	PRIMARY KEY (BillID, ProductID) 
)
ALTER TABLE OrderDetails ALTER COLUMN Discount real


CREATE TABLE Guarantee
(
	GuaranteeID INT IDENTITY(1, 1) PRIMARY KEY,
	WarrantyPolicy nvarchar NOT NULL,
	WarrantyPeriod datetime NOT NULL,
	BillID char(8) FOREIGN KEY REFERENCES Bill(BillID)
)

ALTER TABLE Guarantee ALTER COLUMN WarrantyPolicy nvarchar(4000) NOT NULL

INSERT INTO ProductCategory VALUES('PC1', N'Xe đạp đường phố')
INSERT INTO ProductCategory VALUES('PC2', N'Xe đạp địa hình')
INSERT INTO ProductCategory VALUES('PC3', N'Xe đạp đua')
INSERT INTO ProductCategory VALUES('PC4', N'Xe đạp gấp')
INSERT INTO ProductCategory VALUES('PC5', N'Xe đạp nữ')
INSERT INTO ProductCategory VALUES('PC6', N'Xe đạp trẻ em')

SELECT * FROM ProductCategory

INSERT INTO Customer VALUES('C1', N'Nguyễn', N'Duy', '0903xxxxxx', N'HAI BA TRUNG, HOAN KIEM, HA NOI')
INSERT INTO Customer VALUES('C2', N'Trần', N'Đình Trọng', '0901xxxxxx', N'TUE TINH, BUI THI XUAN, HAI BA TRUNG, HA NOI')
INSERT INTO Customer VALUES('C3', N'Lương', N'Xuân Trường', '0978xxxxxx', N'Hoàng Anh Gia Lai')
INSERT INTO Customer VALUES('C4', N'Đoàn', N'Văn Hậu', '0945xxxxxx', NULL)
INSERT INTO Customer VALUES('C5', N'Hà', N'Đức Chinh', '090xxxxxx', NULL)
INSERT INTO Customer VALUES('C6', N'Bùi', N'Tiến Dũng', '0953xxxxxx', NULL)
INSERT INTO Customer VALUES('C7', N'Phan', N'Văn Đức', '0933xxxxxx', N'Hoàng Anh Gia Lai')
INSERT INTO Customer VALUES('C8', N'Đặng', N'Văn Lâm', '0993xxxxxx', N'Số 9, ngách 44/3 Pháo Đài Láng, Phường Láng Thượng')
INSERT INTO Customer VALUES('C9', N'Phạm', N'Văn Thành', '0913xxxxxx', NULL)
INSERT INTO Customer VALUES('C10', N'Quế', N'Ngọc Hải', '0923xxxxxx', NULL)
INSERT INTO Customer VALUES('C11', N'Nguyễn', N'Tiến Linh', '0923xxxxxx', N'Bình Dương')
INSERT INTO Customer VALUES('C12', N'Nguyễn', N'Đăng Khoa', '0923xxxxx', N'Thôn sú 2, xã Lâm Động, huyện Thủy Nguyên')
INSERT INTO Customer VALUES('C13', N'Nguyễn', N'Khánh Hòa', '091xxxx', NULL )
INSERT INTO Customer VALUES('C14', N'Nguyễn', N'Minh Phúc', '0821xxx', N'Bình Phước')
INSERT INTO Customer VALUES('C15', N'Đoàn', N'Minh Trung', '07322xxx', N'Số nhà 89, phố Tô Vĩnh Diễn, phường Khương Trung')
INSERT INTO Customer VALUES('C16', N'Trần', N'Quốc Hưng', '09xxxx', N'Phòng số 610, tòa nhà A6, ngõ 15, phố Ngọc Hồi')
INSERT INTO Customer VALUES('C17', N'Lê', N'Thiên Hàn', '093xxxxx', NULL)
INSERT INTO Customer VALUES('C18', N'Ngô', N'Minh Hiếu', '092xxxx', N'Số 9, ngách 594/2 đường Láng, phường Láng Thượng')
INSERT INTO Customer VALUES('C19', N'Đoàn', N'Minh Trung', '091293xxx', N'Thôn Bảo Lâm, xã Hồng Thái, huyện Bình Gia')
INSERT INTO Customer VALUES('C20', N'Nguyễn', N'Huỳnh Nhân', '09023xxx', NULL)
INSERT INTO Customer VALUES('C21', N'Trần', N'Gia Huy', '0909xxxx', NULL)
INSERT INTO Customer VALUES('C22', N'Quách', N'Tấn Kỳ', '09083xxx', NULL)
INSERT INTO Customer VALUES('C23', N'Tinh', N'Minh Anh', '09083xxx', NULL)
INSERT INTO Customer VALUES('C24', N'Trần', N'Mai Lan Chi', '09083xxx', NULL)
INSERT INTO Customer VALUES('C25', N'Trần', N'Bảo Tâm Anh', '09083xxx', NULL)
INSERT INTO Customer VALUES('C26', N'Nguyễn', N'Thị Hải Yến', '09083xxx', NULL)
INSERT INTO Customer VALUES('C27', N'Mai', N'Lan Hương', '09083xxx', NULL)
INSERT INTO Customer VALUES('C28', N'Trần', N'Bảo An', '09083xxx', NULL)
INSERT INTO Customer VALUES('C29', N'Nguyễn ', N'Jenny ', '09083xxx', NULL)
INSERT INTO Customer VALUES('C30', N'Trần', N'Kim Liên', '09083xxx', NULL)


delete from customer

SELECT * FROM Customer ORDER BY LastName

INSERT INTO Employee VALUES('E1', N'Nguyễn', N'Thị Ngọc Anh', N'Nữ', '093xxxxx', '1999-01-12')
INSERT INTO Employee VALUES('E2', N'Lê', N'Đức Đạt', N'Nam', '091xxxxx', '2000-01-12')

SELECT * FROM Employee

INSERT INTO Product VALUES('P1', 'TRINX', 'Touring TRINX Free 2.0', 'One Size', 'TRINX Alloy 700Cx470', 6690000, 'PC1', 1)
INSERT INTO Product VALUES('P2', 'MOMENTUM', 'Touring MOMENTUM iNeed Street', 'S', 'ALUXX-grade aluminum', 8790000, 'PC1', 2)
INSERT INTO Product VALUES('P3', 'GIANT', 'Touring GIANT Escape 3', 'S', 'ALUXX-Grade Aluminum', 9790000, 'PC1', 3)
INSERT INTO Product VALUES('P4', 'VINBIKE', 'Touring VINBIKE Sky 2', 'S', 'Vinbike Aluminum', 11390000, 'PC1', 4)
INSERT INTO Product VALUES('P5', 'LIV', 'Touring LIV Alight 2 DD Disc2', 'XS', 'ALUXX-Grade Aluminum', 12590000, 'PC1', 5)
INSERT INTO Product VALUES('P6', 'GIANT', 'Touring GIANT Fastroad Advanced 2', 'L', 'Advanced-Grade Composite', 37790000, 'PC1', 6)

INSERT INTO Product VALUES('P7', 'GIANT', 'MTB GIANT Talon 4 ', 'XS', 'ALUXX-grade aluminum', 10790000, 'PC2', 7)
INSERT INTO Product VALUES('P8', 'FORNIX', 'FORNIX X26', 'One Size', N'Hợp kim thép', 4490000, 'PC2', 8)
INSERT INTO Product VALUES('P9', 'LIV', 'MTB LIV Tempt 4', 'M', 'ALUXX-grade aluminum', 11190000, 'PC2', 9)
INSERT INTO Product VALUES('P10', 'TRINX', 'MTB TRINX M136', 'One Size', 'TRINX Alloy', 5590000, 'PC2', 10)
INSERT INTO Product VALUES('P11', 'VINBIKE', 'MTB VINBIKE Hima 1', 'M', 'Vinbike Aluminum 27.5', 6490000, 'PC2', 11)
INSERT INTO Product VALUES('P12', 'MIAMOR', 'MTB MIAMOR', 'One Size', 'Aluminum alloy', 4790000, 'PC2', 12)
INSERT INTO Product VALUES('P13', 'HITASA', 'MTB HITASA 24 LN', 'One Size', N'Hợp kim thép', 3290000, 'PC2', 13)

INSERT INTO Product VALUES('P14', 'GIANT', 'Road GIANT SCR 1', 'L', 'ALUXX-Grade Aluminum', 22790000, 'PC3', 14)
INSERT INTO Product VALUES('P15', 'GIANT', 'Road GIANT TCR Advanced Pro 1 Disc', 'XS', 'Advanced-Grade Composite', 105590000, 'PC3', 15)
INSERT INTO Product VALUES('P16', 'GIANT', 'Road GIANT Contend 2', 'M', 'ALUXX-Grade aluminum', 19790000, 'PC3', 16)
INSERT INTO Product VALUES('P17', 'Trinx ', 'Trinx Tempo 1.0', 'L', N'Hợp kim nhôm', 5500000, 'PC3', 17)
INSERT INTO Product VALUES('P18', 'Trinx', 'Trinx Tempo 1.1', 'M', 'ALUXX-Grade aluminum', 5700000, 'PC3', 18)

INSERT INTO Product VALUES('P19', 'TRINX', 'Folding TRINX Life Flybird 1.0', 'One Size', 'TRINX Alloy 20″×290MM', 5990000, 'PC4', 19)

INSERT INTO Product VALUES('P20', 'MARUISHI', 'Mini Nhật MARUISHI WEA 2633', 'One Size', 'Aluminum alloy', 7490000, 'PC5', 20)
INSERT INTO Product VALUES('P21', 'MOMENTUM', 'Touring MOMENTUM iNeed Street ', 'M', 'ALUXX-grade aluminum', 8790000, 'PC5', 21)
INSERT INTO Product VALUES('P22', 'LIV', 'Touring LIV Flourish 4', 'M', 'ALUXX-Grade Aluminum', 6490000, 'PC5', 22)
INSERT INTO Product VALUES('P23', 'LIV', 'Touring LIV Alight 3 DD Disce', 'M', 'ALUXX-Grade Aluminum', 11390000, 'PC5', 23)

INSERT INTO Product VALUES('P24', 'ROYALBABY', 'Youth ROYALBABY Freestyle', 'One Size', N'Hợp kim thép', 2390000, 'PC6', 24)
INSERT INTO Product VALUES('P25', 'TRINX', 'Youth TRINX Junior 1.0 Disc 20', 'One Size', 'TRINX Hi-Ten Stee', 3590000, 'PC6', 25)
INSERT INTO Product VALUES('P26', 'STITCH', 'Youth STITCH JY903-16', 'One Size', N'Hợp kim thép', 5990000, 'PC6', 26)
INSERT INTO Product VALUES('P27', 'GIANT', 'Youth GIANT XTC Jr 20', 'One Size', 'Vinbike STL 16″', 5590000, 'PC6', 27)
INSERT INTO Product VALUES('P28', 'VINBIKE', 'Youth VINBIKE Robo 16', 'One Size', 'ALUXX-Grade Aluminum', 1990000, 'PC6', 28)
INSERT INTO Product VALUES('P29', 'FORNIX', 'FORNIX Panda', 'One Size', N'Hợp kim thép', 1890000, 'PC6', 29)

SELECT * FROM Product ORDER BY PCID

INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/YB051746-850.jpg', 'P1')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/11/TRIFREE20-7031.jpg', 'P1')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/06/trinx-free-2-0-blue-black-green-850.jpg', 'P1')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/TRIFREE20-3007.jpg', 'P1')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/street1.jpg', 'P2')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/street-8.jpg', 'P2')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/2005001224-ineedstreet-darkgrey-my20.jpg', 'P2')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/escape-3-2022-metallic-black.jpg', 'P3')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/escape-3-2022-white.jpg', 'P3')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/escape-3-2022-1.jpg', 'P3')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390013-850-2.jpg', 'P4')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/sky-2-1-850.jpg', 'P4')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390013-850-2.jpg', 'P4')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/sky-2-5-850.jpg', 'P4')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/sky-2-6-850.jpg', 'P4')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/alight-2-dd-disc-eucalyptus-my22-850-3.jpg', 'P5')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/alight-2-dd-disc-purple-ash-my22-850-3.jpg', 'P5')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/alight-2-dd-disc-eucalyptus-1.jpg', 'P5')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/alight-2-dd-disc-eucalyptus-2.jpg', 'P5')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/fastroad-advanced-2-2022.jpg', 'P6')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/8.png', 'P6')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/6.png', 'P6')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/08/talon-4-1.jpg', 'P7')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/08/talon-4-my21-black-4.jpg', 'P7')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/08/talon-4-my21-black-6.jpg', 'P7')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/FORX26-7036-FORNIX-X26-X%C3%81M-V%C3%80NG-1.jpg', 'P8')
INSERT INTO Images VALUES('https://trumxedap.com/wp-content/uploads/2021/06/Xe-dap-dia-hinh-24-inch-Fornix-bo-truyen-dong.jpg', 'P8')
INSERT INTO Images VALUES('https://trumxedap.com/wp-content/uploads/2021/06/Xe-dap-dia-hinh-24-inch-Fornix-phanh-dia.jpg', 'P8')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/11/liv-tempt-4-2022-black-chrome-850.jpg', 'P9')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/11/tempt-4-2022-black-chrome-rear.jpg', 'P9')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/11/tempt-4-2022-black-chrome-rear-2.jpg', 'P9')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/TRIM136-8029-850-new.jpg', 'P10')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/m136-1-850.jpg', 'P10')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/m136-3-850.jpg', 'P10')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390006-850-1.jpg', 'P11')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390006-850-6.jpg', 'P11')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390006-850-5.jpg', 'P11')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390006-850-7.jpg', 'P11')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/miamor-24-gray-blue-850-2.jpg', 'P12')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/miamor-24-gray-red-3.jpg', 'P12')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/12/miamor-24-gray-red-4.jpg', 'P12')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/04/hitasa-24-ln-black-yellow-850.jpg', 'P13')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/04/hitasa-24-ln-2.jpg', 'P13')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/04/hitasa-24-ln-9.jpg', 'P13')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/SCR-1-2021-Blue-Ashes-800.jpg', 'P14')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/SCR-1-2021-Blue-Ashes-800-2.jpg', 'P14')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/SCR-1-2021-Blue-Ashes-800-4.jpg', 'P14')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/SCR-1-2021-Blue-Ashes-800-7.jpg', 'P14')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/tcr-advanced-pro-1-disc-2021-1.jpg', 'P15')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/tcr-advanced-pro-1-disc-2021-4.jpg', 'P15')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/tcr-advanced-pro-1-disc-2021-6.jpg', 'P15')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/tcr-advanced-pro-1-disc-2021-8.jpg', 'P15')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/10/01-1.jpg', 'P16')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/10/04-2.jpg', 'P16')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/10/06-3.jpg', 'P16')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/09/YB0517281-action-850-1.jpg', 'P17')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/09/YB0517278-3.jpg', 'P17')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/09/YB0517278-6.jpg', 'P17')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/09/YB0517278-8.jpg', 'P17')
INSERT INTO Images VALUES('http://xedaptoanthang.com/xe-dap-dua-trinx-tempo-1-1-dics-2020-bac/#', 'P18')
INSERT INTO Images VALUES('http://xedaptoanthang.com/xe-dap-dua-trinx-tempo-1-1-dics-2020-bac/#', 'P18')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/10/TRILFB10-2009-850.jpg', 'P19')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/10/TRILFB10-5017.jpg', 'P19')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/10/TRILFB10-8012.jpg', 'P19')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/MARWEA2633-5017-850-1.jpg', 'P20')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/MARWEA2633-5017-800-3.jpg', 'P20')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/MARWEA2633-5017-800-7.jpg', 'P20')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/11/2005001224-ineedstreet-darkgrey-my20.jpg', 'P21')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/flourish-1.jpg', 'P22')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/flourish-5.jpg', 'P22')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/flourish-4-2021-green-1.jpg', 'P22')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/09/alight-3-dd-disc-pistachio-2022-850.jpg', 'P23')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/09/alight-3-dd-disc-figuier-2.jpg', 'P23')
INSERT INTO Images VALUES('https://giant.vn/wp-content/uploads/2021/09/alight-3-dd-disc-figuier-1.jpg', 'P23')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/ROYRB1286-2009-850.jpg', 'P24')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/ROYRB12B6-2009-800-3.jpg', 'P24')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/ROYRB12B6-2009-800-6.jpg', 'P24')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/YB0458261-850-1.jpg', 'P25')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/YB0458261-3-1.jpg', 'P25')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/07/YB0458261-7-1.jpg', 'P25')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/STIJY90316-7031-850.jpg', 'P26')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/STIJY90316-5012-800-3.jpg', 'P26')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2020/10/STIJY90316-5012-800-6.jpg', 'P26')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/xtc-jr-20-lite-2022-azure-blue-850.jpg', 'P27')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/xtc-jr-20-lite-2022-azure-blue-2.jpg', 'P27')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/08/xtc-jr-20-lite-2022-azure-blue-1.jpg', 'P27')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390021-850-1.jpg', 'P28')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390021-850-4.jpg', 'P28')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/09/2131390021-850-7.jpg', 'P28')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/fornix-panda-trang-hong-850.jpg', 'P29')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/FORPD16-3015-1-850.jpg', 'P29')
INSERT INTO Images VALUES('https://xedap.vn/wp-content/uploads/2021/03/FORPD16-3015-3-850.jpg', 'P29')

SELECT * FROM Images

INSERT INTO Bill VALUES('B1', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/01/01', 'C1', 'E1' )
INSERT INTO Bill VALUES('B2', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/05/01', 'C2', 'E1' )
INSERT INTO Bill VALUES('B3', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/10', 'C3', 'E2' )
INSERT INTO Bill VALUES('B4', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/03/02', 'C4', 'E2' )
INSERT INTO Bill VALUES('B5', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/06/20', 'C5', 'E2' )
INSERT INTO Bill VALUES('B6', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/20', 'C6', 'E2' )
INSERT INTO Bill VALUES('B7', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/06', 'C7', 'E2' )
INSERT INTO Bill VALUES('B8', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/08/30', 'C8', 'E1' )
INSERT INTO Bill VALUES('B9', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/02/21', 'C9', 'E1' )
INSERT INTO Bill VALUES('B10', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/03/28', 'C10', 'E2' )
INSERT INTO Bill VALUES('B11', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/15', 'C11', 'E2' )
INSERT INTO Bill VALUES('B12', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/05/21', 'C12', 'E1' )
INSERT INTO Bill VALUES('B13', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/04/29', 'C13', 'E1' )
INSERT INTO Bill VALUES('B14', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/06/16', 'C14', 'E1' )
INSERT INTO Bill VALUES('B15', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/18', 'C15', 'E1' )
INSERT INTO Bill VALUES('B16', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/07/10', 'C16', 'E2' )
INSERT INTO Bill VALUES('B17', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/01/20', 'C17', 'E2' )
INSERT INTO Bill VALUES('B18', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/11/30', 'C18', 'E2' )
INSERT INTO Bill VALUES('B19', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/09/20', 'C19', 'E2' )
INSERT INTO Bill VALUES('B20', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/12/18', 'C20', 'E2' )
INSERT INTO Bill VALUES('B21', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/02/05', 'C21', 'E2' )
INSERT INTO Bill VALUES('B22', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/20', 'C22', 'E2' )
INSERT INTO Bill VALUES('B23', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/02/05', 'C23', 'E2' )
INSERT INTO Bill VALUES('B24', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/09/28', 'C24', 'E1' )
INSERT INTO Bill VALUES('B25', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/11/27', 'C25', 'E1' )
INSERT INTO Bill VALUES('B26', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/03/26', 'C26', 'E2' )
INSERT INTO Bill VALUES('B27', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/08/16', 'C27', 'E1' )
INSERT INTO Bill VALUES('B28', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/12/16', 'C28', 'E2' )
INSERT INTO Bill VALUES('B29', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/08/16', 'C29', 'E1' )
INSERT INTO Bill VALUES('B30', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2021/08/16', 'C30', 'E1' )
INSERT INTO Bill VALUES('B31', '18009473', N'176 Võ Văn Ngân, Phường Bình Thọ, Thành Phố Thủ Đức', '2022/01/01', 'C1', 'E2' )


SELECT * FROM Bill WHERE BillID = 'B31'
SELECT * FROM Bill WHERE year(Date) = 2021
DELETE FROM Bill



INSERT INTO OrderDetails VALUES ('B1', 'P1', 6690000, 2, 0)
INSERT INTO OrderDetails VALUES ('B31', 'P5', 12590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B2', 'P3', 9790000, 1, 0)
INSERT INTO OrderDetails VALUES ('B3', 'P4', 11390000, 1, 0)
INSERT INTO OrderDetails VALUES ('B4', 'P5', 12590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B5', 'P25', 3590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B6', 'P24', 2390000, 1, 0)
INSERT INTO OrderDetails VALUES ('B7', 'P27', 5590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B8', 'P28', 1990000, 1, 0)
INSERT INTO OrderDetails VALUES ('B9', 'P28', 1990000, 1, 0)
INSERT INTO OrderDetails VALUES ('B10', 'P4', 11390000, 1, 0.5)
INSERT INTO OrderDetails VALUES ('B11', 'P4', 11390000, 1, 0)
INSERT INTO OrderDetails VALUES ('B12', 'P10', 5590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B13', 'P13', 3290000, 1, 0)
INSERT INTO OrderDetails VALUES ('B14', 'P15', 105590000, 1, 0)
INSERT INTO OrderDetails VALUES ('B15', 'P29', 1890000, 1, 0.5)
INSERT INTO OrderDetails VALUES ('B16', 'P2', 8790000, 1, 0)
INSERT INTO OrderDetails VALUES ('B17', 'P17', 5500000, 1, 0)
INSERT INTO OrderDetails VALUES ('B18', 'P14', 22790000, 1, 0.25)
INSERT INTO OrderDetails VALUES ('B19', 'P29', 1890000, 2, 0)
INSERT INTO OrderDetails VALUES ('B20', 'P29',  1890000, 2, 0)
INSERT INTO OrderDetails VALUES ('B21', 'P26', 5990000, 1, 0)
INSERT INTO OrderDetails VALUES ('B22', 'P19', 5990000, 1, 0)
INSERT INTO OrderDetails VALUES ('B23', 'P20', 7490000, 1, 0)
INSERT INTO OrderDetails VALUES ('B24', 'P20', 7490000, 1, 0)
INSERT INTO OrderDetails VALUES ('B25', 'P23', 11390000, 1, 0.25)
INSERT INTO OrderDetails VALUES ('B26', 'P21', 8790000, 1, 0)
INSERT INTO OrderDetails VALUES ('B27', 'P22', 6490000, 1, 0.15)
INSERT INTO OrderDetails VALUES ('B28', 'P22', 6490000, 1, 0.2)
INSERT INTO OrderDetails VALUES ('B29', 'P20', 7490000, 1, 0.1)
INSERT INTO OrderDetails VALUES ('B30', 'P23', 11390000, 1, 0.15)
INSERT INTO OrderDetails VALUES ('B32', 'P1', 11390000, 3, 0.15)

SELECT * FROM OrderDetails

SELECT *, Price * Quantity * (1 - Discount) AS SubTotal FROM OrderDetails

INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B1')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/05/01', 'B2')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/10', 'B3')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/03/02', 'B4')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/06/20', 'B5')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/20', 'B6')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/06', 'B7')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/08/30', 'B8')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B9')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B10')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/01', 'B11')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B12')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B13')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B14')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/01', 'B15')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B16')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B17')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B18')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B19')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B20')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B21')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/01', 'B22')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/01', 'B23')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B24')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B25')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B26')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B27')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B28')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B29')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2026/01/01', 'B30')
INSERT INTO Guarantee VALUES (N'Xe đạp được bảo hành 5 năm.', '2027/01/01', 'B1')


