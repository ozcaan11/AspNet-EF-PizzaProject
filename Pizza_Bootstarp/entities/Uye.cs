namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Uye")]
    public partial class Uye
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Uye()
        {
            Yorums = new HashSet<Yorum>();
        }

        [Key]
        public int u_id { get; set; }

        [StringLength(250)]
        public string u_kullanici_adi { get; set; }

        [StringLength(100)]
        public string u_sifre { get; set; }

        [StringLength(150)]
        public string u_ad { get; set; }

        [StringLength(150)]
        public string u_soyad { get; set; }

        [StringLength(150)]
        public string u_email { get; set; }

        [StringLength(250)]
        public string u_resim { get; set; }

        public DateTime? u_dogum_tarihi { get; set; }

        [Column(TypeName = "ntext")]
        public string u_adres { get; set; }

        [StringLength(50)]
        public string u_telefon { get; set; }

        public DateTime? u_kayit_tarihi { get; set; }

        public DateTime? u_degistirilme_tarihi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Yorum> Yorums { get; set; }
    }
}
