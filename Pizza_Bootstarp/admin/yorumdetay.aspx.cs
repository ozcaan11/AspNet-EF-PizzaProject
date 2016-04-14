using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class yorumdetay : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var yorum = from d in db.Yorums
                where d.y_id == id
                select d;

            var yrm = db.Yorums.FirstOrDefault(x => x.y_id == id);
            MultiView1.ActiveViewIndex = yrm.y_onay.Equals(true) ? 1 : 0;

            rpYorum.DataSource = yorum.ToList();
            rpYorum.DataBind();
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var yor = db.Yorums.FirstOrDefault(x => x.y_id == id);
            db.Yorums.Remove(yor);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }

        protected void btnOnayla_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var yorum = db.Yorums.FirstOrDefault(x => x.y_id == id);
            yorum.y_onay = true;
            db.Yorums.AddOrUpdate(yorum);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }

        protected void rpYorum_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btnUye = (Button) e.Item.FindControl("btn_uye");
            Button btnMenu = (Button) e.Item.FindControl("btn_menu");
            Label lblUye = (Label) e.Item.FindControl("lbl_uye");
            Label lblMenu = (Label) e.Item.FindControl("lbl_menu");

            try
            {
                int _uid = Convert.ToInt32(btnUye.CommandArgument);
                int _mid = Convert.ToInt32(btnMenu.CommandArgument);

                var uye = db.Uyes.FirstOrDefault(x => x.u_id == _uid);
                var menu = db.Menus.FirstOrDefault(x => x.m_id == _mid);

                lblUye.Text = uye.u_ad;
                lblMenu.Text = menu.m_baslik;
            }
            catch (Exception)
            {
                lblMenu.Text = "Menü bulunamadı!";
                lblUye.Text = "Üye bulunamadı!";
            }
        }

        protected void btnOnayKaldir_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);

            var yorum = db.Yorums.FirstOrDefault(x => x.y_id == id);
            yorum.y_onay = false;
            db.Yorums.AddOrUpdate(yorum);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }
    }
}