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
        private readonly string _query = EmbeddedResource.Get("DataPointBatchClient.Scripts.MergeSettings.sql");
        private static readonly NLog.Logger Logger = NLog.LogManager.GetCurrentClassLogger();
        private static string ConnectionString => ConfigurationManager.ConnectionStrings["DestinationData"].ConnectionString;

        public async Task<Settings> Get(string siteId, string resourceName)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                const string sql = "select * from Settings where SiteId = @SiteId and ResourceName = @ResourceName";
                var result = await conn.QueryAsync<Settings>(sql, new { SiteId = siteId, ResourceName = resourceName });
                return result.FirstOrDefault();
            }
        }
        
        public async Task Update(Settings settings)
        {
            using (var conn = new SqlConnection(ConnectionString))
            {
                try
                {
                    await conn.ExecuteAsync(_query, settings);
                }
                catch (SqlException e)
                {
                    Logger.Error(e);
                }
            }
        }
    }
}