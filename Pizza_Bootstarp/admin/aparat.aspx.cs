using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

namespace Pizza_Bootstarp.admin
{
    public partial class aparat : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }
            var ap = from a in db.Aparats
                orderby a.a_eklenme_tarihi descending
                select a;
            rpAparatlar.DataSource = ap.ToList();
            if (!IsPostBack)
            {
                rpAparatlar.DataBind();
            }
            for (int i = 0; i < rpAparatlar.Items.Count; i++)
            {
                Label lblCount = (Label)rpAparatlar.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button) sender;
            int id = Convert.ToInt32(btn.CommandArgument);

            var api = db.Aparats.FirstOrDefault(x => x.a_id == id);
            db.Aparats.Remove(api);
            try
            {
                db.SaveChanges();
            }
            catch (Exception)
            {
                btn.Text = "Silinemez";
            }
            finally
            {
                Response.Redirect("aparat.aspx");
            }
        }

        protected void btnDuzenle_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int id = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("aparatduzenle.aspx?id="+id+"");
        }

        protected void btnEkle_OnClick(object sender, EventArgs e)
        {
            Aparat aparat = new Aparat();
            aparat.a_ad = txtAd.Text;
            aparat.a_fiyat = Convert.ToDouble(txtFiyat.Text);
            aparat.a_eklenme_tarihi=DateTime.Now;
            db.Aparats.Add(aparat);
            db.SaveChanges();
            Response.Redirect("aparat.aspx");
        }
    }
}