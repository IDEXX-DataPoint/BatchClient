using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading;
using System.Threading.Tasks;
using Dapper;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchDestinationRepository<in T>
    {
        Task<bool> MergeEntities(IEnumerable<T> entities, CancellationToken token);
    }

    public abstract class BatchDestinationRepository<T> : IBatchDestinationRepository<T>
    {
        protected string Query;

        protected BatchDestinationRepository(string resourcePath)
        {
            Query = EmbeddedResource.Get(resourcePath);
        }

        private string ConnectionString => ConfigurationManager.ConnectionStrings["DestinationData"].ConnectionString;

        public async Task<bool> MergeEntities(IEnumerable<T> entities, CancellationToken token)
        {
            var success = true;

            using (var conn = new SqlConnection(ConnectionString))
            {
                foreach (var entity in entities)
                {
                    if (token.IsCancellationRequested) return false;

                    try
                    {
                        // todo dapper table valued parameter to consume entities
                        await conn.ExecuteAsync(Query, entity);
                    }
                    catch (SqlException e)
                    {
                        Console.WriteLine(e);
                        success = false;
                    }
                }
            }

            return success;
        }
    }
}
