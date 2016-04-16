using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class kategoriekle : System.Web.UI.Page
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
            Kategori kategori = new Kategori();
            kategori.k_ad = txtAd.Text;
            kategori.k_eklenme_tarihi = DateTime.Now;
            db.Kategoris.Add(kategori);
            db.SaveChanges();

            ClearForm cl = new ClearForm();
            cl.ClearTexts(Page);
            Response.Redirect("kategori.aspx");
        }
    }
}