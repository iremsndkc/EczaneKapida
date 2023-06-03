using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veritabani.Entity;

namespace YonetimPaneli
{
    public partial class Giris : System.Web.UI.Page
    {
        EczaneKapidaEntities context = new EczaneKapidaEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtUserName.Text) || string.IsNullOrEmpty(txtPassword.Text))
            {
                lblHata.Text = "Bilgileri boş girmeyin!";
            }
            var yonetici = context.Yonetici.Where(x => x.KullaniciAdi == txtUserName.Text && x.Sifre == txtPassword.Text).FirstOrDefault();
            if (yonetici!=null)
            {
                // giriş yapan kullanıcının idsini session atıyoruz.
                Session["yoneticiId"] =yonetici.Id;
                Session["yoneticiYetki"] = yonetici.Yetki;
                Response.Redirect("/default.aspx");
            }
        }
    }
}