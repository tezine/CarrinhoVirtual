﻿using CarrinhoVirtual.Codes;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace CarrinhoVirtual.Entities {
    [RestInPeaceEntity]
    [Table("users")]
    public class EUser {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Mobile { get; set; }
        public DateTime CreationDateUTC { get; set; }
        public DateTime ModificationDateUTC { get; set; }
    }
}
