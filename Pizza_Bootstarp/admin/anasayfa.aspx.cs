using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class anasayfa : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] !=null)
            {
                lblMenu.Text = db.Menus.Count().ToString();
                lblKat.Text = db.Kategoris.Count().ToString();
                lblApa.Text = db.Aparats.Count().ToString();
                lblUye.Text = db.Uyes.Count().ToString();
                lblYor.Text = db.Yorums.Count().ToString();
            }
        }
    }
}