﻿using CarrinhoVirtual.Controllers;
using CarrinhoVirtual.Entities;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CarrinhoVirtual.Pages.Logged {
    public class TextosDigitadosBase: ComponentBase {
        public List<ESearch> textos = new List<ESearch>();
        [Inject] public SSearchService textosDigitadosService { get; set; }

        #region OnInitializedAsync
        protected override async Task OnInitializedAsync() {
            textos = textosDigitadosService.GetAll();
        }
        #endregion

    }
}
