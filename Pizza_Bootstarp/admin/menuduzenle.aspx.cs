using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;
using Menu = Pizza_Bootstarp.Entity_Conf.Menu;

namespace Pizza_Bootstarp.admin
{
    public partial class menuduzenle : System.Web.UI.Page
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
                var menu = db.Menus.FirstOrDefault(x => x.m_id == id);

                txtBaslik.Text = menu.m_baslik;
                txtAciklama.Text = menu.m_aciklama;
                txtFiyat.Text = menu.m_fiyat.ToString();
                DropDownListKategori.DataBind();
            }
        }

        protected void btnDuzenle_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var mn = (from m in db.Menus
                where m.m_id == id
                select new
                {
                    eklenme = m.m_eklenme_tarihi
                }).SingleOrDefault();


            Menu menu = new Menu();
            menu.m_id = id;
            menu.m_baslik = txtBaslik.Text;
            menu.m_aciklama = txtAciklama.Text;
            menu.m_fiyat = Convert.ToDouble(txtFiyat.Text);
            menu.m_eklenme_tarihi = mn.eklenme;
            menu.m_degistirilme_tarihi = DateTime.Now;
            menu.k_id = Convert.ToInt32(DropDownListKategori.SelectedItem.Value);
            db.Menus.AddOrUpdate(menu);
            db.SaveChanges();
            Response.Redirect("menu.aspx");
        }
    }
}