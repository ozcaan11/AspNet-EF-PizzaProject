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

            var yorum = from d in db.Yorums
                orderby d.y_yapma_tarihi descending
                where d.m_id == id
                where d.y_onay == true
                select d;
            rpYorumlar.DataSource = yorum.ToList();
            
            if (!IsPostBack)
            {
                rpMenu.DataBind();
                rpAparatlar.DataBind();
                rpYorumlar.DataBind();
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

        protected void btnGonder_OnClick(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            if (Session["kullanici"] != null)
            {
                string k_adi = Session["kullanici"].ToString();
                var user = db.Uyes.FirstOrDefault(x => x.u_kullanici_adi == k_adi);
                if (user != null)
                {
                    Yorum yorum = new Yorum
                    {
                        y_icerik = txtYorum.Text,
                        y_yapma_tarihi = DateTime.Now,
                        y_onay = false,
                        m_id = id,
                        u_id = user.u_id
                    };
                    db.Yorums.Add(yorum);
                    db.SaveChanges();
                    txtYorum.Text = "";
                    MultiView1.ActiveViewIndex = 0;
                }

            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }
        }

        protected void rpYorumlar_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Button btnUye = (Button) e.Item.FindControl("btn_uye");
            Label lblUye = (Label) e.Item.FindControl("lbl_uye");
            Image img = (Image) e.Item.FindControl("image");
            try
            {
                int uy_id = Convert.ToInt32(btnUye.CommandArgument);
                var uye = db.Uyes.FirstOrDefault(x => x.u_id == uy_id);
                lblUye.Text = uye.u_kullanici_adi;
                img.ImageUrl = uye.u_resim;
            }
            catch (Exception)
            {
                lblUye.Text = "Anonim";
            }
        }
    }
}