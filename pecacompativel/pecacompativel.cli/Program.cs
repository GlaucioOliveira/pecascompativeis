using System;
using pecacompativel.db.Models;
using pecacompativel.db.Services;
using System.Text.Json;
using System.IO;
using System.Collections.Generic;
using pecacompativel.cli.Models;

namespace pecacompativel.cli
{
    class Program
    {
        static PecaCompativelDatabaseSettings dbConnection;
        static void Main(string[] args)
        {
            Dictionary<string, List<Automovel>> listaMarcas = new Dictionary<string, List<Automovel>>();

            dbConnection = new PecaCompativelDatabaseSettings()
            {
                DatabaseName = "pecacompativel",
                ConnectionString = "mongodb://localhost:27017",
                PecaCompativelCollectionName = "pecacompativel"
            };

            PecaService db = new PecaService(dbConnection);

            Console.WriteLine("Peça Compativel - CLI - v0.0.1");

            string jsonContent = File.ReadAllText($@"{AppDomain.CurrentDomain.BaseDirectory}\..\..\..\dump\moto.json");
            var jsonBody = JsonDocument.Parse(jsonContent).RootElement;

            foreach (var item in jsonBody.EnumerateArray())
            {
                var marca = item.GetProperty("marca").GetString();
                var modelo = item.GetProperty("modelo").GetString();
                var cod_fipe = item.GetProperty("cod_fipe").GetString();

                if (!listaMarcas.ContainsKey(marca))
                {
                    listaMarcas.Add(marca, new List<Automovel>());
                }
                else
                {
                    Automovel moto = new Automovel()
                    {
                        Marca = marca,
                        Modelo = modelo
                    };

                    moto.Ano = pegaMotoAno(cod_fipe);

                    listaMarcas[marca].Add(moto);
                }
            }

            Console.WriteLine("\n> Pressione uma Tecla para Encerrar... ");
            Console.ReadKey();
        }

        private static List<string> pegaMotoAno(string cod_fipe)
        {
            List<string> listaAnoModelo = new List<string>();

            string jsonContent = File.ReadAllText($@"{AppDomain.CurrentDomain.BaseDirectory}\..\..\..\dump\moto_modelo_ano\{cod_fipe}.json");
            var jsonBody = JsonDocument.Parse(jsonContent).RootElement;

            foreach (var item in jsonBody.EnumerateArray())
            {
                var tipo = item.GetProperty("tipo").GetString().Replace("gasolina","").Replace("alcool","").Trim();

                if (!listaAnoModelo.Contains(tipo) && !tipo.ToLower().Equals("zero km")) listaAnoModelo.Add(tipo);
            }

            return listaAnoModelo;
        }
    }
}
