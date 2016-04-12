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
    public partial class profil : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            string a = Session["admin"].ToString();
            var admin = from d in db.Admins
                where d.ad_kullanici_adi == a
                select d;

            rpAdmin.DataSource = admin.ToList();
            rpAdmin.DataBind();
        }

        protected void btnGuncelle_OnClick(object sender, EventArgs e)
        {
            //Response.Redirect("profilguncelle.aspx");
            btnGuncelle.Text = "Admin profilinde güncelleme yapılamıyor";
        }
    }
}