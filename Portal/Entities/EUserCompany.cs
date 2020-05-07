using CarrinhoVirtual.Codes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace CarrinhoVirtual.Entities {
    [RestInPeaceEntity]
    [Table("users_companies")]
    public class EUserCompany {
        public string Id { get; set; }
        public string UserId { get; set; }
        public string CompanyId { get; set; }

        [NotMapped]
        public string CompanyName { get; set; }
        public DateTime CreationDateUTC { get; set; }
        public DateTime? ModificationDateUTC { get; set; }
    }
}
