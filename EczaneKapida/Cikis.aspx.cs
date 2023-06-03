using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EczaneKapida
{
    public partial class Cikis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["HastaId"] = null;
            Session["Siparis"] = null;
            Session["SiparisDetay"] = null;
            Response.Redirect("/Giris.aspx");
        }
    }
}