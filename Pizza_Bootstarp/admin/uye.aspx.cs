using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

namespace Pizza_Bootstarp.admin
{
    public partial class uye : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=L50A1D2;Initial Catalog=PizzaProject_1;Integrated Security=True");
        MyEntity db = new MyEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }

            var uye = from u in db.Uyes
                select u;
            rpUyeler.DataSource = uye.ToList();
            rpUyeler.DataBind();
            for (int i = 0; i < rpUyeler.Items.Count; i++)
            {
                Label lblCount = (Label) rpUyeler.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btnSil = (sender as Button);
            int cmdArg = Convert.ToInt32(btnSil.CommandArgument);
            var uye = db.Uyes.Remove(db.Uyes.FirstOrDefault(x => x.u_id == cmdArg));
            db.SaveChanges();
            Response.Redirect("uye.aspx");
        }

        protected void btnYeniUye_OnClick(object sender, EventArgs e)
        {
            
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
                uye.u_resim = txtResim.Text;
                uye.u_telefon = txtTelefon.Text;
                uye.u_adres = txtAdres.Text;
                uye.u_dogum_tarihi = Convert.ToDateTime(txtDt.Text);
                uye.u_kayit_tarihi = DateTime.Now;
                db.Uyes.Add(uye);
                db.SaveChanges();
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("uye.aspx");
            }
        }
    }
}