using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class aparatekle : System.Web.UI.Page
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
            
            if (Page.IsValid)
            {
                Aparat aparat = new Aparat();
                aparat.a_ad = txtAd.Text;
                aparat.a_fiyat = Convert.ToDouble(txtFiyat.Text);
                aparat.a_eklenme_tarihi = DateTime.Now;
                db.Aparats.Add(aparat);
                db.SaveChanges();

                ClearForm cl = new ClearForm();
                cl.ClearTexts(Page);
                Response.Redirect("aparat.aspx");
            }
        }
    }
}