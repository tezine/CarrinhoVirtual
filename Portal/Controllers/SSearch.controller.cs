#region Imports
using CarrinhoVirtual.Codes;
using CarrinhoVirtual.Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks; 
#endregion

namespace CarrinhoVirtual.Controllers {
    [ApiVersion("1")]
    [Route("api/v{version:apiVersion}/[controller]")]
    [AllowAnonymous]
    public class SSearchController: ControllerBase {

        #region Fields
        private readonly SSearchService searchService; 
        #endregion

        #region Constructor
        public SSearchController(SSearchService service) {
            searchService = service;
        } 
        #endregion

        #region Search
        [HttpPost("Search")]
        [AllowAnonymous]
        [RestInPeacePost(1, "List<EProduct> Search(body ESearch eSearch)")]
        public async Task<ActionResult<List<EProduct>>> Search([FromBody] ESearch eSearch) {
            eSearch.CreationDateUTC = DateTime.UtcNow;
            var result = await searchService.Search(eSearch);
            return Ok(result);
        }
        #endregion

    }
}
