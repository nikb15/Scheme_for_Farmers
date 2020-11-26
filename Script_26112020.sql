create database dbProject

create table tblAdmin(
				Adminid int identity primary key,
				AdminName varchar(30),
				AdminContact nvarchar(30),
				AdminEmail varchar(30) unique,
				AdminPass nvarchar(30))

create table tblFarmer(
					Farmerid int identity(100,1) primary key,
					FarmerName varchar(30),
					FarmerContactNo nvarchar(10),
					FarmerEmail varchar(30) unique,
					FarmerAddress varchar(50) ,
					FarmerCity varchar(30),
					FarmerState varchar(20),
					FarmerPincocde nvarchar(6),
					FarmerAadhar varchar(max),
					FarmerCertificate varchar(max),
					FarmerPassword nvarchar(20),
					FarmerApproved bit,
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)

create table tblBidder(
					Bidderid int identity(100,1) primary key,
					BidderName varchar(30),
					BidderContactNo nvarchar(10),
					BidderEmail varchar(30) unique,
					BidderAddress varchar(50) ,
					BidderCity varchar(30),
					BidderState varchar(20),
					BidderPincocde nvarchar(6),
					BidderAadhar varchar(max),
					BidderTradeLicense varchar(max),
					BidderPassword nvarchar(20),
					BidderApproved bit,
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)

create table tblFarmLand(	
						FarmerLandId int identity ,
						Farmerid int foreign key references tblFarmer(Farmerid),
						FarmerLandArea varchar(10),
						FarmerLandAddress varchar(30),
						FarmerLandPincode nvarchar(6)
						)

create table tblBank (
				AccountNo nvarchar(20) primary key,
				Farmerid int foreign key references tblFarmer(Farmerid),
				Bidderid int foreign key references tblBidder(Bidderid),
				IFSC_Code nvarchar(15)
				)

create table tblSales(
					Salesid int identity primary key,
					Farmerid int foreign key references tblFarmer(Farmerid),
					Bidderid int foreign key references tblBidder(Bidderid),
					CropName varchar(20) ,
					Quantity int,
					MinSalePrice int,
					Price int ,
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)

create table tblCropRequest(
							Requestid int identity primary key,
							Farmerid int foreign key references tblFarmer(Farmerid),
							CropType varchar(20),
							CropName varchar(20),
							FertilizerType varchar(20),
							Quantity numeric,
							SoilPhCertificate varchar(max),
							CropApproved bit,
							ApprovalAdminId int foreign key references tblAdmin(Adminid)
						)

create table tblBidding (
					Biddingid int identity primary key , 
					Requestid int foreign key references tblCropRequest(Requestid),
					Bidderid int foreign key references tblBidder(Bidderid),
					InitalPrce int ,
					CurrentBidPrice int ,
					PreviousBidPrice int, 
					BidCloseTime datetime,
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)

create table tblContactUs(
                    RequestToken int identity primary key ,
					Email varchar(20),
					--Name
					ContactName varchar(20),
					RequestType varchar(15),
					Message varchar(20),
					Status varchar(15),
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)

create table tblInsurance(
					PolicyNo int identity primary key,
					Farmerid int foreign key references tblFarmer(Farmerid),
					CompanyName varchar(30),
					Season varchar(10),
					Year nvarchar(4),
					Crop varchar(20),
					SumInsured int,
					DateOfInsurance datetime,
					Area decimal ,
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)
create table tblInsuranceClaim(
					Cliamid int identity primary key, 
					PolicyNo int foreign key references tblInsurance(PolicyNo),
					CauseOfClaim varchar(50),
					DateOfLoss datetime,
					DateOfClaim datetime,
					AmountClaimed int, 
					ApprovalAdminId int foreign key references tblAdmin(Adminid)
					)


--nvarchar 
--varchar
--int
--boolean
--unique
--identity (100,1)
--primary key