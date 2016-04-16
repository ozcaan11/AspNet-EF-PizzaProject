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

            var user = db.Uyes.FirstOrDefault(x => x.u_kullanici_adi == u_adi);
            image.ImageUrl = user.u_resim;


            rpUye.DataSource = usr.ToList();

            int userId = db.Uyes.FirstOrDefault(x => x.u_kullanici_adi == u_adi).u_id;
            var yorumlar = from da in db.Yorums.Take(10)
                where da.u_id == userId
                orderby da.y_yapma_tarihi descending
                select da;

            rpHareketDokumu.DataSource = yorumlar.ToList();
            if (!IsPostBack)
            {
            rpHareketDokumu.DataBind();
            rpUye.DataBind();
            }
        }

        protected void btnGuncelle_OnClick(object sender, EventArgs e)
        {
            string _kullanici = Session["kullanici"].ToString();

            var uye = db.Uyes.FirstOrDefault(x => x.u_kullanici_adi == _kullanici.ToString());
            int id = uye.u_id;

            Response.Redirect("profilguncelle.aspx?id="+id+"");
        }
    }
}