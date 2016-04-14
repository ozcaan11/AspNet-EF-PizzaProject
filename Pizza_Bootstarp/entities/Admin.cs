namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Admin")]
    public partial class Admin
    {
        [Key]
        public int ad_id { get; set; }

        [StringLength(50)]
        public string ad_kullanici_adi { get; set; }

        [StringLength(50)]
        public string ad_sifre { get; set; }

        [StringLength(150)]
        public string ad_adi { get; set; }

        [StringLength(150)]
        public string ad_soyad { get; set; }

        [StringLength(150)]
        public string ad_email { get; set; }

        [StringLength(250)]
        public string ad_resim { get; set; }

        public DateTime? ad_eklenme_tarihi { get; set; }
    }
}
