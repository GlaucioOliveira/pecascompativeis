using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace pecacompativel.db.Models
{
    public class Modelo
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }

        public string Nome { get; set; }
        public List<string> Ano { get; set; }

        public string MarcaNome { get; set; }
        public string MarcaId { get; set; }
        [BsonIgnore]
        public int QuantidadeDePecas { get; set; }
    }
}
