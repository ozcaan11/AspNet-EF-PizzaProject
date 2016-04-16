using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Pizza_Bootstarp.entities;
using Menu = Pizza_Bootstarp.entities.Menu;

namespace Pizza_Bootstarp.admin
{
    public partial class menuekle : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
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
            DropDownListKategori.DataBind();
        }

        protected void btnEkle_OnClick(object sender, EventArgs e)
        {
            Menu menu = new Menu();
            menu.m_baslik = txtBaslik.Text;
            menu.m_aciklama = txtAciklama.Text;
            menu.m_fiyat = Convert.ToDouble(txtFiyat.Text);
            menu.m_eklenme_tarihi = DateTime.Now;
            menu.m_degistirilme_tarihi = DateTime.Now;
            fuResim.SaveAs(Server.MapPath("../files/images/menu_images/" + menu.m_baslik + "-" + menu.m_fiyat + "-" + fuResim.FileName));
            menu.m_resim = "../files/images/menu_images/" + menu.m_baslik + "-" + menu.m_fiyat + "-" + fuResim.FileName;
            menu.k_id = Convert.ToInt32(DropDownListKategori.SelectedItem.Value);
            db.Menus.Add(menu);

            ClearForm cl = new ClearForm();
            cl.ClearTexts(Page);
            db.SaveChanges();
            Response.Redirect("menu.aspx");
        }
    }
}