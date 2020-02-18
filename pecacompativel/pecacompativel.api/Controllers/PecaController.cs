using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using pecacompativel.db.Services;
using pecacompativel.db.Models;
using Microsoft.AspNetCore.Cors;
using System.Net.Http;
using System.Text;

namespace pecacompativel.api.Controllers
{
    //[DisableCors]
    [ApiController]
    [Route("[controller]")]
    public class PecaController : ControllerBase
    {
        private readonly PecaService _pecaService;

        public PecaController(PecaService pecaService)
        {
            _pecaService = pecaService;
        }

        [HttpGet]
        public ActionResult<List<Peca>> Get() =>
         _pecaService.Get();

        [HttpGet("{id:length(24)}", Name = "GetPeca")]
        public ActionResult<Peca> Get(string id)
        {
            var peca = _pecaService.Get(id);

            if (peca == null)
            {
                return NotFound();
            }

            return peca;
        }

        [HttpGet("ListarPecasAlternativas/{modelo}")]
        public ActionResult<List<Peca>> ListarPecasAlternativas(string modelo)
        {
            return _pecaService.ListarPecasAlternativas(modelo);
        }

        [HttpGet("ListarQuantidadePecasAlternativas")]
        public ActionResult<List<PecaQuantidadePorModelo>> ListarQuantidadePecasAlternativas()
        {
            return _pecaService.ListarQuantidadePecasAlternativas();
        }

        [HttpPost]
        public ActionResult<Peca> Create(Peca peca)
        {
            peca.DataCriacao = DateTime.Now;
            peca.DataAlteracao = peca.DataCriacao;

            _pecaService.Create(peca);
            return CreatedAtRoute("GetPeca", new { id = peca.Id.ToString() }, peca);
        }

        [HttpDelete("{id:length(24)}")]
        public IActionResult Delete(string id)
        {
            var peca = _pecaService.Get(id);

            if (peca == null)
            {
                return NotFound();
            }

            _pecaService.Remove(peca.Id);

            return NoContent();
        }
    }
}