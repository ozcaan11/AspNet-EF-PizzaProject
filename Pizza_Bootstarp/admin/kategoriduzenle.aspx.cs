using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

namespace Pizza_Bootstarp.admin
{
    public partial class kategoriduzenle : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["id"]);
                var k = db.Kategoris.FirstOrDefault(x => x.k_id == id);
                txtAd.Text = k.k_ad;
            }

        }

        protected void btnKaydet_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            var kat = (from k in db.Kategoris
                where k.k_id == id
                select new
                {
                    date = k.k_eklenme_tarihi
                }).FirstOrDefault();
            
            Kategori kategori = new Kategori();
            kategori.k_ad = txtAd.Text;
            kategori.k_id = id;
            kategori.k_eklenme_tarihi = kat.date;
            db.Kategoris.AddOrUpdate(kategori);
            db.SaveChanges();
            Response.Redirect("kategori.aspx");
        }
    }
}