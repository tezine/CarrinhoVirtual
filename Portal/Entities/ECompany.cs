using System;
using System.ComponentModel.DataAnnotations.Schema;
using CarrinhoVirtual.Codes;


namespace CarrinhoVirtual.Entities {
    [RestInPeaceEntity]
    [Table("companies")]
    public class ECompany {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Phone { get; set; }
        public string Mobile { get; set; }
        public DateTime CreationDateUTC { get; set; }
        public DateTime ModificationDateUTC { get; set; }
    }
}