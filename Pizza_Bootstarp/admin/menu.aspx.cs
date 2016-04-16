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

            if (!IsPostBack)
            {
                var data = from m in db.Menus
                           orderby m.m_eklenme_tarihi descending
                           select m;
                rpMenuler.DataSource = data.ToList();



                if (!IsPostBack)
                {
                    rpMenuler.DataBind();
                }
                for (int i = 0; i < rpMenuler.Items.Count; i++)
                {
                    Label lblCount = (Label)rpMenuler.Items[i].FindControl("lblCount");
                    lblCount.Text = (i + 1).ToString();
                } 
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
            Button btn = (Button) sender;
            string arg = btn.CommandArgument;
            Response.Redirect("menuduzenle.aspx?id=" + arg + "");
        }


        protected void rpMenuler_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btnKat = (Button) e.Item.FindControl("btn_kat");
            Label lblKat = (Label) e.Item.FindControl("lbl_kat");
            try
            {

                int id = Convert.ToInt32(btnKat.CommandArgument);
                var kat = db.Kategoris.FirstOrDefault(x => x.k_id == id);
                lblKat.Text = kat.k_ad;
            }
            catch (Exception)
            {
                lblKat.Text = "Kategori bulunamadı";
            }
        }

        protected void btnYeniMenu_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("menuekle.aspx");
        }
    }
}