using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using pecacompativel.db.Models;
using MongoDB.Driver;

namespace pecacompativel.db.Services
{
    public class PecaService
    {
        private readonly IMongoCollection<Peca> _pecas;

        public PecaService(IPecaCompativelDatabaseSettings settings)
        {
            var client = new MongoClient(settings.ConnectionString);
            var database = client.GetDatabase(settings.DatabaseName);

            _pecas = database.GetCollection<Peca>(settings.PecaCollectionName);
        }

        public List<Peca> Get() =>
            _pecas.Find(peca => true).ToList();

        public List<Peca> ListarPecasAlternativas(string ModeloOrigem)
        {
            return _pecas.Find(x => x.ModeloOrigem == ModeloOrigem).ToList();
        }

        public Peca Get(string id) =>
            _pecas.Find<Peca>(peca => peca.Id == id).FirstOrDefault();

        public Peca Create(Peca peca)
        {
            peca.DataCriacao = DateTime.Now;
            peca.DataAlteracao = DateTime.Now;

            _pecas.InsertOne(peca);
            return peca;
        }

        public void Update(string id, Peca pecaIn) =>
            _pecas.ReplaceOne(peca => peca.Id == id, pecaIn);

        public void Remove(Peca pecaIn) =>
            _pecas.DeleteOne(peca => peca.Id == pecaIn.Id);

        public void Remove(string id) =>
            _pecas.DeleteOne(peca => peca.Id == id);
    }
}
