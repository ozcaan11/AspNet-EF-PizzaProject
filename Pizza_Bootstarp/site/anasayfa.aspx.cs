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
            rpSliderAlti.DataBind();
        }
    }
}