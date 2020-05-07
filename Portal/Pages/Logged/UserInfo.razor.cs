#region Imports
using CarrinhoVirtual.Controllers;
using CarrinhoVirtual.Entities;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Pages.Logged {
    public class ClienteInfoBase:ComponentBase {
        public string clienteID = "";
        public EUser Client = new EUser();
        [Inject] public SUsersService ClientsService { get; set; }

        #region OnInitializedAsync
        protected override async Task OnInitializedAsync() {
            Client = ClientsService.GetByID(clienteID);  
        }
        #endregion
    }
}
