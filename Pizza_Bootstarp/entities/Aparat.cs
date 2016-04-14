namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Aparat")]
    public partial class Aparat
    {
        [Key]
        public int a_id { get; set; }

        [StringLength(250)]
        public string a_ad { get; set; }

        public DateTime? a_degistirlme_tarihi { get; set; }

        public DateTime? a_eklenme_tarihi { get; set; }

        public double? a_fiyat { get; set; }
    }
}
