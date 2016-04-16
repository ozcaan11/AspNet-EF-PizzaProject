using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

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
            string a = Session["admin"].ToString();
            int id = db.Admins.FirstOrDefault(x => x.ad_kullanici_adi == a).ad_id;

            Response.Redirect("profilguncelle.aspx?id="+id+"");
        }
    }
}