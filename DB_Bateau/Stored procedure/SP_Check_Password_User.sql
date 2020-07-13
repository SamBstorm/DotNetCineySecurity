CREATE PROCEDURE [dbo].[SP_Check_Password_User]
	@login VARCHAR(63),
	@password VARCHAR(32),
	@email VARCHAR(254),
	@Id INTEGER OUTPUT
AS
	/*DECLARE @pwdInput VARBINARY(32);
	DECLARE @pwdRegistered VARBINARY(32);
	SET @pwdInput = HASHBYTES('SHA2_256','login'+@password+'email');
	--SELECT @pwdRegistered = [Password] FROM [User] WHERE [Login] = @login OR [Email] = @email;
	SET @pwdRegistered = (SELECT [Password] FROM [User] WHERE [Login] = @login OR [Email] = @email);
	IF (@pwdInput = @pwdRegistered)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END*/

	/*DECLARE @oldPwd VARBINARY(32) = (SELECT [Password] FROM [User] WHERE [Login] = @login OR [Email] = @email);
	DECLARE @newPwd VARBINARY(32) = HASHBYTES('SHA2_256', 'login'+@password+'email');
	IF (@newPwd = @oldPwd)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END*/

	SELECT @Id = Id 
	FROM [User] 
	WHERE 
		([Login] =@login OR [Email] = @email)
		AND [Password] = dbo.SF_HashPassword(@password)
