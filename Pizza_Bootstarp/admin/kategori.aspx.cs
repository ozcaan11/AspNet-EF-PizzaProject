using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class kategori : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }

            var list = from k in db.Kategoris
                orderby k.k_eklenme_tarihi ascending
                select k;
            rpKategoriler.DataSource = list.ToList();
            if (!IsPostBack)
            {
                rpKategoriler.DataBind();
            }
            for (int i = 0; i < rpKategoriler.Items.Count; i++)
            {
                Label lblCount = (Label)rpKategoriler.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            var kat = db.Kategoris.FirstOrDefault(x => x.k_id == id);
            db.Kategoris.Remove(kat);
            db.SaveChanges();
            Response.Redirect("kategori.aspx");
        }

        protected void btnDuzenle_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("kategoriduzenle.aspx?id="+id+"");
        }

        protected void btnYeniKategori_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("kategoriekle.aspx");
        }
    }
}