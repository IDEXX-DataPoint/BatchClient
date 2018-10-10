using System;
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
        private static readonly string Query = EmbeddedResource.Get("DataPointBatchClient.Scripts.MergeSettings.sql");

        public static async Task<Settings> Get(string resourceName)
        {
            using (var conn = new SqlConnection(Properties.Settings.Default.ConnectionString))
            {
                const string sql = "SELECT * FROM Settings WHERE ResourceName = @ResourceName";
                var result = await conn.QueryAsync<Settings>(sql, new { ResourceName = resourceName });
                return result.FirstOrDefault();
            }
        }
        
        public static async void Update(Settings settings)
        {
            using (var conn = new SqlConnection(Properties.Settings.Default.ConnectionString))
            {
                try
                {
                    await conn.ExecuteAsync(Query, settings);
                }
                catch (SqlException e)
                {
                    // todo handle exception
                    Console.WriteLine(e);
                }
            }
        }
    }
}