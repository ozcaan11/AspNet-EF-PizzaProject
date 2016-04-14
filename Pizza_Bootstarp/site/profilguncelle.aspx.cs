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
        }

        protected void btnGuncelle_OnClick(object sender, EventArgs e)
        {

            var user = db.Uyes.FirstOrDefault(u => u.u_kullanici_adi == txtKullaniciAdi.Text);

            if (user != null)
            {
                MultiView1.ActiveViewIndex = 0;
                txtKullaniciAdi.Focus();
            }
            else
            {
                Uye uye = new Uye();
                uye.u_kullanici_adi = txtKullaniciAdi.Text;
                uye.u_sifre = txtSifre.Text;
                db.Uyes.AddOrUpdate(uye);
                db.SaveChanges();
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }
        }
    }
}
