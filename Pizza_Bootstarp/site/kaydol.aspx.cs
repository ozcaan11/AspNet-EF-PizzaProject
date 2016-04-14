using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class kaydol : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnKaydol_OnClick(object sender, EventArgs e)
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
                uye.u_ad = txtAd.Text;
                uye.u_soyad = txtSoyad.Text;
                uye.u_email = txtEmail.Text;
                uye.u_resim = txtResim.Text;
                uye.u_telefon = txtTelefon.Text;
                uye.u_adres = txtAdres.Text;
                uye.u_dogum_tarihi = Convert.ToDateTime(txtDt.Text);
                uye.u_kayit_tarihi = DateTime.Now;
                db.Uyes.Add(uye);
                db.SaveChanges();
                Session["kullanici"] = txtKullaniciAdi.Text;
                ClearTexts(Page);
                Response.Redirect("anasayfa.aspx");
            }
        }

        private static void ClearTexts(Control Parent)
        {
            if (Parent is TextBox)
            {
                (Parent as TextBox).Text = String.Empty;
            }
            else
            {
                foreach (Control control in Parent.Controls)
                {
                    ClearTexts(control);
                }
            }
        }
    }
}