CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Login] VARCHAR(63) NOT NULL,
	[Password] VARBINARY(32) NOT NULL,
	[Email] VARCHAR(254) NOT NULL,
	[SignUpDate] DATETIME2 NOT NULL DEFAULT GETDATE(),
	[DisableDate] DATETIME2,
	CONSTRAINT CK_User_DisableDate CHECK([DisableDate] IS NULL OR [DisableDate] > [SignUpDate]),
	CONSTRAINT UK_User_Email UNIQUE([Email]),
	CONSTRAINT CK_User_Email CHECK(LEN([Email])>=5 AND [Email] LIKE '%[A-Z0-9][@][A-Z0-9]%[.][A-Z0-9]%'),
	CONSTRAINT UK_User_Login UNIQUE([Login])
)
