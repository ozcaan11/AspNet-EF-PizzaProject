using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.entities;

namespace Pizza_Bootstarp.admin
{
    public partial class uye : System.Web.UI.Page
    {
        MyEntity db = new MyEntity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("anasayfa.aspx");
            }

            var uye = from u in db.Uyes
                select u;
            rpUyeler.DataSource = uye.ToList();
            rpUyeler.DataBind();
            for (int i = 0; i < rpUyeler.Items.Count; i++)
            {
                Label lblCount = (Label) rpUyeler.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }
        }

        protected void btnSil_OnClick(object sender, EventArgs e)
        {
            Button btnSil = (sender as Button);
            int cmdArg = Convert.ToInt32(btnSil.CommandArgument);
            var uye = db.Uyes.Remove(db.Uyes.FirstOrDefault(x => x.u_id == cmdArg));
            db.SaveChanges();
            Response.Redirect("uye.aspx");
        }

        protected void btnYeniUye_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("uyeekle.aspx");
        }
    }
}
