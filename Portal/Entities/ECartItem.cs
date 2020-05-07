using CarrinhoVirtual.Codes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CarrinhoVirtual.Entities {
    [RestInPeaceEntity]
    public class ECartItem {
        public string Id { get; set; }
        public string Name { get; set; }
        public Decimal Amount { get; set; }
        public Decimal UnitPrice { get; set; }
        public Decimal TotalPrice { get; set; }
    }
}
