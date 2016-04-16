using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class uyeekle : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
        }

        protected void btnEkle_OnClick(object sender, EventArgs e)
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

                if (fuResim.HasFile)
                {
                    fuResim.SaveAs(
                        Server.MapPath("../files/images/user_images/" + uye.u_kullanici_adi + "-" + fuResim.FileName));
                    uye.u_resim = "../files/images/user_images/" + uye.u_kullanici_adi + "-" + uye.u_kayit_tarihi + "-" +
                                  fuResim.FileName;

                }
                else
                {
                    uye.u_resim = "../files/images/user_images/uye.png";
                }

                uye.u_telefon = txtTelefon.Text;
                uye.u_adres = txtAdres.Text;
                uye.u_dogum_tarihi = Convert.ToDateTime(txtDt.Text);
                uye.u_kayit_tarihi = DateTime.Now;
                db.Uyes.Add(uye);
                db.SaveChanges();

                ClearForm cl = new ClearForm();
                cl.ClearTexts(Page);
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("uye.aspx");
            }
        }
    }
}