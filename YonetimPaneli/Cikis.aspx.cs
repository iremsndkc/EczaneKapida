using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YonetimPaneli
{
    public partial class Cikis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["yoneticiId"] = null;
            Session["yoneticiYetki"] = null;
            Response.Redirect("/Giris.aspx");
        }
    }
}