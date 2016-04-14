using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class aparatduzenle : System.Web.UI.Page
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
                var a = db.Aparats.FirstOrDefault(x => x.a_id == id);
                txtAd.Text = a.a_ad;
                txtFiyat.Text = a.a_fiyat.ToString();
            }
        }

        protected void btnKaydet_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            var ap = (from k in db.Aparats
                       where k.a_id == id
                       select new
                       {
                           date = k.a_eklenme_tarihi
                       }).FirstOrDefault();

            Aparat aparat = new Aparat();
            aparat.a_ad = txtAd.Text;
            aparat.a_fiyat = Convert.ToDouble(txtFiyat.Text);
            aparat.a_id = id;
            aparat.a_eklenme_tarihi = ap.date;
            db.Aparats.AddOrUpdate(aparat);
            db.SaveChanges();
            Response.Redirect("aparat.aspx");
        }
    }
}