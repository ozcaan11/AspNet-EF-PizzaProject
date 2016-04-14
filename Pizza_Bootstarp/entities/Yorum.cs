namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Yorum")]
    public partial class Yorum
    {
        [Key]
        public int y_id { get; set; }

        [Column(TypeName = "text")]
        public string y_icerik { get; set; }

        public bool? y_onay { get; set; }

        public DateTime? y_yapma_tarihi { get; set; }

        public int? u_id { get; set; }

        public int? m_id { get; set; }

        public virtual Menu Menu { get; set; }

        public virtual Uye Uye { get; set; }
    }
}
