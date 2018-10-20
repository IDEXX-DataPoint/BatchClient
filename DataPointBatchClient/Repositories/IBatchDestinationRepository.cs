using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Threading;
using System.Threading.Tasks;
using Dapper;
using DataPointBatchClient.Utility;
using Newtonsoft.Json;

namespace DataPointBatchClient.Repositories
{
    public interface IBatchDestinationRepository<in T>
    {
        Task<bool> MergeEntities(IEnumerable<T> entities);
    }

    public abstract class BatchDestinationRepository<T> : IBatchDestinationRepository<T>
    {
        protected string Query;
        private readonly CancellationToken _token;

        protected BatchDestinationRepository(string resourcePath, CancellationToken token)
        {
            Query = EmbeddedResource.Get(resourcePath);
            _token = token;
        }

        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();
        private static string ConnectionString => ConfigurationManager.ConnectionStrings["DestinationData"].ConnectionString;

        public async Task<bool> MergeEntities(IEnumerable<T> entities)
        {
            var success = true;

            using (var conn = new SqlConnection(ConnectionString))
            {
                foreach (var entity in entities)
                {
                    if (_token.IsCancellationRequested) return false;

                    try
                    {
                        // todo dapper table valued parameter to consume entities
                        await conn.ExecuteAsync(Query, entity);
                    }
                    catch (SqlException e)
                    {
                        Logger.Info("{0}{1}{0}{2}", Environment.NewLine, entity.ToString(), Serialize(entity));
                        Logger.Error(e);
                        success = false;
                    }
                }
            }

            return success;
        }

        private static string Serialize(object entity)
        {
            var settings = new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            };
            return JsonConvert.SerializeObject(entity, Formatting.Indented, settings);
        }
    }
}
