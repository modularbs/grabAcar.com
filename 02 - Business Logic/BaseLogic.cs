using System;

namespace CarRental
{
    /// <summary>
    /// Base Logic Class with Dispose Method.
    /// </summary>
    public class BaseLogic : IDisposable
    {
        protected readonly grabAcarEntities DB = new grabAcarEntities();

        public void Dispose()
        {
            DB.Dispose();
        }
    }
}