MERGE dbo.Settings AS target
USING (SELECT @SiteId
    ,@ResourceName
    ,@LastUpdated)
AS source (SiteId
    ,ResourceName
    ,LastUpdated)
ON (target.SiteId = source.SiteId and target.ResourceName = source.ResourceName)

WHEN MATCHED
THEN UPDATE SET LastUpdated = source.LastUpdated

WHEN NOT MATCHED
THEN INSERT (SiteId
    ,ResourceName
    ,LastUpdated)
VALUES (source.SiteId
    ,source.ResourceName
    ,source.LastUpdated);
