using System;
using DataPointBatchClient.Repositories;
using DataPointBatchClient.Utility;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataPointBatchClientTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void BatchApiUtility_RetrieveToken()
        {
            // todo link or copy app.config
            Assert.AreNotEqual(BatchApiUtility.Authorization, "Bearer ");
        }

        [TestMethod]
        public void EmbeddedResource_RetrieveResource()
        {
            var sql = EmbeddedResource.Get("DataPointBatchClient.Scripts.InsertPatient.sql");
            Assert.AreNotEqual(sql, null);
        }

        [TestMethod]
        public void SettingsRepository_Get()
        {
            var settings = new
            {
                ResourceName = "Appointments",
                LastUpdated = DateTime.Parse("2018-10-10")
            };
            
            var task = SettingsRepository.Get(settings.ResourceName);
            var result = task.Result;
            Assert.AreEqual(result, settings);
        }
    }
}
