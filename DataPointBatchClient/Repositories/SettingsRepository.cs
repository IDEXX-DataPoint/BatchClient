using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using DataPointBatchClient.Models;
using DataPointBatchClient.Utility;

namespace DataPointBatchClient.Repositories
{
    public class SettingsRepository
    {
        private readonly string Query = EmbeddedResource.Get("DataPointBatchClient.Scripts.MergeSettings.sql");
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();
        private string ConnectionString => ConfigurationManager.ConnectionStrings["DestinationData"].ConnectionString;

        public async Task<Settings> Get(string resourceName)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                const string sql = "SELECT * FROM Settings WHERE ResourceName = @ResourceName";
                var result = await conn.QueryAsync<Settings>(sql, new { ResourceName = resourceName });
                return result.FirstOrDefault();
            }
        }
        
        public async Task Update(Settings settings)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                try
                {
                    await conn.ExecuteAsync(Query, settings);
                }
                catch (SqlException e)
                {
                    Logger.Error(e);
                }
            }
        }
    }
}