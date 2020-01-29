using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using pecacompativel.db.Services;
using pecacompativel.db.Models;

namespace pecacompativel.api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MarcaController : ControllerBase
    {
        private readonly MarcaService _marcaService;

        public MarcaController(MarcaService marcaService)
        {
            _marcaService = marcaService;
        }

        [HttpGet]
        public ActionResult<List<Marca>> Get() =>
         _marcaService.Get();

        [HttpGet("{id:length(24)}", Name = "GetMarca")]
        public ActionResult<Marca> Get(string id)
        {
            var peca = _marcaService.Get(id);

            if (peca == null)
            {
                return NotFound();
            }

            return peca;
        }

        [HttpPost]
        public ActionResult<Peca> Create(Marca marca)
        {
            _marcaService.Create(marca);
            return CreatedAtRoute("GetMarca", new { id = marca.Id.ToString() }, marc);
        }

        [HttpDelete("{id:length(24)}")]
        public IActionResult Delete(string id)
        {
            var peca = _marcaService.Get(id);

            if (peca == null)
            {
                return NotFound();
            }

            _marcaService.Remove(peca.Id);

            return NoContent();
        }
    }
}