using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class giris : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] != null)
            {
                Response.Redirect("anasayfa.aspx");
            }
        }


        protected void btnGiris_OnClick(object sender, EventArgs e)
        {
            var user =
                db.Uyes.FirstOrDefault(x => x.u_kullanici_adi == txtKullaniciAdi.Text && x.u_sifre == txtSifre.Text);
            if (user != null)
            {
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }
            else
            {
                lblYanlis.Text = "Kullanıcı adı veya şifre yanlış!";
            }
        }
    }
}