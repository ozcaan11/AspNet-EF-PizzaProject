using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class profilguncelle : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                txtKullaniciAdi.Text = db.Uyes.FirstOrDefault(x => x.u_id == id).u_kullanici_adi;
            }
        }

        protected void btnGuncelle_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            var q = db.Uyes.FirstOrDefault(x => x.u_id == id);
            string eski_ad = q.u_kullanici_adi;

            if (txtKullaniciAdi.Text == eski_ad)
            {
                Uye uye = new Uye
                {
                    u_id = q.u_id,
                    u_kullanici_adi = txtKullaniciAdi.Text,
                    u_sifre = txtSifre.Text,
                    u_ad = q.u_ad,
                    u_soyad = q.u_soyad,
                    u_email = q.u_email,
                    u_resim = q.u_resim,
                    u_dogum_tarihi = q.u_dogum_tarihi,
                    u_adres = q.u_adres,
                    u_telefon = q.u_telefon,
                    u_kayit_tarihi = q.u_kayit_tarihi,
                    u_degistirilme_tarihi = DateTime.Now
                };
                db.Uyes.AddOrUpdate(uye);
                db.SaveChanges();

                ClearForm cl = new ClearForm();
                cl.ClearTexts(Page);
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                var user = db.Uyes.FirstOrDefault(u => u.u_kullanici_adi == txtKullaniciAdi.Text);
                if (user != null)
                {
                    MultiView1.ActiveViewIndex = 0;
                    txtKullaniciAdi.Focus();
                }
                else
                {
                    Uye uye = new Uye
                    {
                        u_id = q.u_id,
                        u_kullanici_adi = txtKullaniciAdi.Text,
                        u_sifre = txtSifre.Text,
                        u_ad = q.u_ad,
                        u_soyad = q.u_soyad,
                        u_email = q.u_email,
                        u_resim = q.u_resim,
                        u_dogum_tarihi = q.u_dogum_tarihi,
                        u_adres = q.u_adres,
                        u_telefon = q.u_telefon,
                        u_kayit_tarihi = q.u_kayit_tarihi,
                        u_degistirilme_tarihi = DateTime.Now
                    };
                    db.Uyes.AddOrUpdate(uye);
                    db.SaveChanges();

                    ClearForm cl = new ClearForm();
                    cl.ClearTexts(Page);
                    Session["kullanici"] = txtKullaniciAdi.Text;
                    Response.Redirect("anasayfa.aspx");
                }
            }
        }
    }
}
