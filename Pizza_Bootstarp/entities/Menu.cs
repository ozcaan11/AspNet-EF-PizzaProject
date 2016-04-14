namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Menu")]
    public partial class Menu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Menu()
        {
            Yorums = new HashSet<Yorum>();
        }

        [Key]
        public int m_id { get; set; }

        [StringLength(100)]
        public string m_baslik { get; set; }

        [StringLength(250)]
        public string m_aciklama { get; set; }

        public double? m_fiyat { get; set; }

        [StringLength(100)]
        public string m_resim { get; set; }

        public DateTime? m_eklenme_tarihi { get; set; }

        public DateTime? m_degistirilme_tarihi { get; set; }

        public int? k_id { get; set; }

        public virtual Kategori Kategori { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Yorum> Yorums { get; set; }
    }
}
