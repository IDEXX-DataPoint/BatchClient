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
            Assert.AreNotEqual(BatchApiUtility.Token, null);
        }

        [TestMethod]
        public void EmbeddedResource_RetrieveResource()
        {
            var sql = EmbeddedResource.Get("DataPointBatchClient.Scripts.InsertPatient.sql");
            Assert.AreNotEqual(sql, null);
        }
    }
}
