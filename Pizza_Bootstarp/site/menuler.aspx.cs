using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.site
{
    public partial class menuler : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            var menu = from d in db.Menus
                orderby d.m_eklenme_tarihi descending
                select d;

            rpMenuler.DataSource = menu.ToList();
            if (!IsPostBack)
            {
                rpMenuler.DataBind();
            }
        }

        protected void btnDetay_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("menudetay.aspx?id="+id+"");
        }
    }
}