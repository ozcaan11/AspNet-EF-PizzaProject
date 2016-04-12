using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

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
            var user = db.Admins.FirstOrDefault(u => u.ad_kullanici_adi == txtKullaniciAdi.Text);

            if (user != null)
            {
                Admin admin = new Admin();
                admin.ad_kullanici_adi = txtKullaniciAdi.Text;
                admin.ad_sifre = txtSifre.Text;
                db.Admins.AddOrUpdate(admin);
                db.SaveChanges();
                Session["admin"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }

        }
    }
}
