create table Person
(
	personId int not null identity
		primary key,
	personLast nvarchar(25) not null,
	personFirst nvarchar(25) not null,
	personEmail nvarchar(50)
)
go

create table Role
(
	roleId int not null identity
		primary key,
	roleDescription varchar(50) not null
		unique
)
go

create table Country
(
	countryId nvarchar(2) not null
		primary key,
	countryName nvarchar(25) not null
)
go

create table PersonRole
(
	roleId int not null
		references Role,
	personId int not null
		references Person
)
go

create table State
(
	stateId nvarchar(3) not null
		primary key,
	stateName nvarchar(25) not null,
	countryId nvarchar(2) not null
		references Country
)
go

create table Location
(
	locationId int not null identity
		primary key,
	locationAddress nvarchar(50) not null,
	locationZip nvarchar(14),
	stateId nvarchar(3) not null
		references State,
	countryId nvarchar(2) not null
		references Country,
	phone nvarchar(15),
	cityId int not null
)
go

create table Event
(
	eventId int not null identity
		primary key,
	eventDescription nvarchar(75) not null,
	eventDate date not null,
	locationId int not null
		references Location
)
go

create table Track
(
	trackId int not null identity
		primary key,
	trackDescription varchar(50) not null
		unique
)
go

create table ClassDifficulty
(
	classDifficultyId int not null identity
		primary key,
	difficultyDescription varchar(20) not null
		unique
)
go

create table Class
(
	classId nvarchar(10) not null
		primary key,
	eventId int not null
		references Event,
	classTitle nvarchar(25),
	classDescription nvarchar(100),
	classDifficultyId int not null
		references ClassDifficulty,
	classDuration int not null,
	personId int not null
		references Person,
	trackId int not null
		references Track,
	classLocation int not null
		constraint Class_Location_locationId_fk
			references Location
)
go

create table Room
(
	roomId int not null identity
		primary key,
	eventId int,
	occupancy int
)
go

create table Schedule
(
	scheduleId int not null identity
		primary key,
	eventId int not null
		references Event,
	classId nvarchar(10)
		references Class,
	roomId int not null
		references Room,
	scheduleTime date not null,
	unique (eventId, roomId)
)
go

create table Vendor
(
	vendorId nvarchar(15) not null
		primary key,
	vendorDesciption nvarchar(50) not null,
	personId int not null
		references Person
)
go

create table VendorTable
(
	tableId int not null
		primary key,
	eventId int not null
		references Event,
	vendorId nvarchar(15) not null
		references Vendor
)
go

create table Raffle
(
	raffleId int not null identity
		primary key,
	eventId int not null
		references Event,
	personId int not null
		references Person,
	vendorId nvarchar(15) not null
		references Vendor
)
go

create table SponsorLevel
(
	sponsorLevelId int not null identity
		primary key,
	sponsorLevelDescription varchar(20) not null
		unique
)
go

create table Sponsor
(
	sponsorId int not null identity
		primary key,
	sponsorName varchar(50) not null,
	sponsorLevelId int not null
		references SponsorLevel,
	eventId int not null
		references Event
)
go

create table Classattendee
(
	classId nvarchar(10) not null
		references Class,
	personId int not null
		references Person
)
go

create table City
(
	cityId int not null identity
		primary key,
	cityName nvarchar(50) not null
)
go

alter table Location
	add constraint Location_City_cityId_fk
		foreign key (cityId) references City
go

create table PresenterPresentation
(
	ppId int not null identity
		primary key,
	presentationTitle nvarchar(75) not null,
	presentationSpeaker nvarchar(75) not null
)
go







CREATE PROC insertClassDifficulty
  AS
  BEGIN
    BEGIN TRY
      INSERT INTO ClassDifficulty VALUES ('Beginner');
      INSERT INTO ClassDifficulty VALUES ('Intermediate');
      INSERT INTO ClassDifficulty VALUES ('Advanced');
      INSERT INTO ClassDifficulty VALUES ('Non_Technical');
    END TRY
    BEGIN CATCH
    END CATCH
  END



