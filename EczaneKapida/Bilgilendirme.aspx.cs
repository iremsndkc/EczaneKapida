using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EczaneKapida
{
    public partial class Bilgilendirme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SiparisBilgilendirme"]==null)
            {
                Response.Redirect("/Giris.aspx");
            }
            else
            {
                // sipariş oluşunca sessiondaki sipariş bilgilerini sıfırlıyoruz
                Session["SiparisDetay"] = null;
                Session["Siparis"] = null;
                Session["SepetKontrol"] = null;

                lblSipariSonuc.Text = Session["SiparisBilgilendirme"].ToString();
            }
            
        }
    }
}