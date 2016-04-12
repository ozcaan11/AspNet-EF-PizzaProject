using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pizza_Bootstarp.Entity_Conf;

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

            var yorum = from y in db.Yorums
                orderby y.y_yapma_tarihi descending
                select y;

                rpYorumlar.DataSource = yorum.ToList();
            if (!IsPostBack)
            {
                rpYorumlar.DataBind();
            }
            for (int i = 0; i < rpYorumlar.Items.Count; i++)
            {
                Label lblCount = (Label)rpYorumlar.Items[i].FindControl("lblCount");
                lblCount.Text = (i + 1).ToString();
            }
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
    }
}