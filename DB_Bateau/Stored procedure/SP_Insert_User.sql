CREATE PROCEDURE [dbo].[SP_Insert_User]
	@login VARCHAR(63),
	@password VARCHAR(32),
	@email VARCHAR(254)
AS
	INSERT INTO [User]([Login],[Password],[Email])
	OUTPUT inserted.Id
	VALUES (@login, dbo.SF_HashPassword(@password), @email);
