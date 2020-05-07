#region Imports
using CarrinhoVirtual.Codes;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Pages {
    public class BasePage: ComponentBase {
        [Inject] public HttpClient httpClient { get; set; }
        [Inject] public NavigationManager NavigationManager { get; set; }

        protected override void OnInitialized() {
            base.OnInitialized();
            //httpClient.BaseAddress = new Uri(NavigationManager.BaseUri);
            httpClient.BaseAddress = new Uri(SDefines.BaseURL);
        }
    }
}
