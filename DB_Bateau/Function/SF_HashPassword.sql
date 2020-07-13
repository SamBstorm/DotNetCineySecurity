CREATE FUNCTION [dbo].[SF_HashPassword]
(
	@password VARCHAR(32)
)
RETURNS VARBINARY(32)
AS
BEGIN
	DECLARE @hashPassword VARBINARY(32) = NULL;
	DECLARE @oldPassword VARCHAR(32) = TRIM(@password)

	IF(LEN(@oldPassword)>0)
	BEGIN
		IF(LEN(@oldPassword)%2 =1)
		BEGIN
			SET @hashPassword = HASHBYTES('SHA2_256','login'+@oldPassword+'email')
		END
		ELSE
		BEGIN
			SET @hashPassword =
			HASHBYTES(
				'SHA2_256',
					'Sam'+
					SUBSTRING(@oldPassword,1,LEN(@oldPassword)/2)
					+'fait'+
					SUBSTRING(@oldPassword,(LEN(@oldPassword)/2)+1,LEN(@oldPassword)/2)
					+'rire')
		END
	END

	RETURN @hashPassword;
END
