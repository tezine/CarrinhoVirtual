#region Imports
using CarrinhoVirtual.Controllers;
using CarrinhoVirtual.Entities;
using CarrinhoVirtual.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Pages {
    public class ClientesBase:ComponentBase {
        public List<EUser> clientes = new List<EUser>();
        [Inject] public SUsersService ClientsService { get; set; }
        [Inject] public NavigationManager navigationManager { get; set; }

        #region OnInitializedAsync
        protected override async Task OnInitializedAsync() {
            clientes = ClientsService.GetAll("fdkdhd");
        }
        #endregion

        public void OnToolbarClicked() {
            navigationManager.NavigateTo("ClienteInfo");
        }
    }
}
