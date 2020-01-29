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
        #region [Variáveis Globais]
        static PecaCompativelDatabaseSettings dbConnection;
        static PecaService pecadb;
        static MarcaService marcadb;
        #endregion

        static void Main(string[] args)
        {
            carregaServices();

            Console.WriteLine("Peça Compativel - CLI - v0.0.1");

            var listaMarcas = pegaJSONProcessado();

            foreach (var item in listaMarcas)
            {
                Console.WriteLine($"Importando: {item.Key}");

                var marca = new Marca()
                {
                    Nome = item.Key.Trim()
                };

                foreach (var modelo in item.Value)
                {
                    marca.Modelo.Add(new Modelo()
                    {
                         Nome = modelo.Modelo.Trim(),
                         Ano = modelo.Ano
                    });
                }
                
                //cadastro de marcas;
                marcadb.Create(marca);
            }

            Console.WriteLine("\n> Pressione uma Tecla para Encerrar... ");
            Console.ReadKey();
        }

        private static Dictionary<string, List<Automovel>> pegaJSONProcessado()
        {
            Dictionary<string, List<Automovel>> listaMarcas = new Dictionary<string, List<Automovel>>();

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

            return listaMarcas;
        }

        private static List<string> pegaMotoAno(string cod_fipe)
        {
            List<string> listaAnoModelo = new List<string>();

            string jsonContent = File.ReadAllText($@"{AppDomain.CurrentDomain.BaseDirectory}\..\..\..\dump\moto_modelo_ano\{cod_fipe}.json");
            var jsonBody = JsonDocument.Parse(jsonContent).RootElement;

            foreach (var item in jsonBody.EnumerateArray())
            {
                var tipo = item.GetProperty("tipo").GetString().Replace("gasolina", "").Replace("alcool", "").Trim();

                if (!listaAnoModelo.Contains(tipo) && !tipo.ToLower().Equals("zero km")) listaAnoModelo.Add(tipo);
            }

            return listaAnoModelo;
        }

        static void carregaServices()
        {
            dbConnection = new PecaCompativelDatabaseSettings()
            {
                DatabaseName = "pecacompativel",
                ConnectionString = "mongodb://localhost:27017",
                PecaCompativelCollectionName = "pecacompativel"
            };

            pecadb = new PecaService(dbConnection);

            marcadb = new MarcaService(new PecaCompativelDatabaseSettings()
            {
                DatabaseName = "pecacompativel",
                ConnectionString = "mongodb://localhost:27017",
                PecaCompativelCollectionName = "marca"
            });
        }
    }
}
