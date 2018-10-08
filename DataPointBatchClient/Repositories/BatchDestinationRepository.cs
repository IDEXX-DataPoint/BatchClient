using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dapper;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchDestinationRepository<in T>
    {
        void MergeEntities(IEnumerable<T> entities);
    }

    public abstract class BatchDestinationRepository<T> : IBatchDestinationRepository<T>
    {
        protected string Query;

        protected BatchDestinationRepository(string resourcePath)
        {
            Query = EmbeddedResource.Get(resourcePath);
        }

        public void MergeEntities(IEnumerable<T> entities)
        {
            using (var conn = new SqlConnection(Properties.Settings.Default.ConnectionString))
            {
                foreach (var entity in entities)
                {
                    try
                    {
                        conn.Execute(Query, entity);
                    }
                    catch (SqlException e)
                    {
                        // todo logging
                        Console.WriteLine(e);
                    }
                }
            }
        }
    }
}
