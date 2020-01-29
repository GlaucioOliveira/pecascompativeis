using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace pecacompativel.db.Models
{
    public class PecaCompativelDatabaseSettings : IPecaCompativelDatabaseSettings
    {
        public string PecaCollectionName { get; set; }
        public string MarcaCollectionName { get; set; }
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }

    public interface IPecaCompativelDatabaseSettings
    {
        string PecaCollectionName { get; set; }
        string MarcaCollectionName { get; set; }
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
