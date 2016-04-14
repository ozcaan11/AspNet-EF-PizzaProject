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
    public partial class Master : System.Web.UI.MasterPage
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiViewProfil.ActiveViewIndex = Session["kullanici"] != null ? 0 : 1;
        }

        protected void btnGiris_OnClick(object sender, EventArgs e)
        {
            var user = db.Uyes.FirstOrDefault(u => u.u_kullanici_adi == txtKullaniciAdi.Text && u.u_sifre == txtSifre.Text);
            if (user != null)
            {
                Session["kullanici"] = txtKullaniciAdi.Text;
                Response.Redirect("anasayfa.aspx");
            }
        }

        protected void btnKaydol_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("kaydol.aspx");
        }

        protected void btnCikis_OnClick(object sender, EventArgs e)
        {
            Session["kullanici"] = null;
            Response.Redirect("anasayfa.aspx");
        }
    }
}
