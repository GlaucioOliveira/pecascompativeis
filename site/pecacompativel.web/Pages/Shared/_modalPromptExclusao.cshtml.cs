using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace pecacompativel.web
{
    public class _modalPromptExclusaoModel : PageModel
    {
        public string Titulo { get; set; }
        public string Mensagem { get; set; }

        public string OnClickEvent { get; set; }
        public _modalPromptExclusaoModel()
        {
            Titulo = "Excluir Registro";
            Mensagem = "Deseja continuar com a exclusão do registro?";
            OnClickEvent = "";
        }

        public void OnGet()
        {

        }
    }
}