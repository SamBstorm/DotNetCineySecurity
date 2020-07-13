CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY UNIQUE	--uk_user_id_6FE82AFD --Ne fonctionne que sur une colonne
	CONSTRAINT UK_User_Id UNIQUE (Id,Name)		--UK_User_Id
)
