#region Imports
using CarrinhoVirtual.Entities;
using CarrinhoVirtual.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Pages.Logged {

    public class ConfigBase:ComponentBase {
        public List<EAdminUser> adminUsers = new List<EAdminUser>();
        [Inject] public SAdminUsersService adminUsersService { get; set; }

        #region OnInitializedAsync
        protected override async Task OnInitializedAsync() {
            adminUsers =  adminUsersService.GetAll();
        }
        #endregion

        public void OnBtnSalvarClicked() {

        }

    }
}
