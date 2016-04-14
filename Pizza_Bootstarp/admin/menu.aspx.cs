using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;
using Menu = Pizza_Bootstarp.entities.Menu;

namespace Pizza_Bootstarp.admin
{
    public partial class menu : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }

            var data = from m in db.Menus
                select m;
            rpMenuler.DataSource = data.ToList();

            var kat = (from d in db.Kategoris
                       orderby d.k_eklenme_tarihi descending
                       select new
                       {
                           k_id = d.k_id,
                           k_ad = d.k_ad
                       }).ToList();
            DropDownListKategori.DataSource = kat;
            DropDownListKategori.DataTextField = "k_ad";
            DropDownListKategori.DataValueField = "k_id";

            if (!IsPostBack)
            {
               rpMenuler.DataBind(); 
            DropDownListKategori.DataBind();
            }
            for (int i = 0; i < rpMenuler.Items.Count; i++)
            {
                Label lblCount = (Label)rpMenuler.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }



        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int arg = Convert.ToInt32(btn.CommandArgument);

            Menu menu = new Menu();
            Menu m = db.Menus.Remove(db.Menus.FirstOrDefault(x => x.m_id == arg));
            db.SaveChanges();
            Response.Redirect("menu.aspx");
        }

        protected void btnDuzenle_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string arg = btn.CommandArgument;
            Response.Redirect("menuduzenle.aspx?id="+arg+"");
        }

        protected void btnEkle_OnClick(object sender, EventArgs e)
        {
            Menu menu = new Menu();
            menu.m_baslik = txtBaslik.Text;
            menu.m_aciklama = txtAciklama.Text;
            menu.m_fiyat = Convert.ToDouble(txtFiyat.Text);
            menu.m_eklenme_tarihi = DateTime.Now;
            menu.m_degistirilme_tarihi = DateTime.Now;
            menu.k_id = Convert.ToInt32(DropDownListKategori.SelectedItem.Value);
            db.Menus.Add(menu);
            db.SaveChanges();
            Response.Redirect("menu.aspx");
        }

        protected void rpMenuler_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btn_kat = (Button) e.Item.FindControl("btn_kat");
            Label lbl_kat = (Label) e.Item.FindControl("lbl_kat");
            int id = Convert.ToInt32(btn_kat.CommandArgument);
            var kat = db.Kategoris.FirstOrDefault(x => x.k_id == id);
            lbl_kat.Text = kat.k_ad;
        }
    }
}