using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class yorum : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }

            #region repeater bölümü

            var onlayliYorum = from y in db.Yorums
                orderby y.y_yapma_tarihi descending
                where y.y_onay.Value == true
                select y;

            var onlaysizYorum = from y in db.Yorums
                orderby y.y_yapma_tarihi descending
                where y.y_onay.Value == false
                select y;

            rpOnayliYorumlar.DataSource = onlayliYorum.ToList();
            rpOnaysizYorumlar.DataSource = onlaysizYorum.ToList();
            if (!IsPostBack)
            {
                rpOnayliYorumlar.DataBind();
                rpOnaysizYorumlar.DataBind();
            }

            for (int i = 0; i < rpOnayliYorumlar.Items.Count; i++)
            {
                Label lblCount = (Label) rpOnayliYorumlar.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();


            }
            for (int i = 0; i < rpOnaysizYorumlar.Items.Count; i++)
            {
                Label lblCount = (Label) rpOnaysizYorumlar.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }

            #endregion
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            var yor = db.Yorums.FirstOrDefault(x => x.y_id == id);
            db.Yorums.Remove(yor);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }

        protected void btnYorumOnayla_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            var yorum = db.Yorums.FirstOrDefault(x => x.y_id == id);
            yorum.y_onay = true;
            db.Yorums.AddOrUpdate(yorum);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }

        protected void btnOnayKaldir_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            var yorum = db.Yorums.FirstOrDefault(x => x.y_id == id);
            yorum.y_onay = false;
            db.Yorums.AddOrUpdate(yorum);
            db.SaveChanges();
            Response.Redirect("yorum.aspx");
        }

        protected void rpOnayliYorumlar_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btnUye = (Button) e.Item.FindControl("btn_uye");
            Label lblUye = (Label) e.Item.FindControl("lbl_uye");
            Button btnMenu = (Button) e.Item.FindControl("btn_menu");
            Label lblMenu = (Label) e.Item.FindControl("lbl_menu");


            try
            {
                int id = Convert.ToInt32(btnUye.CommandArgument);
                var uye = db.Uyes.FirstOrDefault(x => x.u_id == id);
                lblUye.Text = uye.u_ad;

                int _id = Convert.ToInt32(btnMenu.CommandArgument);
                var menu = db.Menus.FirstOrDefault(x => x.m_id == _id);
                lblMenu.Text = menu.m_baslik;

                if (menu.m_baslik.Length > 25)
                {
                    lblMenu.Text = menu.m_baslik.Substring(0, 26) + " ...";
                }
                else
                {
                    lblMenu.Text = menu.m_baslik;
                }
            }
            catch (Exception)
            {
                lblMenu.Text = "Menü bulunamadı!";
                lblUye.Text = "Üye bulunamadı!";
            }
        }

        protected void rpOnaysizYorumlar_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btnUye = (Button) e.Item.FindControl("btn_uye");
            Label lblUye = (Label) e.Item.FindControl("lbl_uye");
            Button btnMenu = (Button) e.Item.FindControl("btn_menu");
            Label lblMenu = (Label) e.Item.FindControl("lbl_menu");


            try
            {
                int id = Convert.ToInt32(btnUye.CommandArgument);
                var uye = db.Uyes.FirstOrDefault(x => x.u_id == id);
                lblUye.Text = uye.u_ad;

                int _id = Convert.ToInt32(btnMenu.CommandArgument);
                var menu = db.Menus.FirstOrDefault(x => x.m_id == _id);

                if (menu.m_baslik.Length > 25)
                {
                    lblMenu.Text = menu.m_baslik.Substring(0, 26) + " ...";
                }
                else
                {
                    lblMenu.Text = menu.m_baslik;
                }
            }
            catch (Exception)
            {
                lblMenu.Text = "Menü bulunamadı!";
                lblUye.Text = "Üye bulunamadı!";
            }
        }

        protected void btnGoruntule_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            Response.Redirect("yorumdetay.aspx?id="+id+"");
        }
    }
}