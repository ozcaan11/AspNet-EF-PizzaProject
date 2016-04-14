namespace Pizza_Bootstarp.entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyEntity : DbContext
    {
        public MyEntity()
            : base("name=MyEntity")
        {
        }

        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<Aparat> Aparats { get; set; }
        public virtual DbSet<Kategori> Kategoris { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Uye> Uyes { get; set; }
        public virtual DbSet<Yorum> Yorums { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Menu>()
                .HasMany(e => e.Yorums)
                .WithOptional(e => e.Menu)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Uye>()
                .Property(e => e.u_adres)
                .IsUnicode(false);

            modelBuilder.Entity<Uye>()
                .HasMany(e => e.Yorums)
                .WithOptional(e => e.Uye)
                .WillCascadeOnDelete();

            modelBuilder.Entity<Yorum>()
                .Property(e => e.y_icerik)
                .IsUnicode(false);
        }
    }
}
