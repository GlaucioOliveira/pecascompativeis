using System;
using pecacompativel.db.Models;
using pecacompativel.db.Services;
using System.Text.Json;
using System.IO;

namespace pecacompativel.cli
{
    class Program
    {
        static PecaCompativelDatabaseSettings dbConnection;
        static void Main(string[] args)
        {
            dbConnection = new PecaCompativelDatabaseSettings()
            {
                 DatabaseName = "pecacompativel",
                 ConnectionString= "mongodb://localhost:27017",
                 PecaCompativelCollectionName = "pecacompativel"
            };

            PecaService db = new PecaService(dbConnection);

            Console.WriteLine("Peça Compativel - CLI - v0.0.1");


        }

    }
}
