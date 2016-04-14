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
    public partial class profil : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["kullanici"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            string u_adi = Session["kullanici"].ToString();

            var usr = from d in db.Uyes
                where d.u_kullanici_adi == u_adi
                select d;

            rpUye.DataSource = usr.ToList();
            rpUye.DataBind();
        }

        protected void btnGuncelle_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("profilguncelle.aspx");
        }
    }
}