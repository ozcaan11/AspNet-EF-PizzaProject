using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class anasayfa : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            var menu = from d in db.Menus.Take(3)
                orderby d.m_eklenme_tarihi descending 
                select d;
            rpSliderAlti.DataSource = menu.ToList();
            if (!IsPostBack)
            {
                rpSliderAlti.DataBind();
            }
        }

        protected void btnIncele_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int id = Convert.ToInt32(btn.CommandArgument);

        }

        protected void btnYorum_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            if (Session["kullanici"]==null)
            {
            Response.Redirect("giris.aspx");
            }
        }
    }
}