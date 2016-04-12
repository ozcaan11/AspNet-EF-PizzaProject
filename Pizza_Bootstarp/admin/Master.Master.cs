using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

namespace Pizza_Bootstarp.admin
{
    public partial class Master : System.Web.UI.MasterPage
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            MultiViewProfil.ActiveViewIndex = Session["admin"] != null ? 0 : 1;
            if (Session["admin"] == null)
            {
                MultiView1.ActiveViewIndex = 0;
            }
        }

        protected void btnCikis_OnClick(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Response.Redirect("anasayfa.aspx");
        }

        protected void btnGiris_OnClick(object sender, EventArgs e)
        {
            var admin =
                db.Admins.FirstOrDefault(x => x.ad_kullanici_adi == txtKullaniciAdi.Text && x.ad_sifre == txtSifre.Text);
            if (admin != null)
            {
                Session["admin"] = txtKullaniciAdi.Text;
                    Response.Redirect("anasayfa.aspx");
            }
        }
    }
}