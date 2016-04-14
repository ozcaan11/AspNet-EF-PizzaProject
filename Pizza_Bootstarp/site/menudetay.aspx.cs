using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class menudetay : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            var menu = from d in db.Menus
                where d.m_id == id
                select d;
            resim.ImageUrl = db.Menus.FirstOrDefault(x => x.m_id == id).m_resim;
            rpMenu.DataSource = menu.ToList();

            var aparat = from d in db.Aparats
                select d;
            rpAparatlar.DataSource = aparat.ToList();
            

            if (!IsPostBack)
            {
                rpMenu.DataBind();
                rpAparatlar.DataBind();
            }

        }

        protected void rpMenu_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btn = (Button)e.Item.FindControl("btnKat");
            Label lbl = (Label)e.Item.FindControl("lblKat");
            try
            {
                int id = Convert.ToInt32(btn.CommandArgument);
                var kat = db.Kategoris.FirstOrDefault(x => x.k_id == id);
                lbl.Text = kat.k_ad;
            }
            catch (Exception)
            {
                lbl.Text = "Kategori bulunamadı!";
            }
        }
    }
}