using DataPointBatchClient.Utility;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DataPointBatchClientTests
{
    [TestClass]
    public class UnitTest1
    {
        /// <summary>
        /// Add existing App.config from main project to this project
        /// </summary>
        [TestMethod]
        public void EmbeddedResource_RetrieveResource()
        {
            var sql = EmbeddedResource.Get("DataPointBatchClient.Scripts.InsertPatient.sql");
            Assert.AreNotEqual(sql, null);
        }
    }
}
