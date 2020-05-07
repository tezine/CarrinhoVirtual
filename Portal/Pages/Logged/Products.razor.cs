#region Imports
using CarrinhoVirtual.Codes;
using CarrinhoVirtual.Controllers;
using CarrinhoVirtual.Entities;
using Frontend.Services;
using Microsoft.AspNetCore.Components;
using Syncfusion.Blazor.Inputs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Pages {
    public class ProdutosBase: BasePage {
        public List<EProduct> produtos = new List<EProduct>();
        [Inject] public SProductsBlazorService productsService { get; set; }

        #region OnInitializedAsync
        protected override async Task OnInitializedAsync() {
            produtos = await productsService.GetAll("ddff");
        }
        #endregion

        public void OnBtnAddClicked() {
            NavigationManager.NavigateTo(ClientDefines.RouteProductsEdit);
        }
          
        public void OnChange(UploadChangeEventArgs args) {
            foreach (var file in args.Files) {
                var path = @"path" + file.FileInfo.Name;
                //FileStream filestream = new FileStream(path, FileMode.Create, FileAccess.Write);
                //file.Stream.WriteTo(filestream);
                //filestream.Close();
                //file.Stream.Close();
            }
        }

        public void OnBtnImportCSVClicked() {

        }
    }
}
