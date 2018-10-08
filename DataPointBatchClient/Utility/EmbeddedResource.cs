using System;
using System.IO;
using System.Reflection;

namespace DataPointBatchClient.Utility
{
    public static class EmbeddedResource
    {
        public static string Get(string resourcePath)
        {
            var assembly = Assembly.GetExecutingAssembly();

            using (var stream = assembly.GetManifestResourceStream(resourcePath))
            using (var reader = new StreamReader(stream ?? throw new InvalidOperationException()))
            {
                return reader.ReadToEnd();
            }
        }
    }
}
