using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class profilguncelle : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
        }

        protected void btnGuncelle_OnClicknClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            string _kadi = Session["admin"].ToString();
            var q = db.Admins.FirstOrDefault(x => x.ad_id == id);

            if (txtKullaniciAdi.Text == _kadi)
            {
                Admin admin = new Admin
                {
                    ad_id = q.ad_id,
                    ad_kullanici_adi = txtKullaniciAdi.Text,
                    ad_sifre = txtSifre.Text,
                    ad_adi = q.ad_adi,
                    ad_soyad = q.ad_soyad,
                    ad_email = q.ad_email,
                    ad_resim = q.ad_resim,
                    ad_eklenme_tarihi = q.ad_eklenme_tarihi
                };
                db.Admins.AddOrUpdate(admin);
                db.SaveChanges();
                Session["admin"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                var user = db.Admins.FirstOrDefault(u => u.ad_kullanici_adi == txtKullaniciAdi.Text);
                if (user != null)
                {
                    Admin admin = new Admin
                    {
                        ad_id = q.ad_id,
                        ad_kullanici_adi = txtKullaniciAdi.Text,
                        ad_sifre = txtSifre.Text,
                        ad_adi = q.ad_adi,
                        ad_soyad = q.ad_soyad,
                        ad_email = q.ad_email,
                        ad_resim = q.ad_resim,
                        ad_eklenme_tarihi = q.ad_eklenme_tarihi
                    };
                    db.Admins.AddOrUpdate(admin);
                    db.SaveChanges();
                    Session["admin"] = txtKullaniciAdi.Text;
                    Response.Redirect("anasayfa.aspx");
                }
                else
                {
                    MultiView1.ActiveViewIndex = 0;
                    txtKullaniciAdi.Focus();
                }
            }
        }
    }
}
