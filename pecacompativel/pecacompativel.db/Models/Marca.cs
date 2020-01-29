using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace pecacompativel.db.Models
{
    public class Marca
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Nome { get; set; }
        public List<Modelo> Modelo { get; set; }

        public Marca()
        {
            Modelo = new List<Modelo>();
        }
    }
}
