MERGE dbo.Settings AS target
USING (SELECT @ResourceName
    ,@LastUpdated)
AS source (ResourceName
    ,LastUpdated)
ON (target.ResourceName = source.ResourceName)

WHEN MATCHED
THEN UPDATE SET LastUpdated = source.LastUpdated

WHEN NOT MATCHED
THEN INSERT (ResourceName
    ,LastUpdated)
VALUES (source.ResourceName
    ,source.LastUpdated);
