CREATE SCHEMA [Configuration]
GO

CREATE SCHEMA [Services]
GO

CREATE TABLE [Configuration].[ConfigurationStrings] (
  [ID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] nvarchar(255) NOT NULL,
  [Value] nvarchar(255) NOT NULL
)
GO

CREATE TABLE [Configuration].[Environments] (
  [ID] int PRIMARY KEY IDENTITY(1, 1),
  [ChildOf] int,
  [Name] nvarchar(255) NOT NULL,
  [Description] nvarchar(255)
)
GO

CREATE TABLE [Configuration].[ServiceConfigurationStrings] (
  [ID] int PRIMARY KEY IDENTITY(1, 1),
  [ServiceID] int NOT NULL,
  [ConfigurationStringID] int NOT NULL,
  [EnvironmentID] int NOT NULL
)
GO

CREATE TABLE [Services].[Services] (
  [ID] int PRIMARY KEY IDENTITY(1, 1),
  [Name] nvarchar(255) NOT NULL,
  [Description] nvarchar(255)
)
GO

ALTER TABLE [Configuration].[Environments] ADD FOREIGN KEY ([ChildOf]) REFERENCES [Configuration].[Environments] ([ID])
GO

ALTER TABLE [Configuration].[ServiceConfigurationStrings] ADD FOREIGN KEY ([ServiceID]) REFERENCES [Services].[Services] ([ID])
GO

ALTER TABLE [Configuration].[ServiceConfigurationStrings] ADD FOREIGN KEY ([ConfigurationStringID]) REFERENCES [Configuration].[ConfigurationStrings] ([ID])
GO

ALTER TABLE [Configuration].[ServiceConfigurationStrings] ADD FOREIGN KEY ([EnvironmentID]) REFERENCES [Configuration].[Environments] ([ID])
GO
